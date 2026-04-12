import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/commerce/cart_dtos.dart';

class CartRepository {
  CartRepository(this._dio);

  final Dio _dio;

  Future<CartResponse> fetchCart() async {
    final response = await _dio.get<Map<String, dynamic>>(ApiEndpoints.cart);
    final data = response.data;
    if (data == null) throw Exception('Empty cart response');
    return CartResponse.fromJson(data);
  }

  Future<CartAddResponse> addToCart({
    required int productId,
    int quantity = 1,
    bool isPreorder = false,
  }) async {
    final body = <String, dynamic>{
      'product_id': productId,
      'quantity': quantity,
      if (isPreorder) 'is_preorder': true,
    };
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.cartAdd,
      data: body,
    );
    final data = response.data;
    if (data == null) throw Exception('Empty cart add response');
    return CartAddResponse.fromJson(data);
  }

  Future<void> updateLineQuantity(String lineId, {required int quantity}) async {
    await _dio.put<Map<String, dynamic>>(
      ApiEndpoints.cartUpdate(lineId),
      data: {'quantity': quantity},
    );
  }

  Future<void> removeLine(String lineId) async {
    await _dio.delete<void>(ApiEndpoints.cartRemove(lineId));
  }
}
