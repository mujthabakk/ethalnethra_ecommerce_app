// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogProductImpl _$$CatalogProductImplFromJson(Map<String, dynamic> json) =>
    _$CatalogProductImpl(
      id: stringFromJson(json['id']),
      nameMl: json['name_ml'] as String? ?? '',
      name: json['name'] as String,
      price: doubleFromJson(json['price']),
      ourPrice: doubleFromJson(json['our_price']),
      finalPrice: doubleFromJson(json['final_price']),
      displayPrice: doubleFromJson(json['display_price']),
      preorderAvailable: boolFromJson(json['preorder_available']),
      preorderPrice: doubleNullableFromJson(json['preorder_price']),
      hasDiscount: boolFromJson(json['has_discount']),
      discountPercentage: doubleFromJson(json['discount_percentage']),
      imageUrl: json['image_url'] as String,
      weight: json['weight'] as String,
      category: json['category'] as String,
      stock: intFromJson(json['stock']),
      type: json['type'] == null ? '' : stringFromJson(json['type']),
    );

Map<String, dynamic> _$$CatalogProductImplToJson(
  _$CatalogProductImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_ml': instance.nameMl,
  'name': instance.name,
  'price': instance.price,
  'our_price': instance.ourPrice,
  'final_price': instance.finalPrice,
  'display_price': instance.displayPrice,
  'preorder_available': instance.preorderAvailable,
  'preorder_price': instance.preorderPrice,
  'has_discount': instance.hasDiscount,
  'discount_percentage': instance.discountPercentage,
  'image_url': instance.imageUrl,
  'weight': instance.weight,
  'category': instance.category,
  'stock': instance.stock,
  'type': instance.type,
};

_$ProductsListResponseImpl _$$ProductsListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductsListResponseImpl(
  products: (json['products'] as List<dynamic>)
      .map((e) => CatalogProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: intFromJson(json['total']),
  pages: intFromJson(json['pages']),
  currentPage: intFromJson(json['current_page']),
);

Map<String, dynamic> _$$ProductsListResponseImplToJson(
  _$ProductsListResponseImpl instance,
) => <String, dynamic>{
  'products': instance.products,
  'total': instance.total,
  'pages': instance.pages,
  'current_page': instance.currentPage,
};
