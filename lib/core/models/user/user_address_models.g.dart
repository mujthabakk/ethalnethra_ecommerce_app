// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAddressResponseImpl _$$CreateAddressResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateAddressResponseImpl(id: stringFromJson(json['id']));

Map<String, dynamic> _$$CreateAddressResponseImplToJson(
  _$CreateAddressResponseImpl instance,
) => <String, dynamic>{'id': instance.id};

_$UserAddressDtoImpl _$$UserAddressDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserAddressDtoImpl(
      id: intFromJson(json['id']),
      userId: intFromJson(json['user_id']),
      label: json['label'] as String,
      zoneId: stringFromJson(json['zone_id']),
      areaId: stringFromJson(json['area_id']),
      addressLine: json['address_line'] as String,
      pincode: json['pincode'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$UserAddressDtoImplToJson(
  _$UserAddressDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'label': instance.label,
  'zone_id': instance.zoneId,
  'area_id': instance.areaId,
  'address_line': instance.addressLine,
  'pincode': instance.pincode,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
