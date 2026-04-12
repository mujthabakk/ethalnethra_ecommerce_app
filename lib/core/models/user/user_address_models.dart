// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';

part 'user_address_models.freezed.dart';
part 'user_address_models.g.dart';

@freezed
class CreateAddressResponse with _$CreateAddressResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateAddressResponse({
    @JsonKey(fromJson: stringFromJson) required String id,
  }) = _CreateAddressResponse;

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressResponseFromJson(json);
}
