// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';
import '../safe_json_parse.dart';

part 'orders_models.freezed.dart';
part 'orders_models.g.dart';

@freezed
class OrderListItem with _$OrderListItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderListItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String date,
    @JsonKey(fromJson: doubleFromJson) required double total,
    required String status,
    @JsonKey(name: 'items_count', fromJson: intFromJson) required int itemsCount,
  }) = _OrderListItem;

  factory OrderListItem.fromJson(Map<String, dynamic> json) =>
      orderListItemFromJsonLoose(json);
}

@freezed
class OrdersListResponse with _$OrdersListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrdersListResponse({
    required List<OrderListItem> orders,
    @JsonKey(fromJson: doubleFromJson) required double total,
    @JsonKey(fromJson: doubleFromJson) required double pages,
  }) = _OrdersListResponse;

  factory OrdersListResponse.fromJson(Map<String, dynamic> json) =>
      ordersListResponseFromJsonLoose(json);
}

@freezed
class PlaceOrderResponse with _$PlaceOrderResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PlaceOrderResponse({
    @JsonKey(name: 'order_id', fromJson: stringFromJson) required String orderId,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @JsonKey(name: 'tracking_url') required String trackingUrl,
    @JsonKey(fromJson: doubleFromJson) required double total,
    @JsonKey(fromJson: doubleFromJson) required double discount,
    @JsonKey(fromJson: dynamicListFromJson) @Default([]) List<dynamic> discounts,
    @JsonKey(name: 'loyalty_applied') @Default(false) bool loyaltyApplied,
    required String eta,
  }) = _PlaceOrderResponse;

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) =>
      placeOrderResponseFromJsonLoose(json);
}

@freezed
class OrderTrackResponse with _$OrderTrackResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderTrackResponse({
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @Default('') String eta,
  }) = _OrderTrackResponse;

  factory OrderTrackResponse.fromJson(Map<String, dynamic> json) =>
      orderTrackResponseFromJsonLoose(json);
}

@freezed
class CancelOrderResponse with _$CancelOrderResponse {
  const factory CancelOrderResponse({required String message}) =
      _CancelOrderResponse;

  factory CancelOrderResponse.fromJson(Map<String, dynamic> json) =>
      cancelOrderResponseFromJsonLoose(json);
}

/// UI-friendly summary for [OrderStatusScreen] from list item or place-order response.
class OrderSummaryView {
  const OrderSummaryView({
    required this.orderId,
    required this.orderNumber,
    required this.status,
    required this.total,
    this.date,
    this.itemsCount,
    this.eta,
    this.trackingUrl,
  });

  final String orderId;
  final String orderNumber;
  final String status;
  final double total;
  final String? date;
  final int? itemsCount;
  final String? eta;
  final String? trackingUrl;

  factory OrderSummaryView.fromListItem(OrderListItem e) {
    return OrderSummaryView(
      orderId: e.id,
      orderNumber: e.orderNumber,
      status: e.status,
      total: e.total,
      date: e.date,
      itemsCount: e.itemsCount,
    );
  }

  factory OrderSummaryView.fromPlace(PlaceOrderResponse e) {
    return OrderSummaryView(
      orderId: e.orderId,
      orderNumber: e.orderNumber,
      status: e.status,
      total: e.total,
      eta: e.eta,
      trackingUrl: e.trackingUrl,
    );
  }
}
