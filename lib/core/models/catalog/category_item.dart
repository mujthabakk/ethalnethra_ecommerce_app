// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../safe_json_parse.dart';
import 'json_converters.dart';

part 'category_item.freezed.dart';
part 'category_item.g.dart';

@freezed
class CategoryItem with _$CategoryItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(name: 'name_ml') @Default('') String nameMl,
    required String name,
    String? imageUrl,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      categoryItemFromJsonLoose(json);
}

@freezed
class CategoryListResponse with _$CategoryListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryListResponse({
    required List<CategoryItem> categories,
  }) = _CategoryListResponse;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      categoryListResponseFromJsonLoose(json);
}
