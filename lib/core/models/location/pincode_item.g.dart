// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PincodeItemImpl _$$PincodeItemImplFromJson(Map<String, dynamic> json) =>
    _$PincodeItemImpl(
      id: stringFromJson(json['id']),
      pincode: stringFromJson(json['pincode']),
    );

Map<String, dynamic> _$$PincodeItemImplToJson(_$PincodeItemImpl instance) =>
    <String, dynamic>{'id': instance.id, 'pincode': instance.pincode};

_$PincodesListResponseImpl _$$PincodesListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PincodesListResponseImpl(
  pincodes: (json['pincodes'] as List<dynamic>)
      .map((e) => PincodeItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PincodesListResponseImplToJson(
  _$PincodesListResponseImpl instance,
) => <String, dynamic>{'pincodes': instance.pincodes};
