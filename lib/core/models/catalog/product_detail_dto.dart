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
    @JsonKey(fromJson: stringFromJson) required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required double displayPrice,
    required bool preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    required bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required double discountPercentage,
    String? description,
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
      _$ProductDetailDtoFromJson(json);
}
