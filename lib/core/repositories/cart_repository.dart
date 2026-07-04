import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../api/api_exception.dart';
import '../models/commerce/cart_dtos.dart';

class CartRepository {
  CartRepository(this._dio);

  final Dio _dio;

  Future<CartResponse> fetchCart() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.cart);
      final data = response.data;
      if (data == null) throw Exception('Empty cart response');
      return CartResponse.fromJson(data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<CartAddResponse> addToCart({
    required int productId,
    num quantity = 1,
    bool isPreorder = false,
  }) async {
    final body = <String, dynamic>{
      'product_id': productId,
      'quantity': quantity is int ? quantity : quantity.toDouble(),
      if (isPreorder) 'is_preorder': true,
    };
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.cartAdd,
        data: body,
      );
      final data = response.data;
      if (data == null) throw Exception('Empty cart add response');
      return CartAddResponse.fromJson(data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> updateLineQuantity(String lineId, {required num quantity}) async {
    try {
      await _dio.put<Map<String, dynamic>>(
        ApiEndpoints.cartUpdate(lineId),
        data: {
          'quantity': quantity is int ? quantity : quantity.toDouble(),
        },
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  Future<void> removeLine(String lineId) async {
    try {
      await _dio.delete<void>(ApiEndpoints.cartRemove(lineId));
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
