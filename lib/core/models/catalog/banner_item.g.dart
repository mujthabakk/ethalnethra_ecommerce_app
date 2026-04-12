// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerItemImpl _$$BannerItemImplFromJson(Map<String, dynamic> json) =>
    _$BannerItemImpl(
      id: stringFromJson(json['id']),
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$BannerItemImplToJson(_$BannerItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'description': instance.description,
    };

_$BannerListResponseImpl _$$BannerListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BannerListResponseImpl(
  banners: (json['banners'] as List<dynamic>)
      .map((e) => BannerItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$BannerListResponseImplToJson(
  _$BannerListResponseImpl instance,
) => <String, dynamic>{'banners': instance.banners};
