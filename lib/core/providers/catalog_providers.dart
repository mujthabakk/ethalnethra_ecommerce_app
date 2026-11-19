import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/catalog/banner_item.dart';
import '../models/catalog/catalog_product.dart';
import '../models/catalog/category_item.dart';
import '../models/catalog/filters_response.dart';
import '../models/catalog/product_detail_dto.dart';
import '../repositories/catalog_repository.dart';
import 'auth_providers.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  return CatalogRepository(ref.watch(dioProvider));
});

final homeBannersProvider = FutureProvider.autoDispose<List<BannerItem>>((ref) async {
  final res = await ref.watch(catalogRepositoryProvider).fetchBanners();
  return res.banners;
});

final homeCategoriesProvider =
    FutureProvider.autoDispose<List<CategoryItem>>((ref) async {
  final res = await ref.watch(catalogRepositoryProvider).fetchCategories();
  return res.categories;
});

final bestValueProvider =
    FutureProvider.autoDispose<List<CatalogProduct>>((ref) async {
  return ref.watch(catalogRepositoryProvider).fetchBestValue();
});

final todaysDealsProvider =
    FutureProvider.autoDispose<List<CatalogProduct>>((ref) async {
  return ref.watch(catalogRepositoryProvider).fetchTodaysDeals();
});

final homeProductsProvider =
    FutureProvider.autoDispose<List<CatalogProduct>>((ref) async {
  final res = await ref.watch(catalogRepositoryProvider).fetchProducts(
        limit: 50,
        page: 1,
      );
  return res.products;
});

final filtersProvider = FutureProvider.autoDispose<FiltersResponse>((ref) async {
  return ref.watch(catalogRepositoryProvider).fetchFilters();
});

final productDetailProvider =
    FutureProvider.autoDispose.family<ProductDetailDto, String>((ref, id) async {
  return ref.watch(catalogRepositoryProvider).fetchProductDetail(id);
});

/// Normalized search query for client-side product filtering on home.
final homeSearchQueryProvider = StateProvider<String>((ref) => '');

/// Category name and optional search keyword for `POST /api/products`.
class CatalogQuery {
  const CatalogQuery({
    this.category,
    this.categoryId,
    this.brandId,
    this.sort,
    this.search,
  });

  final String? category;
  final String? categoryId;
  final String? brandId;
  final String? sort;
  final String? search;

  @override
  bool operator ==(Object other) {
    return other is CatalogQuery &&
        other.category == category &&
        other.categoryId == categoryId &&
        other.brandId == brandId &&
        other.sort == sort &&
        other.search == search;
  }

  @override
  int get hashCode => Object.hash(category, categoryId, brandId, sort, search);
}

final catalogQueryProvider = FutureProvider.autoDispose
    .family<List<CatalogProduct>, CatalogQuery>((ref, query) async {
  final res = await ref.watch(catalogRepositoryProvider).fetchProducts(
        limit: 40,
        page: 1,
        category: query.category,
        categoryId: query.categoryId,
        brandId: query.brandId,
        sort: query.sort,
        search: query.search,
      );
  return res.products;
});
