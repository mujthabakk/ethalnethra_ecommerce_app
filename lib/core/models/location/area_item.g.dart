// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AreaItemImpl _$$AreaItemImplFromJson(Map<String, dynamic> json) =>
    _$AreaItemImpl(
      id: stringFromJson(json['id']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AreaItemImplToJson(_$AreaItemImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$AreasListResponseImpl _$$AreasListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AreasListResponseImpl(
  areas: (json['areas'] as List<dynamic>)
      .map((e) => AreaItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AreasListResponseImplToJson(
  _$AreasListResponseImpl instance,
) => <String, dynamic>{'areas': instance.areas};
