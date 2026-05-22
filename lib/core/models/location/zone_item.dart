// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';
import '../safe_json_parse.dart';

part 'zone_item.freezed.dart';
part 'zone_item.g.dart';

@freezed
class ZoneItem with _$ZoneItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ZoneItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String name,
  }) = _ZoneItem;

  factory ZoneItem.fromJson(Map<String, dynamic> json) =>
      zoneItemFromJsonLoose(json);
}

@freezed
class ZonesListResponse with _$ZonesListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ZonesListResponse({
    required List<ZoneItem> zones,
  }) = _ZonesListResponse;

  factory ZonesListResponse.fromJson(Map<String, dynamic> json) =>
      ZonesListResponse(zones: zonesFromJsonLoose(json));
}
