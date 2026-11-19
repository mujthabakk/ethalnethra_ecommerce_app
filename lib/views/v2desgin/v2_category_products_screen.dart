import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/models/catalog/catalog_product.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/providers/favorites_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_network_image.dart';

/// Figma category product listing (sidebar + 2-col product cards).
class V2CategoryProductsScreen extends ConsumerStatefulWidget {
  const V2CategoryProductsScreen({
    super.key,
    this.initialCategory = '',
    this.search = '',
  });

  final String initialCategory;
  final String search;

  @override
  ConsumerState<V2CategoryProductsScreen> createState() =>
      _V2CategoryProductsScreenState();
}

class _V2CategoryProductsScreenState
    extends ConsumerState<V2CategoryProductsScreen> {
  static const _filters = ['Sort by', 'Price', 'Offers', 'Type'];

  late String _selected;
  late String _search;
  String? _sort;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selected = widget.initialCategory;
    _search = widget.search;
    _searchController.text = widget.search;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(homeCategoriesProvider);
    ref.watch(filtersProvider);
    final categoryItems = categories.value ?? const [];
    final names = categoryItems
        .map((item) => item.name)
        .where((name) => name.isNotEmpty)
        .toList();
    final selected = _selected.isNotEmpty
        ? _selected
        : (names.isNotEmpty ? names.first : '');
    final selectedId = categoryItems
        .where((item) => item.name == selected)
        .map((item) => item.id)
        .firstOrNull;
    final products = ref.watch(
      catalogQueryProvider(
        CatalogQuery(
          category: selected.isEmpty ? null : selected,
          categoryId: selectedId,
          sort: _sort,
          search: _search.isEmpty ? null : _search,
        ),
      ),
    );

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
                    _buildSidebar(
                      names.isEmpty && selected.isNotEmpty ? [selected] : names,
                      selected,
                    ),
                    Expanded(child: _buildProductGrid(products)),
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
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) =>
                          setState(() => _search = value.trim()),
                      decoration: InputDecoration(
                        hintText: 'Search products',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13.5,
                          color: Colors.grey.shade600,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: GoogleFonts.poppins(fontSize: 13.5),
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
                onTap: f == 'Sort by'
                    ? () => setState(() {
                          _sort = _sort == 'popular' ? 'price_asc' : 'popular';
                        })
                    : null,
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

  Widget _chip({required Widget child, double pad = 12, VoidCallback? onTap}) {
    final box = Container(
      height: 36,
      padding: EdgeInsets.symmetric(horizontal: pad),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
    if (onTap == null) return box;
    return GestureDetector(onTap: onTap, child: box);
  }

  Widget _buildSidebar(List<String> labels, String selected) {
    return SizedBox(
      width: 52,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: labels.length,
        itemBuilder: (context, i) {
          final label = labels[i];
          final active = label == selected;
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

  Widget _buildProductGrid(AsyncValue<List<CatalogProduct>> products) {
    if (products.isLoading) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    if (products.hasError) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            products.error.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 13),
          ),
        ),
      );
    }
    final source = products.value ?? const <CatalogProduct>[];
    final items = source
        .map(
          (p) => _Product(
            id: p.id,
            image: p.imageUrl,
            name: p.name,
            weight: p.weight,
            price: p.displayPrice.round(),
            oldPrice: p.price.round(),
            unit: p.category,
            bg: const Color(0xFFF4F7EF),
            badgeInImage: !p.hasDiscount,
            badge: p.hasDiscount ? '${p.discountPercentage.round()} % OFF' : '',
          ),
        )
        .toList();

    if (items.isEmpty) {
      return Center(
        child: Text(
          'No products in this category',
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
            extra: {'id': p.id},
          ),
          child: _ProductCard(
            product: p,
            onLike: () async {
              try {
                await ref
                    .read(favoritesNotifierProvider.notifier)
                    .toggleFavorite(p.id);
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              }
            },
          ),
        );
      },
    );
  }
}

class _Product {
  const _Product({
    required this.id,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    required this.oldPrice,
    required this.unit,
    required this.bg,
    required this.badgeInImage,
    this.badge = '',
  });

  final String id;
  final String image;
  final String name;
  final String weight;
  final int price;
  final int oldPrice;
  final String unit;
  final Color bg;
  final bool badgeInImage;
  final String badge;
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onLike,
  });

  final _Product product;
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
                AppImage(
                  path: product.image,
                  fit: BoxFit.cover,
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
                        product.badge.isEmpty ? product.weight : product.badge,
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
                        Icons.favorite_border,
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
