import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/catalog/banner_item.dart';
import '../models/catalog/catalog_product.dart';
import '../models/catalog/category_item.dart';
import '../models/catalog/filters_response.dart';

class CatalogRepository {
  CatalogRepository(this._dio);

  final Dio _dio;

  Future<BannerListResponse> fetchBanners() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.banners);
    final data = response.data;
    if (data == null) throw Exception('Empty banners response');
    return BannerListResponse.fromJson(data);
  }

  Future<CategoryListResponse> fetchCategories() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.categories);
    final data = response.data;
    if (data == null) throw Exception('Empty categories response');
    return CategoryListResponse.fromJson(data);
  }

  Future<ProductsListResponse> fetchProducts({
    int limit = 20,
    int page = 1,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.products,
      data: {'limit': limit, 'page': page},
    );
    final data = response.data;
    if (data == null) throw Exception('Empty products response');
    return ProductsListResponse.fromJson(data);
  }

  Future<FiltersResponse> fetchFilters() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.filters);
    final data = response.data;
    if (data == null) throw Exception('Empty filters response');
    return FiltersResponse.fromJson(data);
  }
}
