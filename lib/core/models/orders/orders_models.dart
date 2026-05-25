// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/product_display_name.dart';
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
    required String status,
    @JsonKey(name: 'order_type') @Default('') String orderType,
    @JsonKey(name: 'created_at') @Default('') String date,
    @JsonKey(name: 'dispatch_date') @Default('') String dispatchDate,
    @JsonKey() @Default('') String notes,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double subtotal,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double discount,
    @JsonKey(fromJson: doubleFromJson) required double total,
  }) = _OrderListItem;

  factory OrderListItem.fromJson(Map<String, dynamic> json) =>
      orderListItemFromJsonLoose(json);
}

extension OrderListItemDisplay on OrderListItem {
  String get orderTypeLabel {
    switch (orderType.toLowerCase()) {
      case 'instant':
        return 'Instant';
      case 'preorder':
        return 'Pre-order';
      default:
        if (orderType.isEmpty) return '';
        return orderType[0].toUpperCase() +
            orderType.substring(1).replaceAll('_', ' ');
    }
  }

  bool get isInstantOrder => orderType.toLowerCase() == 'instant';
  bool get isPreorderOrder => orderType.toLowerCase() == 'preorder';
}

@freezed
class OrdersListResponse with _$OrdersListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrdersListResponse({
    required List<OrderListItem> orders,
    @JsonKey(fromJson: intFromJson) @Default(0) int totalCount,
    @JsonKey(name: 'current_page', fromJson: intFromJson)
    @Default(1)
    int currentPage,
    @JsonKey(name: 'last_page', fromJson: intFromJson) @Default(1) int lastPage,
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
    @JsonKey(name: 'tracking_url') @Default('') String trackingUrl,
    @JsonKey(name: 'dispatch_date') @Default('') String dispatchDate,
    @JsonKey() @Default('') String notes,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    @Default(0)
    double deliveryCharge,
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

@freezed
class OrderDetailItem with _$OrderDetailItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderDetailItem({
    @JsonKey(fromJson: stringFromJson) @Default('') String productId,
    @JsonKey(name: 'name_ml') @Default('') String nameMl,
    @JsonKey() @Default('') String name,
    @JsonKey(fromJson: doubleFromJson) @Default(1) double quantity,
    @JsonKey() @Default('') String unit,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double price,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double subtotal,
    @JsonKey(fromJson: stringFromJson) @Default('') String imageUrl,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool isPreorder,
  }) = _OrderDetailItem;

  factory OrderDetailItem.fromJson(Map<String, dynamic> json) =>
      orderDetailItemFromJsonLoose(json);
}

extension OrderDetailItemDisplay on OrderDetailItem {
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);

  String get quantitySubtitle {
    final qtyStr = quantity == quantity.roundToDouble()
        ? quantity.toInt().toString()
        : quantity.toStringAsFixed(1);
    if (unit.isNotEmpty) return '$qtyStr $unit, Price';
    return '$qtyStr, Price';
  }

  String get lineTotalLabel => '₹${(subtotal > 0 ? subtotal : price * quantity).toStringAsFixed(2)}';

  int? get productIdInt => int.tryParse(productId);
}

@freezed
class OrderDetailResponse with _$OrderDetailResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderDetailResponse({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @JsonKey(name: 'order_type') @Default('') String orderType,
    @JsonKey(name: 'created_at') @Default('') String date,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double subtotal,
    @JsonKey(fromJson: doubleFromJson) @Default(0) double discount,
    @JsonKey(fromJson: doubleFromJson) required double total,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    @Default(0)
    double deliveryCharge,
    @JsonKey() @Default('') String notes,
    @Default([]) List<OrderDetailItem> items,
    @JsonKey(name: 'order_history') @Default([]) List<OrderDetailItem> historyItems,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      orderDetailResponseFromJsonLoose(json);
}

/// UI-friendly summary for [OrderStatusScreen] from list item or place-order response.
class OrderSummaryView {
  const OrderSummaryView({
    required this.orderId,
    required this.orderNumber,
    required this.status,
    required this.total,
    this.date,
    this.eta,
    this.trackingUrl,
  });

  final String orderId;
  final String orderNumber;
  final String status;
  final double total;
  final String? date;
  final String? eta;
  final String? trackingUrl;

  factory OrderSummaryView.fromListItem(OrderListItem e) {
    return OrderSummaryView(
      orderId: e.id,
      orderNumber: e.orderNumber,
      status: e.status,
      total: e.total,
      date: e.date,
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
