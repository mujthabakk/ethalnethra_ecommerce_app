import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/models/catalog/catalog_product.dart';
import '../../core/models/catalog/product_detail_dto.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_network_image.dart';
import 'v2_assets.dart';

/// Figma Product Details — exact layout (#0E5A03 / #5AA000).
class V2ProductDetailsScreen extends ConsumerStatefulWidget {
  const V2ProductDetailsScreen({
    super.key,
    this.productId,
    this.title = '',
    this.image,
    this.price = 0,
    this.oldPrice = 0,
    this.weight = '',
  });

  final String? productId;
  final String title;
  final String? image;
  final int price;
  final int oldPrice;
  final String weight;

  @override
  ConsumerState<V2ProductDetailsScreen> createState() =>
      _V2ProductDetailsScreenState();
}

class _V2ProductDetailsScreenState extends ConsumerState<V2ProductDetailsScreen> {
  static const _darkGreen = Color(0xFF0E5A03);
  static const _lime = Color(0xFF5AA000);

  int _qty = 1;
  int _page = 0;
  bool _liked = false;
  bool _adding = false;

  String _money(num value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.productId;
    final detailAsync = id == null || id.isEmpty
        ? const AsyncValue<ProductDetailDto>.data(
            ProductDetailDto(
              id: '',
              name: '',
              price: 0,
              ourPrice: 0,
              finalPrice: 0,
              displayPrice: 0,
              preorderAvailable: false,
              hasDiscount: false,
              discountPercentage: 0,
              imageUrl: '',
              weight: '',
              category: '',
              stock: 0,
            ),
          )
        : ref.watch(productDetailProvider(id));
    final detail = detailAsync.value;
    final title = (detail != null && detail.name.isNotEmpty)
        ? detail.name
        : widget.title;
    final weight = (detail != null && detail.weight.isNotEmpty)
        ? detail.weight
        : widget.weight;
    final price = detail?.displayPrice ?? widget.price.toDouble();
    final oldPrice = detail?.price ?? widget.oldPrice.toDouble();
    final images = <String>[
      if (detail != null && detail.imageUrl.isNotEmpty) detail.imageUrl,
      if (detail != null) ...detail.images.where((e) => e.isNotEmpty),
      if ((widget.image ?? '').isNotEmpty) widget.image!,
    ];
    final similar = detail == null || detail.category.isEmpty
        ? const <CatalogProduct>[]
        : ref
                .watch(
                  catalogQueryProvider(CatalogQuery(category: detail.category)),
                )
                .value
                ?.where((item) => item.id != detail.id)
                .take(8)
                .toList() ??
            const <CatalogProduct>[];

    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _buildTopBar()),
                  if (detailAsync.isLoading)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  SliverToBoxAdapter(child: _buildHero(images)),
                  SliverToBoxAdapter(child: _buildInfo(title, weight, price, oldPrice, detail)),
                  SliverToBoxAdapter(child: _buildFeatures()),
                  SliverToBoxAdapter(child: _buildDescription(detail?.description)),
                  SliverToBoxAdapter(child: _buildNutritions()),
                  SliverToBoxAdapter(child: _buildReview()),
                  SliverToBoxAdapter(child: _buildSimilar(similar)),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 110 + bottomPad),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomBar(bottomPad, detail),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
      child: Row(
        children: [
          _circleIcon(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _circleIcon(
            bg: const Color(0xFFEAF6E0),
            onTap: () => setState(() => _liked = !_liked),
            child: Image.asset(
              V2Assets.prodDetailHeart,
              width: 18,
              height: 16,
              color: _darkGreen,
              colorBlendMode: BlendMode.srcIn,
              errorBuilder: (_, __, ___) => Icon(
                _liked ? Icons.favorite : Icons.favorite_border,
                size: 20,
                color: _darkGreen,
              ),
            ),
          ),
          const SizedBox(width: 10),
          _circleIcon(
            onTap: () {},
            child: Image.asset(
              V2Assets.prodDetailShare,
              width: 16,
              height: 18,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.ios_share_rounded,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon({
    required Widget child,
    required VoidCallback onTap,
    Color bg = const Color(0xFFF2F2F2),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Widget _buildHero(List<String> images) {
    final count = images.isEmpty ? 1 : images.length;
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: PageView.builder(
            itemCount: count,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: AppImage(
                path: images.isEmpty ? '' : images[i],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (i) {
            final active = _page == i;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: active ? _lime : const Color(0xFFD0D0D0),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildInfo(
    String title,
    String weight,
    double price,
    double oldPrice,
    ProductDetailDto? detail,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (context.canPop()) context.pop();
            },
            child: Text(
              detail == null || detail.category.isEmpty
                  ? 'Product'
                  : 'Explore ${detail.category}  >',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _lime,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title.isEmpty ? 'Product' : title,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ),
              Text(
                (detail?.stock ?? 0) > 0 ? 'In Stock' : 'Out of stock',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _darkGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            weight,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF9E9E9E),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '₹ ${_money(price)}',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '₹ ${_money(oldPrice)}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xFFB0B0B0),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures() {
    Widget item(IconData icon, String label) {
      return Expanded(
        child: Column(
          children: [
            Icon(icon, size: 22, color: Colors.black87),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFEEEEEE)),
            bottom: BorderSide(color: Color(0xFFEEEEEE)),
          ),
        ),
        child: Row(
          children: [
            item(Icons.local_shipping_outlined, 'Fast Delivery'),
            Container(width: 1, height: 36, color: const Color(0xFFE5E5E5)),
            item(Icons.star_border_rounded, '4.5 Rating'),
            Container(width: 1, height: 36, color: const Color(0xFFE5E5E5)),
            item(Icons.headset_mic_outlined, '24/7 Support'),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(String? description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Detail',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            (description == null || description.trim().isEmpty)
                ? 'No description from the store yet.'
                : description,
            style: GoogleFonts.poppins(
              fontSize: 13,
              height: 1.45,
              color: const Color(0xFF7A7A7A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritions() {
    return _listRow(
      title: 'Nutritions',
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '500kcal',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF6B6B6B),
          ),
        ),
      ),
    );
  }

  Widget _buildReview() {
    return _listRow(
      title: 'Review',
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5,
          (_) => const Icon(Icons.star_rounded, size: 18, color: Color(0xFFFFC107)),
        ),
      ),
    );
  }

  Widget _listRow({required String title, required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          trailing,
          const Icon(Icons.chevron_right_rounded, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildSimilar(List<CatalogProduct> similar) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
          child: Text(
            'Similar Products',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: similar.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final s = similar[i];
              return GestureDetector(
                onTap: () => context.push(
                  AppRouter.v2ProductDetails,
                  extra: {'id': s.id},
                ),
                child: _SimilarCard(
                  image: s.imageUrl,
                  name: s.name,
                  bg: const Color(0xFFF4F7EF),
                  onTap: () {
                    context.push(
                      AppRouter.v2ProductDetails,
                      extra: {'id': s.id},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(double bottomPad, ProductDetailDto? detail) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 14, 16, 14 + bottomPad * 0.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Qty: +  1  −  (Figma order)
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF6E0),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                _qtyBtn(
                  icon: Icons.add,
                  filled: false,
                  onTap: () => setState(() => _qty++),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$_qty',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _qtyBtn(
                  icon: Icons.remove,
                  filled: true,
                  onTap: () {
                    if (_qty > 1) setState(() => _qty--);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 52,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [_lime, _darkGreen],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(33),
                    onTap: _adding
                        ? null
                        : () async {
                            final id = detail?.id ?? widget.productId;
                            if (id == null || id.isEmpty) return;
                            setState(() => _adding = true);
                            try {
                              await ref
                                  .read(cartNotifierProvider.notifier)
                                  .addToCart(id, quantity: _qty);
                              if (context.mounted) {
                                context.push(AppRouter.v2Cart);
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())),
                                );
                              }
                            } finally {
                              if (mounted) setState(() => _adding = false);
                            }
                          },
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn({
    required IconData icon,
    required bool filled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? _darkGreen : Colors.white,
          border: filled ? null : Border.all(color: Colors.white),
          boxShadow: filled
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 4,
                  ),
                ],
        ),
        child: Icon(
          icon,
          size: 18,
          color: filled ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}

class _SimilarCard extends StatelessWidget {
  const _SimilarCard({
    required this.image,
    required this.name,
    required this.bg,
    required this.onTap,
  });

  final String image;
  final String name;
  final Color bg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 148,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(path: image, fit: BoxFit.cover),
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE57373),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '10 % OFF',
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.favorite,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        '500 g',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹ 20',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '₹ 25',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₹4/100 g',
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5AA000),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
