// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListItemImpl _$$OrderListItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderListItemImpl(
      id: stringFromJson(json['id']),
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      orderType: json['order_type'] as String? ?? '',
      date: json['created_at'] as String? ?? '',
      dispatchDate: json['dispatch_date'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
      discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
      total: doubleFromJson(json['total']),
    );

Map<String, dynamic> _$$OrderListItemImplToJson(_$OrderListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'order_type': instance.orderType,
      'created_at': instance.date,
      'dispatch_date': instance.dispatchDate,
      'notes': instance.notes,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'total': instance.total,
    };

_$OrdersListResponseImpl _$$OrdersListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersListResponseImpl(
  orders: (json['orders'] as List<dynamic>)
      .map((e) => OrderListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: json['total_count'] == null
      ? 0
      : intFromJson(json['total_count']),
  currentPage: json['current_page'] == null
      ? 1
      : intFromJson(json['current_page']),
  lastPage: json['last_page'] == null ? 1 : intFromJson(json['last_page']),
);

Map<String, dynamic> _$$OrdersListResponseImplToJson(
  _$OrdersListResponseImpl instance,
) => <String, dynamic>{
  'orders': instance.orders,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
};

_$PlaceOrderResponseImpl _$$PlaceOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceOrderResponseImpl(
  orderId: stringFromJson(json['order_id']),
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  trackingUrl: json['tracking_url'] as String? ?? '',
  dispatchDate: json['dispatch_date'] as String? ?? '',
  notes: json['notes'] as String? ?? '',
  deliveryCharge: json['delivery_charge'] == null
      ? 0
      : doubleFromJson(json['delivery_charge']),
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
  'dispatch_date': instance.dispatchDate,
  'notes': instance.notes,
  'delivery_charge': instance.deliveryCharge,
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

_$OrderDetailItemImpl _$$OrderDetailItemImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailItemImpl(
  productId: json['product_id'] == null
      ? ''
      : stringFromJson(json['product_id']),
  nameMl: json['name_ml'] as String? ?? '',
  name: json['name'] as String? ?? '',
  quantity: json['quantity'] == null ? 1 : doubleFromJson(json['quantity']),
  unit: json['unit'] as String? ?? '',
  price: json['price'] == null ? 0 : doubleFromJson(json['price']),
  subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
  imageUrl: json['image_url'] == null ? '' : stringFromJson(json['image_url']),
  isPreorder: json['is_preorder'] == null
      ? false
      : boolFromJson(json['is_preorder']),
);

Map<String, dynamic> _$$OrderDetailItemImplToJson(
  _$OrderDetailItemImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'name_ml': instance.nameMl,
  'name': instance.name,
  'quantity': instance.quantity,
  'unit': instance.unit,
  'price': instance.price,
  'subtotal': instance.subtotal,
  'image_url': instance.imageUrl,
  'is_preorder': instance.isPreorder,
};

_$OrderDetailResponseImpl _$$OrderDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailResponseImpl(
  id: stringFromJson(json['id']),
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  orderType: json['order_type'] as String? ?? '',
  date: json['created_at'] as String? ?? '',
  subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
  discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
  total: doubleFromJson(json['total']),
  deliveryCharge: json['delivery_charge'] == null
      ? 0
      : doubleFromJson(json['delivery_charge']),
  notes: json['notes'] as String? ?? '',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderDetailItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  historyItems:
      (json['order_history'] as List<dynamic>?)
          ?.map((e) => OrderDetailItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OrderDetailResponseImplToJson(
  _$OrderDetailResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'order_type': instance.orderType,
  'created_at': instance.date,
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'total': instance.total,
  'delivery_charge': instance.deliveryCharge,
  'notes': instance.notes,
  'items': instance.items,
  'order_history': instance.historyItems,
};
