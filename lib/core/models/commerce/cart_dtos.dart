// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';

part 'cart_dtos.freezed.dart';
part 'cart_dtos.g.dart';

@freezed
class CartLineDto with _$CartLineDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CartLineDto({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String productId,
    required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    @JsonKey(fromJson: doubleFromJson) required double quantity,
    @JsonKey(fromJson: doubleFromJson) required double subtotal,
    @Default(false) bool isPreorder,
  }) = _CartLineDto;

  factory CartLineDto.fromJson(Map<String, dynamic> json) =>
      _$CartLineDtoFromJson(json);
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
      _$CartResponseFromJson(json);
}

@freezed
class CartAddResponse with _$CartAddResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CartAddResponse({
    required String message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson) required double cartTotal,
  }) = _CartAddResponse;

  factory CartAddResponse.fromJson(Map<String, dynamic> json) =>
      _$CartAddResponseFromJson(json);
}
