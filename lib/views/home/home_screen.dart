import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_shimmer.dart';
import '../../core/mappers/catalog_product_mapper.dart';
import '../../core/mappers/category_image_path.dart';
import '../../core/models/catalog/catalog_product.dart';
import '../../core/models/catalog/category_item.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/providers/main_nav_tab_provider.dart';
import '../../core/routes/app_router.dart';
import '../../models/category_model.dart';
import 'widgets/banner_widget.dart';
import 'widgets/home_location_header.dart';
import 'widgets/category_card.dart';
import 'widgets/home_store_search_bar.dart';
import 'widgets/product_card.dart';
import 'widgets/section_header.dart';

List<CatalogProduct> _exclusiveProducts(List<CatalogProduct> all) {
  return all.where((p) => p.type.toLowerCase() == 'exclusive').toList();
}

List<CatalogProduct> _bestSellingProducts(List<CatalogProduct> all) {
  return all.where((p) {
    final t = p.type.toLowerCase().replaceAll('-', '_');
    return t == 'best_selling' || t == 'bestselling';
  }).toList();
}

const _categoryBgColors = [
  Color(0xFFF8E8D0),
  Color(0xFFE5F3EA),
  Color(0xFFE8E0F5),
  Color(0xFFFFF3E0),
  Color(0xFFE3F2FD),
];

CategoryModel _categoryModelFromApi(CategoryItem c, int index) {
  return CategoryModel(
    id: c.id,
    name: c.name,
    imagePath: categoryDisplayImagePath(c),
    backgroundColor: _categoryBgColors[index % _categoryBgColors.length],
  );
}

Widget _productGrid(BuildContext context, List<CatalogProduct> products) {
  if (products.isEmpty) return const SizedBox.shrink();
  return LayoutBuilder(
    builder: (context, constraints) {
      const spacing = 15.0;
      final maxW = constraints.maxWidth;
      final cellW = maxW > spacing ? (maxW - spacing) / 2 : 160.0;
      const cellH = 272.0;
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: cellW / cellH,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            width: cellW,
            product: products[index].toProductModel(),
          );
        },
      );
    },
  );
}

void _pushProductList(
  BuildContext context,
  String title,
  List<CatalogProduct> list, {
  String? apiCategory,
  String? productType,
  bool fetchAll = false,
}) {
  context.push(
    AppRouter.categoryProducts,
    extra: {
      'title': title,
      'products': list.map((e) => e.toProductModel()).toList(),
      if (apiCategory != null) 'apiCategory': apiCategory,
      if (productType != null) 'productType': productType,
      if (fetchAll) 'fetchAll': true,
    },
  );
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannersAsync = ref.watch(homeBannersProvider);
    final categoriesAsync = ref.watch(homeCategoriesProvider);
    final productsAsync = ref.watch(homeProductsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(homeBannersProvider);
            ref.invalidate(homeCategoriesProvider);
            ref.invalidate(homeProductsProvider);
            ref.invalidate(filtersProvider);
            ref.invalidate(userAddressesProvider);
            await ref.read(homeProductsProvider.future);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const HomeLocationHeader(),
                  const SizedBox(height: 20),
                  const HomeStoreSearchBar(),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: bannersAsync.when(
                          data: (banners) => HomeBanner(banners: banners),
                          loading: () => const BannerShimmer(),
                          error: (e, _) => SizedBox(
                            height: 115,
                            child: Center(
                              child: Text(
                                'Banners unavailable',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Material(
                        color: const Color(0xFFA2D3B1).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => context.push(AppRouter.services),
                          child: SizedBox(
                            width: 110,
                            height: 115,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asstes/images/service.png',
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (_, __, ___) => Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF53B175),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.build_circle_outlined,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Our Services',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF53B175),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  productsAsync.when(
                    data: (products) {
                      final exclusive = _exclusiveProducts(products);
                      final best = _bestSellingProducts(products);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (products.isNotEmpty) ...[
                            SectionHeader(
                              title: 'All Products',
                              onSeeAll: () => _pushProductList(
                                context,
                                'All Products',
                                products,
                                fetchAll: true,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _productGrid(context, products),
                            const SizedBox(height: 25),
                          ],
                          if (exclusive.isNotEmpty) ...[
                            SectionHeader(
                              title: 'Exclusive Offer',
                              onSeeAll: () => _pushProductList(
                                context,
                                'Exclusive Offer',
                                exclusive,
                                productType: 'exclusive',
                              ),
                            ),
                            const SizedBox(height: 15),
                            _productGrid(context, exclusive),
                            const SizedBox(height: 25),
                          ],
                          if (best.isNotEmpty) ...[
                            SectionHeader(
                              title: 'Best Selling',
                              onSeeAll: () => _pushProductList(
                                context,
                                'Best Selling',
                                best,
                                productType: 'best_selling',
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 250,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: best.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 15),
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    product: best[index].toProductModel(),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: ProductGridShimmer(rows: 2),
                    ),
                    error: (e, _) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        children: [
                          Text(
                            'Could not load products.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$e',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () => ref.invalidate(homeProductsProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SectionHeader(
                    title: 'Categories',
                    onSeeAll: () {
                      ref.read(mainNavTabIndexProvider.notifier).state = 1;
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 105,
                    child: categoriesAsync.when(
                      data: (categories) {
                        if (categories.isEmpty) {
                          return const Center(child: Text('No categories'));
                        }
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 15),
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              category: _categoryModelFromApi(
                                categories[index],
                                index,
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const CategoryStripShimmer(),
                      error: (e, _) => Center(
                        child: Text(
                          'Categories error',
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
