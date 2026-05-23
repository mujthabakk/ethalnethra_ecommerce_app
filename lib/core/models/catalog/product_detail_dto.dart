// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters.dart';

part 'product_detail_dto.freezed.dart';
part 'product_detail_dto.g.dart';

@freezed
class ProductDetailDto with _$ProductDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductDetailDto({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(name: 'name_ml') @Default('') String nameMl,
    @JsonKey(fromJson: stringFromJson) required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required double displayPrice,
    @JsonKey(fromJson: boolFromJson) required bool preorderAvailable,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool instantOrderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) required bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required double discountPercentage,
    @JsonKey(fromJson: stringFromJson) @Default('') String imageUrl,
    @JsonKey(fromJson: stringFromJson) @Default('') String weight,
    @JsonKey(fromJson: stringFromJson) @Default('') String category,
    @JsonKey(fromJson: intFromJson) @Default(0) int stock,
    @JsonKey(fromJson: stringFromJson) @Default('') String type,
    String? description,
    @JsonKey(name: 'description_ml') String? descriptionMl,
    @JsonKey(fromJson: stringListFromJson) @Default([]) List<String> images,
    @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
    @Default([])
    List<dynamic> nutritions,
    @JsonKey(fromJson: doubleNullableFromJson) double? rating,
    @JsonKey(name: 'review_count', fromJson: intFromJson)
    @Default(0)
    int reviewCount,
    @JsonKey(fromJson: dynamicListFromJson) @Default([]) List<dynamic> reviews,
  }) = _ProductDetailDto;

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      productDetailFromJsonLoose(json);
}

ProductDetailDto productDetailFromJsonLoose(Map<String, dynamic> json) {
  return ProductDetailDto(
    id: stringFromJson(json['id']),
    nameMl: stringFromJson(json['name_ml'] ?? json['nameMl']),
    name: stringFromJson(json['name']),
    price: doubleFromJson(json['price']),
    ourPrice: doubleFromJson(json['our_price'] ?? json['ourPrice']),
    finalPrice: doubleFromJson(json['final_price'] ?? json['finalPrice']),
    displayPrice: doubleFromJson(json['display_price'] ?? json['displayPrice']),
    preorderAvailable:
        boolFromJson(json['preorder_available'] ?? json['preorderAvailable']),
    instantOrderAvailable: boolFromJson(
      json['instant_order_available'] ?? json['instantOrderAvailable'],
    ),
    preorderPrice:
        doubleNullableFromJson(json['preorder_price'] ?? json['preorderPrice']),
    hasDiscount: boolFromJson(json['has_discount'] ?? json['hasDiscount']),
    discountPercentage: doubleFromJson(
      json['discount_percentage'] ?? json['discountPercentage'],
    ),
    imageUrl: stringFromJson(json['image_url'] ?? json['imageUrl']),
    weight: stringFromJson(json['weight']),
    category: stringFromJson(json['category']),
    stock: intFromJson(json['stock']),
    type: stringFromJson(json['type']),
    description: json['description']?.toString(),
    descriptionMl: json['description_ml']?.toString() ??
        json['descriptionMl']?.toString(),
    images: stringListFromJson(json['images']),
    nutritions: dynamicListFromJson(json['nutritions']),
    rating: doubleNullableFromJson(json['rating']),
    reviewCount: intFromJson(json['review_count'] ?? json['reviewCount']),
    reviews: dynamicListFromJson(json['reviews']),
  );
}
