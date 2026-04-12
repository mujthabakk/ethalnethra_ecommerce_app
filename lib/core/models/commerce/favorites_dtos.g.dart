// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteProductDtoImpl _$$FavoriteProductDtoImplFromJson(
  Map<String, dynamic> json,
) => _$FavoriteProductDtoImpl(
  id: stringFromJson(json['id']),
  name: json['name'] as String,
  price: doubleFromJson(json['price']),
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$$FavoriteProductDtoImplToJson(
  _$FavoriteProductDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'image_url': instance.imageUrl,
};

_$FavoritesListResponseImpl _$$FavoritesListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FavoritesListResponseImpl(
  products: (json['products'] as List<dynamic>)
      .map((e) => FavoriteProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$FavoritesListResponseImplToJson(
  _$FavoritesListResponseImpl instance,
) => <String, dynamic>{'products': instance.products};
