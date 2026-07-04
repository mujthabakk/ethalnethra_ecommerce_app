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
      label: stringFromJson(json['label']),
      zoneId: stringFromJson(json['zone_id']),
      areaId: stringFromJson(json['area_id']),
      addressLine: stringFromJson(json['address_line']),
      pincode: stringFromJson(json['pincode']),
      isDefault: json['is_default'] == null
          ? false
          : boolFromJson(json['is_default']),
      zoneName: json['zone_name'] as String? ?? '',
      areaName: json['area_name'] as String? ?? '',
      pincodeValue: json['pincode_value'] as String? ?? '',
      pincodeId: intNullableFromJson(json['pincode_id']),
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
  'is_default': instance.isDefault,
  'zone_name': instance.zoneName,
  'area_name': instance.areaName,
  'pincode_value': instance.pincodeValue,
  'pincode_id': instance.pincodeId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
