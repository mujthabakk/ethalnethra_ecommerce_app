import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';

/// Figma category product listing (sidebar + 2-col product cards).
class V2CategoryProductsScreen extends StatefulWidget {
  const V2CategoryProductsScreen({
    super.key,
    this.initialCategory = 'Vegetables',
  });

  final String initialCategory;

  @override
  State<V2CategoryProductsScreen> createState() =>
      _V2CategoryProductsScreenState();
}

class _V2CategoryProductsScreenState extends State<V2CategoryProductsScreen> {
  static const _sidebar = [
    'Vegetables',
    'Fruits',
    'Dairy & eggs',
    'Meats',
    'Soft Drinks',
    'Package foods',
  ];

  static const _filters = ['Sort by', 'Price', 'Offers', 'Type'];

  static const _products = [
    _Product(
      image: V2Assets.prodTomato,
      name: 'Indian Tomato',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFE4DE),
      badgeInImage: true,
    ),
    _Product(
      image: V2Assets.prodCarrot,
      name: 'Fresh Carrot',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFCC95),
      badgeInImage: true,
    ),
    _Product(
      image: V2Assets.prodCapsicum,
      name: 'Capsicum',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFEEFBDD),
      badgeInImage: true,
    ),
    _Product(
      image: V2Assets.prodGarlic,
      name: 'Garlic',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFF48F),
      badgeInImage: true,
    ),
    _Product(
      image: V2Assets.prodCauliflower,
      name: 'Cauliflower',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFF6A1),
      badgeInImage: true,
    ),
    _Product(
      image: V2Assets.prodOnion,
      name: 'Onion',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFCECE),
      badgeInImage: false,
    ),
  ];

  late String _selected;
  final Set<int> _liked = {};

  @override
  void initState() {
    super.initState();
    _selected = _resolveCategory(widget.initialCategory);
  }

  String _resolveCategory(String initial) {
    final lower = initial.toLowerCase();
    if (lower.contains('veg')) return 'Vegetables';
    if (lower.contains('fruit')) return 'Fruits';
    if (lower.contains('dairy')) return 'Dairy & eggs';
    if (lower.contains('meat')) return 'Meats';
    if (lower.contains('drink')) return 'Soft Drinks';
    if (lower.contains('package') || lower.contains('bakery')) {
      return 'Package foods';
    }
    return 'Vegetables';
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildFilters(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSidebar(),
                    Expanded(child: _buildProductGrid()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 20, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    'Search Veggies',
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          _chip(
            child: Icon(Icons.tune_rounded, size: 18, color: Colors.grey.shade800),
            pad: 10,
          ),
          const SizedBox(width: 8),
          ..._filters.map((f) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _chip(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      f,
                      style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    if (f == 'Sort by') ...[
                      const SizedBox(width: 4),
                      Icon(
                        Icons.swap_vert_rounded,
                        size: 16,
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _chip({required Widget child, double pad = 12}) {
    return Container(
      height: 36,
      padding: EdgeInsets.symmetric(horizontal: pad),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _buildSidebar() {
    return SizedBox(
      width: 52,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: _sidebar.length,
        itemBuilder: (context, i) {
          final label = _sidebar[i];
          final active = label == _selected;
          return GestureDetector(
            onTap: () => setState(() => _selected = label),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: active ? const Color(0xFFEAFDDD) : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    // Show veggie products for Vegetables; empty placeholder for others for now
    final items = _selected == 'Vegetables' ? _products : const <_Product>[];

    if (items.isEmpty) {
      return Center(
        child: Text(
          'Coming soon',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(6, 8, 12, 20),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.52,
      ),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final p = items[i];
        return GestureDetector(
          onTap: () => context.push(
            AppRouter.v2ProductDetails,
            extra: {
              'title': p.name == 'Indian Tomato'
                  ? 'Indian Tomato Fresh'
                  : p.name,
              'image': p.name == 'Indian Tomato'
                  ? V2Assets.prodDetailTomato
                  : p.image,
              'price': p.price,
              'oldPrice': p.oldPrice,
              'weight': p.weight.replaceAll(' g', ' gm'),
            },
          ),
          child: _ProductCard(
            product: p,
            liked: _liked.contains(i),
            onLike: () => setState(() {
              if (_liked.contains(i)) {
                _liked.remove(i);
              } else {
                _liked.add(i);
              }
            }),
          ),
        );
      },
    );
  }
}

class _Product {
  const _Product({
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    required this.oldPrice,
    required this.unit,
    required this.bg,
    required this.badgeInImage,
  });

  final String image;
  final String name;
  final String weight;
  final int price;
  final int oldPrice;
  final String unit;
  final Color bg;
  final bool badgeInImage;
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.liked,
    required this.onLike,
  });

  final _Product product;
  final bool liked;
  final VoidCallback onLike;

  static const _green = Color(0xFF0E5A03);
  static const _yellow = Color(0xFFFFD600);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: product.bg,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => ColoredBox(
                    color: product.bg,
                    child: const Icon(Icons.image_outlined),
                  ),
                ),
                if (!product.badgeInImage) ...[
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE57373),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '10 % OFF',
                        style: GoogleFonts.poppins(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: onLike,
                      child: Icon(
                        liked ? Icons.favorite : Icons.favorite,
                        size: 18,
                        color: const Color(0xFFE53935),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.weight,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹ ${product.price}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '₹ ${product.oldPrice}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              product.unit,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _green, width: 1.4),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.add, size: 16, color: _green),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 29,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Instant Order',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    height: 29,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _yellow,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Pre - order',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
