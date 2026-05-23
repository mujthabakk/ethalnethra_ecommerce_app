// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryItemImpl _$$CategoryItemImplFromJson(Map<String, dynamic> json) =>
    _$CategoryItemImpl(
      id: stringFromJson(json['id']),
      nameMl: json['name_ml'] as String? ?? '',
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$CategoryItemImplToJson(_$CategoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ml': instance.nameMl,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

_$CategoryListResponseImpl _$$CategoryListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryListResponseImpl(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CategoryListResponseImplToJson(
  _$CategoryListResponseImpl instance,
) => <String, dynamic>{'categories': instance.categories};
