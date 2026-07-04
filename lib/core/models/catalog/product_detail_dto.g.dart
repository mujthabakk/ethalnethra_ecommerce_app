// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailDtoImpl _$$ProductDetailDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ProductDetailDtoImpl(
  id: stringFromJson(json['id']),
  nameMl: json['name_ml'] as String? ?? '',
  name: stringFromJson(json['name']),
  price: doubleFromJson(json['price']),
  ourPrice: doubleFromJson(json['our_price']),
  finalPrice: doubleFromJson(json['final_price']),
  displayPrice: doubleFromJson(json['display_price']),
  preorderAvailable: boolFromJson(json['preorder_available']),
  instantOrderAvailable: json['instant_order_available'] == null
      ? false
      : boolFromJson(json['instant_order_available']),
  isCustomOrder: json['is_custom_order'] == null
      ? false
      : boolFromJson(json['is_custom_order']),
  isGramWise: json['is_gram_wise'] == null
      ? false
      : boolFromJson(json['is_gram_wise']),
  preorderOrderStartTime: json['preorder_order_start_time'] as String? ?? '',
  preorderOrderEndTime: json['preorder_order_end_time'] as String? ?? '',
  instantOrderStartTime: json['instant_order_start_time'] as String? ?? '',
  instantOrderEndTime: json['instant_order_end_time'] as String? ?? '',
  preorderPrice: doubleNullableFromJson(json['preorder_price']),
  hasDiscount: boolFromJson(json['has_discount']),
  discountPercentage: doubleFromJson(json['discount_percentage']),
  imageUrl: json['image_url'] == null ? '' : stringFromJson(json['image_url']),
  weight: json['weight'] == null ? '' : stringFromJson(json['weight']),
  category: json['category'] == null ? '' : stringFromJson(json['category']),
  stock: intNullableFromJson(json['stock']),
  type: json['type'] == null ? '' : stringFromJson(json['type']),
  description: json['description'] as String?,
  descriptionMl: json['description_ml'] as String?,
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
  'name_ml': instance.nameMl,
  'name': instance.name,
  'price': instance.price,
  'our_price': instance.ourPrice,
  'final_price': instance.finalPrice,
  'display_price': instance.displayPrice,
  'preorder_available': instance.preorderAvailable,
  'instant_order_available': instance.instantOrderAvailable,
  'is_custom_order': instance.isCustomOrder,
  'is_gram_wise': instance.isGramWise,
  'preorder_order_start_time': instance.preorderOrderStartTime,
  'preorder_order_end_time': instance.preorderOrderEndTime,
  'instant_order_start_time': instance.instantOrderStartTime,
  'instant_order_end_time': instance.instantOrderEndTime,
  'preorder_price': instance.preorderPrice,
  'has_discount': instance.hasDiscount,
  'discount_percentage': instance.discountPercentage,
  'image_url': instance.imageUrl,
  'weight': instance.weight,
  'category': instance.category,
  'stock': instance.stock,
  'type': instance.type,
  'description': instance.description,
  'description_ml': instance.descriptionMl,
  'images': instance.images,
  'nutritions': instance.nutritions,
  'rating': instance.rating,
  'review_count': instance.reviewCount,
  'reviews': instance.reviews,
};
