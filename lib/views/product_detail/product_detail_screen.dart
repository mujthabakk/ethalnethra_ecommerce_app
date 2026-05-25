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
import '../../core/widgets/app_network_image.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;
  int _currentImageIndex = 0;

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
                        items: productImages.asMap().entries.map((entry) {
                          final imagePath = entry.value;
                          final img = AppImage(
                            path: imagePath,
                            height: 200,
                            fit: BoxFit.contain,
                          );
                          return entry.key == 0
                              ? Hero(
                                  tag: 'product_${widget.product.id}',
                                  child: img,
                                )
                              : img;
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
                            ),
                          ),
                          IconButton(
                            onPressed: detailAsync.isLoading
                                ? null
                                : () async {
                                    try {
                                      await ref
                                          .read(favoritesNotifierProvider
                                              .notifier)
                                          .toggleFavorite(widget.product.id);
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('$e'),
                                            behavior:
                                                SnackBarBehavior.floating,
                                          ),
                                        );
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
                      const SizedBox(height: 5),
                      Text(
                        merged.description,
                        style: AppTextStyles.productDetailSubtitle,
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
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          }, color: const Color(0xFF7C7C7C)),
                          const SizedBox(width: 20),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE2E2E2),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          _buildQuantityButton(Icons.add, () {
                            setState(() {
                              quantity++;
                            });
                          }, color: AppColors.primary),
                          const Spacer(),
                          Text(
                            '₹${(merged.price * quantity).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBackground,
                            ),
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
                          try {
                            await ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                  merged.id,
                                  quantity: quantity,
                                  preorder: false,
                                );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${merged.displayName} added to instant basket!',
                                  ),
                                  duration: const Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$e'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
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
                          try {
                            await ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(
                                  merged.id,
                                  quantity: quantity,
                                  preorder: true,
                                );
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${merged.displayName} added to pre-order basket!',
                                  ),
                                  duration: const Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$e'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
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
