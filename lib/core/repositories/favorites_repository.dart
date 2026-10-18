import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../api/api_exception.dart';
import '../models/commerce/favorites_dtos.dart';

class FavoritesRepository {
  FavoritesRepository(this._dio);

  final Dio _dio;

  Future<List<FavoriteProductDto>> fetchFavorites() async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>(ApiEndpoints.favorites);
      final data = response.data;
      if (data == null) throw Exception('Empty favorites response');
      return FavoritesListResponse.fromJson(data).products;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> addFavorite(int productId) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.favoritesAdd,
        data: {'product_id': productId},
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> removeFavorite(String productId) async {
    try {
      await _dio.delete<void>(ApiEndpoints.favoritesRemove(productId));
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Adds every favorite to the cart.
  Future<void> addAllFavoritesToCart() async {
    try {
      await _dio.post<void>(ApiEndpoints.favoritesAddToCart);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Moves only the given products from favorites to cart.
  Future<void> moveFavoritesToCart(List<int> productIds) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.favoritesMoveToCart,
        data: {'product_ids': productIds},
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
