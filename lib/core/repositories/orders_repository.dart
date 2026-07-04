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

  Future<CheckoutResponse> checkout({
    required int addressId,
    required String type,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.ordersCheckout,
      data: {
        'address_id': addressId,
        'type': type,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty checkout response');
    return CheckoutResponse.fromJson(data);
  }

  Future<CreatePaymentResponse> createPayment({
    required int addressId,
    required String type,
    bool useRewardCoins = false,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.ordersCreatePayment,
      data: {
        'address_id': addressId,
        'type': type,
        'use_reward_coins': useRewardCoins,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty create payment response');
    return CreatePaymentResponse.fromJson(data);
  }

  Future<PlaceOrderResponse> placeOrder({
    required int addressId,
    required PaymentMethod paymentMethod,
    required bool isInstantCart,
    bool useRewardCoins = false,
  }) async {
    final path = isInstantCart
        ? ApiEndpoints.ordersPlace
        : ApiEndpoints.ordersPlacePreorder;
    final response = await _dio.post<Map<String, dynamic>>(
      path,
      data: {
        'address_id': addressId,
        'payment_method': paymentMethod.apiValue,
        'use_reward_coins': useRewardCoins,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty place order response');
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
