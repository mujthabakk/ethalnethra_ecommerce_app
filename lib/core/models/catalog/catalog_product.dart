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
    @JsonKey(name: 'name_ml') @Default('') String nameMl,
    required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required double displayPrice,
    @JsonKey(fromJson: boolFromJson) required bool preorderAvailable,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool instantOrderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) required bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required double discountPercentage,
    required String imageUrl,
    required String weight,
    required String category,
    @JsonKey(fromJson: intFromJson) required int stock,
    @JsonKey(fromJson: stringFromJson) @Default('') String type,
  }) = _CatalogProduct;

  factory CatalogProduct.fromJson(Map<String, dynamic> json) =>
      catalogProductFromJsonLoose(json);
}

CatalogProduct catalogProductFromJsonLoose(Map<String, dynamic> json) {
  return CatalogProduct(
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
  );
}

@freezed
class ProductsListResponse with _$ProductsListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductsListResponse({
    required List<CatalogProduct> products,
    @JsonKey(fromJson: intFromJson) required int total,
    @JsonKey(fromJson: intFromJson) required int pages,
    @JsonKey(name: 'current_page', fromJson: intFromJson) required int currentPage,
  }) = _ProductsListResponse;

  factory ProductsListResponse.fromJson(Map<String, dynamic> json) =>
      productsListResponseFromJsonLoose(json);
}

ProductsListResponse productsListResponseFromJsonLoose(
  Map<String, dynamic> json,
) {
  final raw = json['products'];
  final products = <CatalogProduct>[];
  if (raw is List) {
    for (final item in raw) {
      if (item is! Map) continue;
      final map = item is Map<String, dynamic>
          ? item
          : Map<String, dynamic>.from(item);
      products.add(catalogProductFromJsonLoose(map));
    }
  }
  return ProductsListResponse(
    products: products.where((p) => p.id.isNotEmpty).toList(),
    total: intFromJson(json['total']),
    pages: intFromJson(json['pages']),
    currentPage: intFromJson(json['current_page'] ?? json['currentPage']),
  );
}
