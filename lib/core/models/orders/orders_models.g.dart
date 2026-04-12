// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListItemImpl _$$OrderListItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderListItemImpl(
      id: stringFromJson(json['id']),
      orderNumber: json['order_number'] as String,
      date: json['date'] as String,
      total: doubleFromJson(json['total']),
      status: json['status'] as String,
      itemsCount: intFromJson(json['items_count']),
    );

Map<String, dynamic> _$$OrderListItemImplToJson(_$OrderListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'date': instance.date,
      'total': instance.total,
      'status': instance.status,
      'items_count': instance.itemsCount,
    };

_$OrdersListResponseImpl _$$OrdersListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersListResponseImpl(
  orders: (json['orders'] as List<dynamic>)
      .map((e) => OrderListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: doubleFromJson(json['total']),
  pages: doubleFromJson(json['pages']),
);

Map<String, dynamic> _$$OrdersListResponseImplToJson(
  _$OrdersListResponseImpl instance,
) => <String, dynamic>{
  'orders': instance.orders,
  'total': instance.total,
  'pages': instance.pages,
};

_$PlaceOrderResponseImpl _$$PlaceOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceOrderResponseImpl(
  orderId: stringFromJson(json['order_id']),
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  trackingUrl: json['tracking_url'] as String,
  total: doubleFromJson(json['total']),
  discount: doubleFromJson(json['discount']),
  discounts: json['discounts'] == null
      ? const []
      : dynamicListFromJson(json['discounts']),
  loyaltyApplied: json['loyalty_applied'] as bool? ?? false,
  eta: json['eta'] as String,
);

Map<String, dynamic> _$$PlaceOrderResponseImplToJson(
  _$PlaceOrderResponseImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'tracking_url': instance.trackingUrl,
  'total': instance.total,
  'discount': instance.discount,
  'discounts': instance.discounts,
  'loyalty_applied': instance.loyaltyApplied,
  'eta': instance.eta,
};

_$OrderTrackResponseImpl _$$OrderTrackResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderTrackResponseImpl(
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  eta: json['eta'] as String? ?? '',
);

Map<String, dynamic> _$$OrderTrackResponseImplToJson(
  _$OrderTrackResponseImpl instance,
) => <String, dynamic>{
  'order_number': instance.orderNumber,
  'status': instance.status,
  'eta': instance.eta,
};

_$CancelOrderResponseImpl _$$CancelOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CancelOrderResponseImpl(message: json['message'] as String);

Map<String, dynamic> _$$CancelOrderResponseImplToJson(
  _$CancelOrderResponseImpl instance,
) => <String, dynamic>{'message': instance.message};
