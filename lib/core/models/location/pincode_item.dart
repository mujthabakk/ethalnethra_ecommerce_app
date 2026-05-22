// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';

part 'pincode_item.freezed.dart';
part 'pincode_item.g.dart';

@freezed
class PincodeItem with _$PincodeItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PincodeItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    @JsonKey(fromJson: stringFromJson) required String pincode,
  }) = _PincodeItem;

  factory PincodeItem.fromJson(Map<String, dynamic> json) =>
      _$PincodeItemFromJson(json);
}

/// Parses `/api/locations/pincodes` (objects or plain strings).
List<PincodeItem> pincodeItemsFromApi(dynamic raw) {
  if (raw == null) return [];
  final list = raw is List ? raw : (raw is Map ? raw['pincodes'] : null);
  if (list is! List) return [];
  return list.map((e) {
    if (e is String) {
      return PincodeItem(id: e, pincode: e);
    }
    if (e is Map<String, dynamic>) {
      return PincodeItem.fromJson(_normalizePincodeJson(e));
    }
    if (e is Map) {
      return PincodeItem.fromJson(_normalizePincodeJson(Map<String, dynamic>.from(e)));
    }
    return PincodeItem(id: e.toString(), pincode: e.toString());
  }).toList();
}

Map<String, dynamic> _normalizePincodeJson(Map<String, dynamic> json) {
  final normalized = Map<String, dynamic>.from(json);
  if (!normalized.containsKey('id') || normalized['id'] == null) {
    final altId = normalized['pincode_id'];
    if (altId != null) normalized['id'] = altId;
  }
  return normalized;
}

@freezed
class PincodesListResponse with _$PincodesListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PincodesListResponse({
    required List<PincodeItem> pincodes,
  }) = _PincodesListResponse;

  factory PincodesListResponse.fromJson(Map<String, dynamic> json) =>
      _$PincodesListResponseFromJson(json);
}
