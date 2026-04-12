import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/catalog/banner_item.dart';
import '../models/catalog/catalog_product.dart';
import '../models/catalog/category_item.dart';
import '../models/catalog/filters_response.dart';
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

final homeProductsProvider =
    FutureProvider.autoDispose<List<CatalogProduct>>((ref) async {
  final res = await ref.watch(catalogRepositoryProvider).fetchProducts(
        limit: 20,
        page: 1,
      );
  return res.products;
});

final filtersProvider = FutureProvider.autoDispose<FiltersResponse>((ref) async {
  return ref.watch(catalogRepositoryProvider).fetchFilters();
});

/// Normalized search query for client-side product filtering on home.
final homeSearchQueryProvider = StateProvider<String>((ref) => '');
