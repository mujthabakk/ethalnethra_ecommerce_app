// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartLineDtoImpl _$$CartLineDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartLineDtoImpl(
      id: stringFromJson(json['id']),
      productId: stringFromJson(json['product_id']),
      name: json['name'] as String,
      price: doubleFromJson(json['price']),
      quantity: doubleFromJson(json['quantity']),
      subtotal: doubleFromJson(json['subtotal']),
      isPreorder: json['is_preorder'] as bool? ?? false,
    );

Map<String, dynamic> _$$CartLineDtoImplToJson(_$CartLineDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'is_preorder': instance.isPreorder,
    };

_$CartResponseImpl _$$CartResponseImplFromJson(Map<String, dynamic> json) =>
    _$CartResponseImpl(
      instant:
          (json['instant'] as List<dynamic>?)
              ?.map((e) => CartLineDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      preorder:
          (json['preorder'] as List<dynamic>?)
              ?.map((e) => CartLineDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: doubleFromJson(json['total']),
      itemCount: intFromJson(json['item_count']),
    );

Map<String, dynamic> _$$CartResponseImplToJson(_$CartResponseImpl instance) =>
    <String, dynamic>{
      'instant': instance.instant,
      'preorder': instance.preorder,
      'total': instance.total,
      'item_count': instance.itemCount,
    };

_$CartAddResponseImpl _$$CartAddResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CartAddResponseImpl(
  message: json['message'] as String,
  cartTotal: doubleFromJson(json['cart_total']),
);

Map<String, dynamic> _$$CartAddResponseImplToJson(
  _$CartAddResponseImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'cart_total': instance.cartTotal,
};
