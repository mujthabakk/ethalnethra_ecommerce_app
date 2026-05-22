// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';
import '../safe_json_parse.dart';

part 'cart_dtos.freezed.dart';
part 'cart_dtos.g.dart';

@freezed
class CartLineDto with _$CartLineDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CartLineDto({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String productId,
    @JsonKey(name: 'name_ml') @Default('') String nameMl,
    @JsonKey(fromJson: stringFromJson) required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double quantity,
    @JsonKey(fromJson: stringFromJson) @Default('') String imageUrl,
    @JsonKey(fromJson: doubleFromJson) required double subtotal,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool isPreorder,
    @JsonKey(name: 'is_accept', fromJson: boolFromJson)
    @Default(true)
    bool isAccept,
  }) = _CartLineDto;

  factory CartLineDto.fromJson(Map<String, dynamic> json) =>
      cartLineFromJsonLoose(json);
}

CartLineDto cartLineFromJsonLoose(Map<String, dynamic> json) {
  return CartLineDto(
    id: stringFromJson(json['id']),
    productId: stringFromJson(json['product_id'] ?? json['productId']),
    nameMl: stringFromJson(json['name_ml'] ?? json['nameMl']),
    name: stringFromJson(json['name']),
    price: doubleFromJson(json['price']),
    quantity: doubleFromJson(json['quantity']),
    imageUrl: stringFromJson(json['image_url'] ?? json['imageUrl']),
    subtotal: doubleFromJson(json['subtotal']),
    isPreorder: boolFromJson(json['is_preorder'] ?? json['isPreorder']),
    isAccept: boolFromJson(json['is_accept'] ?? json['isAccept'] ?? true),
  );
}

@freezed
class CartResponse with _$CartResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CartResponse({
    @Default([]) List<CartLineDto> instant,
    @Default([]) List<CartLineDto> preorder,
    @JsonKey(fromJson: doubleFromJson) required double total,
    @JsonKey(name: 'item_count', fromJson: intFromJson) required int itemCount,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      cartResponseFromJsonLoose(json);
}

CartResponse cartResponseFromJsonLoose(Map<String, dynamic> json) {
  final instant = <CartLineDto>[];
  final preorder = <CartLineDto>[];
  final instantRaw = json['instant'];
  if (instantRaw is List) {
    for (final item in instantRaw) {
      if (item is! Map) continue;
      final map = item is Map<String, dynamic>
          ? item
          : Map<String, dynamic>.from(item);
      instant.add(cartLineFromJsonLoose(map));
    }
  }
  final preorderRaw = json['preorder'];
  if (preorderRaw is List) {
    for (final item in preorderRaw) {
      if (item is! Map) continue;
      final map = item is Map<String, dynamic>
          ? item
          : Map<String, dynamic>.from(item);
      preorder.add(cartLineFromJsonLoose(map));
    }
  }
  return CartResponse(
    instant: instant.where((l) => l.id.isNotEmpty).toList(),
    preorder: preorder.where((l) => l.id.isNotEmpty).toList(),
    total: doubleFromJson(json['total']),
    itemCount: intFromJson(json['item_count'] ?? json['itemCount']),
  );
}

@freezed
class CartAddResponse with _$CartAddResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CartAddResponse({
    required String message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson) required double cartTotal,
  }) = _CartAddResponse;

  factory CartAddResponse.fromJson(Map<String, dynamic> json) =>
      cartAddResponseFromJsonLoose(json);
}
