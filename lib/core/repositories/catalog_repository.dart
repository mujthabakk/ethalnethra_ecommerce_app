import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/catalog/banner_item.dart';
import '../models/catalog/catalog_product.dart';
import '../models/catalog/category_item.dart';
import '../models/catalog/filters_response.dart';
import '../models/catalog/product_detail_dto.dart';

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
    String? category,
    String? categoryId,
    String? brandId,
    String? sort,
    String? search,
    String? type,
  }) async {
    final body = <String, dynamic>{'limit': limit, 'page': page};
    if (category != null && category.isNotEmpty) {
      body['category'] = category;
    }
    final parsedCategoryId = int.tryParse(categoryId ?? '');
    if (parsedCategoryId != null) body['category_id'] = parsedCategoryId;
    final parsedBrandId = int.tryParse(brandId ?? '');
    if (brandId != null && brandId.isNotEmpty) {
      body['brand_id'] = parsedBrandId ?? brandId;
    }
    if (sort != null && sort.isNotEmpty) body['sort'] = sort;
    if (search != null && search.isNotEmpty) {
      body['search'] = search;
    }
    if (type != null && type.isNotEmpty) {
      body['type'] = type;
    }
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.products,
      data: body,
    );
    final data = response.data;
    if (data == null) throw Exception('Empty products response');
    return productsListResponseFromJsonLoose(data);
  }

  Future<ProductDetailDto> fetchProductDetail(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.productById(id),
    );
    final data = response.data;
    if (data == null) throw Exception('Empty product detail response');
    return ProductDetailDto.fromJson(data);
  }

  Future<List<CatalogProduct>> fetchBestValue() {
    return _fetchDealList(ApiEndpoints.shopBestValue);
  }

  Future<List<CatalogProduct>> fetchTodaysDeals() {
    return _fetchDealList(ApiEndpoints.shopTodaysDeals);
  }

  Future<List<CatalogProduct>> _fetchDealList(String path) async {
    try {
      final response = await _dio.get<dynamic>(path);
      final raw = _dealItems(response.data);
      return raw.map((item) {
        final map = Map<String, dynamic>.from(item);
        map['name'] ??= map['title'];
        map['display_price'] ??= map['price'];
        map['our_price'] ??= map['price'];
        map['final_price'] ??= map['price'];
        map['old_price'] ??= map['price'];
        if (map['price'] == null && map['old_price'] != null) {
          map['price'] = map['old_price'];
        }
        return catalogProductFromJsonLoose(map);
      }).where((item) => item.id.isNotEmpty || item.name.isNotEmpty).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const [];
      rethrow;
    }
  }

  List<Map<String, dynamic>> _dealItems(dynamic data) {
    dynamic raw = data;
    if (data is Map) {
      raw = data['data'] ?? data['products'] ?? data['items'] ?? data;
    }
    if (raw is! List) return const [];
    return raw.whereType<Map>().map((item) => Map<String, dynamic>.from(item)).toList();
  }

  Future<FiltersResponse> fetchFilters() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.filters);
    final data = response.data;
    if (data == null) throw Exception('Empty filters response');
    return FiltersResponse.fromJson(data);
  }
}
