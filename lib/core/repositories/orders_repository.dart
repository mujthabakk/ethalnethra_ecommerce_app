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

  Future<PlaceOrderResponse> placeInstantOrder({required int addressId}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.ordersPlaceInstant,
      data: {'address_id': addressId},
    );
    final data = response.data;
    if (data == null) throw Exception('Empty place instant order response');
    return PlaceOrderResponse.fromJson(data);
  }

  Future<PlaceOrderResponse> placePreorderOrder({required int addressId}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.ordersPlacePreorder,
      data: {'address_id': addressId},
    );
    final data = response.data;
    if (data == null) throw Exception('Empty place preorder response');
    return PlaceOrderResponse.fromJson(data);
  }

  Future<OrderDetailResponse> fetchOrderDetail(String orderId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.orderById(orderId),
    );
    final data = response.data;
    if (data == null) throw Exception('Empty order detail response');
    return OrderDetailResponse.fromJson(data);
  }

  Future<OrderTrackResponse> fetchOrderTrack(String orderId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${ApiEndpoints.orders}/$orderId/track',
    );
    final data = response.data;
    if (data == null) throw Exception('Empty order track response');
    return OrderTrackResponse.fromJson(data);
  }

  Future<CancelOrderResponse> cancelOrder(
    String orderId, {
    String reason = 'Changed my mind',
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '${ApiEndpoints.orders}/$orderId/cancel',
      data: {'reason': reason},
    );
    final data = response.data;
    if (data == null) throw Exception('Empty cancel order response');
    return CancelOrderResponse.fromJson(data);
  }
}
