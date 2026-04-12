// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters_response.freezed.dart';
part 'filters_response.g.dart';

/// Parses API lists that may contain strings or small maps (e.g. `{ "name": "..." }`).
List<String> stringListFlexibleFromJson(dynamic json) {
  if (json == null) return [];
  if (json is! List) return [];
  return json.map((e) {
    if (e is String) return e;
    if (e is Map<String, dynamic>) {
      final name = e['name'] ?? e['title'] ?? e['brand'];
      if (name is String) return name;
    }
    return e?.toString() ?? '';
  }).where((s) => s.isNotEmpty).toList();
}

@freezed
class FiltersResponse with _$FiltersResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FiltersResponse({
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson) required List<String> brands,
  }) = _FiltersResponse;

  factory FiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$FiltersResponseFromJson(json);
}
