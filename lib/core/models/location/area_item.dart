// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';

part 'area_item.freezed.dart';
part 'area_item.g.dart';

@freezed
class AreaItem with _$AreaItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AreaItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
  }) = _AreaItem;

  factory AreaItem.fromJson(Map<String, dynamic> json) =>
      _$AreaItemFromJson(json);
}

@freezed
class AreasListResponse with _$AreasListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AreasListResponse({
    required List<AreaItem> areas,
  }) = _AreasListResponse;

  factory AreasListResponse.fromJson(Map<String, dynamic> json) =>
      _$AreasListResponseFromJson(json);
}
