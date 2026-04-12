import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/commerce/favorites_dtos.dart';

class FavoritesRepository {
  FavoritesRepository(this._dio);

  final Dio _dio;

  Future<List<FavoriteProductDto>> fetchFavorites() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.favorites);
    final data = response.data;
    if (data == null) throw Exception('Empty favorites response');
    return FavoritesListResponse.fromJson(data).products;
  }

  Future<void> addFavorite(int productId) async {
    await _dio.post<void>(
      ApiEndpoints.favoritesAdd,
      data: {'product_id': productId},
    );
  }

  Future<void> removeFavorite(String productId) async {
    await _dio.delete<void>(ApiEndpoints.favoritesRemove(productId));
  }
}
