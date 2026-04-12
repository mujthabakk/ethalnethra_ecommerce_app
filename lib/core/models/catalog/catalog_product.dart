// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters.dart';

part 'catalog_product.freezed.dart';
part 'catalog_product.g.dart';

@freezed
class CatalogProduct with _$CatalogProduct {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CatalogProduct({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required double displayPrice,
    required bool preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    required bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required double discountPercentage,
    required String imageUrl,
    required String weight,
    required String category,
    @JsonKey(fromJson: doubleFromJson) required double stock,
    required String type,
  }) = _CatalogProduct;

  factory CatalogProduct.fromJson(Map<String, dynamic> json) =>
      _$CatalogProductFromJson(json);
}

@freezed
class ProductsListResponse with _$ProductsListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductsListResponse({
    required List<CatalogProduct> products,
    @JsonKey(fromJson: doubleFromJson) required double total,
    @JsonKey(fromJson: doubleFromJson) required double pages,
    @JsonKey(fromJson: doubleFromJson) required double currentPage,
  }) = _ProductsListResponse;

  factory ProductsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsListResponseFromJson(json);
}
