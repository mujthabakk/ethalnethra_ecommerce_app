// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';

part 'favorites_dtos.freezed.dart';
part 'favorites_dtos.g.dart';

@freezed
class FavoriteProductDto with _$FavoriteProductDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FavoriteProductDto({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
    @JsonKey(fromJson: doubleFromJson) required double price,
    required String imageUrl,
  }) = _FavoriteProductDto;

  factory FavoriteProductDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductDtoFromJson(json);
}

@freezed
class FavoritesListResponse with _$FavoritesListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FavoritesListResponse({
    required List<FavoriteProductDto> products,
  }) = _FavoritesListResponse;

  factory FavoritesListResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesListResponseFromJson(json);
}
