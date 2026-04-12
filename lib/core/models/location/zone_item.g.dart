// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZoneItemImpl _$$ZoneItemImplFromJson(Map<String, dynamic> json) =>
    _$ZoneItemImpl(
      id: stringFromJson(json['id']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ZoneItemImplToJson(_$ZoneItemImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$ZonesListResponseImpl _$$ZonesListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ZonesListResponseImpl(
  zones: (json['zones'] as List<dynamic>)
      .map((e) => ZoneItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ZonesListResponseImplToJson(
  _$ZonesListResponseImpl instance,
) => <String, dynamic>{'zones': instance.zones};
