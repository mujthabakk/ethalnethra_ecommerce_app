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
      instantOrderAvailable: json['instant_order_available'] == null
          ? false
          : boolFromJson(json['instant_order_available']),
      isCustomOrder: json['is_custom_order'] == null
          ? false
          : boolFromJson(json['is_custom_order']),
      isGramWise: json['is_gram_wise'] == null
          ? false
          : boolFromJson(json['is_gram_wise']),
      preorderOrderStartTime:
          json['preorder_order_start_time'] as String? ?? '',
      preorderOrderEndTime: json['preorder_order_end_time'] as String? ?? '',
      instantOrderStartTime: json['instant_order_start_time'] as String? ?? '',
      instantOrderEndTime: json['instant_order_end_time'] as String? ?? '',
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
