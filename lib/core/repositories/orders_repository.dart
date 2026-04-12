import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/orders/orders_models.dart';

class OrdersRepository {
  OrdersRepository(this._dio);

  final Dio _dio;

  Future<OrdersListResponse> fetchOrders() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.orders);
    final data = response.data;
    if (data == null) throw Exception('Empty orders response');
    return OrdersListResponse.fromJson(data);
  }

  Future<PlaceOrderResponse> placeOrder({
    required String deliveryMethod,
    required String paymentMethod,
    required int addressId,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.ordersPlace,
      data: {
        'delivery_method': deliveryMethod,
        'payment_method': paymentMethod,
        'address_id': addressId,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty place order response');
    return PlaceOrderResponse.fromJson(data);
  }

  Future<OrderTrackResponse> fetchOrderTrack(String orderId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.orderTrack(orderId),
    );
    final data = response.data;
    if (data == null) throw Exception('Empty order track response');
    return OrderTrackResponse.fromJson(data);
  }

  Future<CancelOrderResponse> cancelOrder(String orderId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.orderCancel(orderId),
    );
    final data = response.data;
    if (data == null) throw Exception('Empty cancel order response');
    return CancelOrderResponse.fromJson(data);
  }
}
