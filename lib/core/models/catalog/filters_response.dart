// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters.dart';

part 'filters_response.freezed.dart';
part 'filters_response.g.dart';

FiltersResponse filtersResponseFromJsonLoose(Map<String, dynamic> json) =>
    FiltersResponse(
      categories: stringListFlexibleFromJson(
        json['categories'] ?? json['category'],
      ),
      brands: stringListFlexibleFromJson(json['brands'] ?? json['brand']),
    );

@freezed
class FiltersResponse with _$FiltersResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FiltersResponse({
    @JsonKey(fromJson: stringListFlexibleFromJson)
    required List<String> categories,
    @JsonKey(fromJson: stringListFlexibleFromJson) required List<String> brands,
  }) = _FiltersResponse;

  factory FiltersResponse.fromJson(Map<String, dynamic> json) =>
      filtersResponseFromJsonLoose(json);
}
