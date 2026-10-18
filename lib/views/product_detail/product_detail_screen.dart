import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/mappers/product_detail_mapper.dart';
import '../../core/models/catalog/product_detail_dto.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/providers/favorites_providers.dart';
import '../../core/utils/auth_guard.dart';
import '../../core/utils/custom_order_quantity.dart';
import '../../core/widgets/app_network_image.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  double _quantity = 1;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _quantity = (p.isCustomOrder || p.isGramWise)
        ? CustomOrderQuantity.initial(isGramWise: p.isGramWise)
        : 1;
  }

  void _incrementQuantity(ProductModel product) {
    final weighted = product.isCustomOrder || product.isGramWise;
    setState(() {
      _quantity = weighted
          ? CustomOrderQuantity.increment(
              _quantity,
              isGramWise: product.isGramWise,
            )
          : _quantity + 1;
    });
  }

  void _decrementQuantity(ProductModel product) {
    final weighted = product.isCustomOrder || product.isGramWise;
    if (weighted) {
      final next = CustomOrderQuantity.decrement(
        _quantity,
        isGramWise: product.isGramWise,
      );
      if (next == null) return;
      setState(() => _quantity = next);
    } else if (_quantity > 1) {
      setState(() => _quantity = _quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final detailAsync = ref.watch(productDetailProvider(widget.product.id));
    final detail = detailAsync.valueOrNull;

    final merged = detail != null
        ? detail.toProductModel(widget.product)
        : widget.product;

    final showInstant = merged.instantOrderAvailable;
    final showPreorder = merged.preorderAvailable;
    final bottomButtonCount =
        (showInstant ? 1 : 0) + (showPreorder ? 1 : 0);

    final productImages = _imageUrls(detail, merged.imagePath);

    final favList = ref.watch(favoritesNotifierProvider).valueOrNull ?? [];
    final isFavorite = favoriteIdsContain(favList, widget.product.id);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkBackground,
            size: 22,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.ios_share,
              color: AppColors.darkBackground,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 371.4,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                        items: productImages.map((imagePath) {
                          return AppImage(
                            path: imagePath,
                            height: 200,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: productImages.asMap().entries.map((entry) {
                          return Container(
                            width: _currentImageIndex == entry.key ? 15 : 4,
                            height: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: _currentImageIndex == entry.key
                                  ? AppColors.primary
                                  : AppColors.borderGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              merged.displayName,
                              style: AppTextStyles.productDetailTitle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: detailAsync.isLoading
                                ? null
                                : () async {
                                    if (!await ensureLoggedIn(context, ref)) {
                                      return;
                                    }
                                    try {
                                      await ref
                                          .read(favoritesNotifierProvider
                                              .notifier)
                                          .toggleFavorite(widget.product.id);
                                    } catch (e) {
                                      if (context.mounted) {
                                        await showCartOrAuthError(context, e);
                                      }
                                    }
                                  },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? Colors.red
                                  : const Color(0xFF7C7C7C),
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            merged.pricePerUnitLabel,
                            style: AppTextStyles.productDetailSubtitle,
                          ),
                          if (merged.discountLabel.isNotEmpty) ...[
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.shade600,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                merged.discountLabel,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        merged.stockLabel,
                        style: AppTextStyles.productDetailDescription.copyWith(
                          color: merged.isInStock
                              ? const Color(0xFF7C7C7C)
                              : Colors.red.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (detailAsync.isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: LinearProgressIndicator(minHeight: 2),
                        ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          _buildQuantityButton(Icons.remove, () {
                            _decrementQuantity(merged);
                          }, color: const Color(0xFF7C7C7C)),
                          const SizedBox(width: 20),
                          Container(
                            constraints: const BoxConstraints(minWidth: 56),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE2E2E2),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                (merged.isCustomOrder || merged.isGramWise)
                                    ? CustomOrderQuantity.formatLabel(
                                        _quantity,
                                        merged.unit,
                                        isGramWise: merged.isGramWise,
                                      )
                                    : _quantity.toInt().toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          _buildQuantityButton(Icons.add, () {
                            _incrementQuantity(merged);
                          }, color: AppColors.primary),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (merged.showDiscount)
                                Text(
                                  '₹${(merged.listPrice * _quantity).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF7C7C7C),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              Text(
                                '₹${(merged.price * _quantity).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBackground,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const _CustomDivider(),
                      _buildExpansionTile(
                        'Product Detail',
                        merged.longDescription,
                      ),
                      const _CustomDivider(),
                      _buildNutritionSection(detail),
                      const _CustomDivider(),
                      _buildReviewSection(detail),
                      SizedBox(
                        height: bottomButtonCount == 2
                            ? 200
                            : bottomButtonCount == 1
                                ? 120
                                : 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (bottomButtonCount > 0)
            Positioned(
              bottom: 30,
              left: 25,
              right: 25,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showInstant) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!await ensureLoggedIn(context, ref)) return;
                          try {
                            await ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                  merged.id,
                                  quantity: _quantity,
                                  preorder: false,
                                );
                            if (context.mounted) {
                              await showAddedToCartPopup(
                                context,
                                productName: merged.displayName,
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              await showCartOrAuthError(context, e);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.preOrderOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add To Instant Basket',
                          style: AppTextStyles.productDetailButton,
                        ),
                      ),
                    ),
                  ],
                  if (showInstant && showPreorder) const SizedBox(height: 12),
                  if (showPreorder) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!await ensureLoggedIn(context, ref)) return;
                          try {
                            await ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                  merged.id,
                                  quantity: _quantity,
                                  preorder: true,
                                );
                            if (context.mounted) {
                              await showAddedToCartPopup(
                                context,
                                productName: merged.displayName,
                                preorder: true,
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              await showCartOrAuthError(context, e);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add To Pre-order Basket',
                          style: AppTextStyles.productDetailButton,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<String> _imageUrls(ProductDetailDto? detail, String fallback) {
    if (detail != null && detail.images.isNotEmpty) {
      return detail.images;
    }
    return [fallback];
  }

  Widget _buildNutritionSection(ProductDetailDto? detail) {
    final list = detail?.nutritions ?? [];
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          'Nutrition',
          style: AppTextStyles.productDetailSectionHeader,
        ),
        tilePadding: EdgeInsets.zero,
        iconColor: AppColors.darkBackground,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: list.isEmpty
                ? Text(
                    'No nutrition information available.',
                    style: AppTextStyles.productDetailDescription,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              e is Map
                                  ? e.entries
                                      .map((x) => '${x.key}: ${x.value}')
                                      .join(', ')
                                  : e.toString(),
                              style: AppTextStyles.productDetailDescription,
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSection(ProductDetailDto? detail) {
    final reviews = detail?.reviews ?? [];
    final count = detail?.reviewCount ?? 0;
    final rating = detail?.rating;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          'Reviews',
          style: AppTextStyles.productDetailSectionHeader,
        ),
        tilePadding: EdgeInsets.zero,
        iconColor: AppColors.darkBackground,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Text(
                  count == 0 ? 'No ratings yet' : '$count review(s)',
                  style: AppTextStyles.productDetailDescription,
                ),
                const Spacer(),
                if (rating != null)
                  Row(
                    children: List.generate(5, (i) {
                      final v = rating - i;
                      final fill = v >= 1 ? 1.0 : (v > 0 ? v : 0.0);
                      return Icon(
                        fill >= 1
                            ? Icons.star
                            : (fill > 0 ? Icons.star_half : Icons.star_border),
                        color: const Color(0xFFF3603F),
                        size: 18,
                      );
                    }),
                  ),
              ],
            ),
          ),
          if (reviews.isEmpty)
            Text(
              'No reviews yet.',
              style: AppTextStyles.productDetailDescription,
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reviews
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        e is Map
                            ? e.entries
                                .map((x) => '${x.key}: ${x.value}')
                                .join('\n')
                            : e.toString(),
                        style: AppTextStyles.productDetailDescription,
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
    IconData icon,
    VoidCallback onPressed, {
    required Color color,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, color: color, size: 28),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title, style: AppTextStyles.productDetailSectionHeader),
        tilePadding: EdgeInsets.zero,
        iconColor: AppColors.darkBackground,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(content, style: AppTextStyles.productDetailDescription),
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFE2E2E2).withValues(alpha: 0.7),
    );
  }
}
