// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailDtoImpl _$$ProductDetailDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ProductDetailDtoImpl(
  id: stringFromJson(json['id']),
  name: stringFromJson(json['name']),
  price: doubleFromJson(json['price']),
  ourPrice: doubleFromJson(json['our_price']),
  finalPrice: doubleFromJson(json['final_price']),
  displayPrice: doubleFromJson(json['display_price']),
  preorderAvailable: json['preorder_available'] as bool,
  preorderPrice: doubleNullableFromJson(json['preorder_price']),
  hasDiscount: json['has_discount'] as bool,
  discountPercentage: doubleFromJson(json['discount_percentage']),
  description: json['description'] as String?,
  images: json['images'] == null
      ? const []
      : stringListFromJson(json['images']),
  nutritions: json['nutritions'] == null
      ? const []
      : dynamicListFromJson(json['nutritions']),
  rating: doubleNullableFromJson(json['rating']),
  reviewCount: json['review_count'] == null
      ? 0
      : intFromJson(json['review_count']),
  reviews: json['reviews'] == null
      ? const []
      : dynamicListFromJson(json['reviews']),
);

Map<String, dynamic> _$$ProductDetailDtoImplToJson(
  _$ProductDetailDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'our_price': instance.ourPrice,
  'final_price': instance.finalPrice,
  'display_price': instance.displayPrice,
  'preorder_available': instance.preorderAvailable,
  'preorder_price': instance.preorderPrice,
  'has_discount': instance.hasDiscount,
  'discount_percentage': instance.discountPercentage,
  'description': instance.description,
  'images': instance.images,
  'nutritions': instance.nutritions,
  'rating': instance.rating,
  'review_count': instance.reviewCount,
  'reviews': instance.reviews,
};
