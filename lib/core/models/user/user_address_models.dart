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

/// One row from `GET /api/user/addresses` (JSON array).
@freezed
class UserAddressDto with _$UserAddressDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserAddressDto({
    @JsonKey(fromJson: intFromJson) required int id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) required int userId,
    required String label,
    @JsonKey(fromJson: stringFromJson) required String zoneId,
    @JsonKey(fromJson: stringFromJson) required String areaId,
    required String addressLine,
    required String pincode,
    String? createdAt,
    String? updatedAt,
  }) = _UserAddressDto;

  factory UserAddressDto.fromJson(Map<String, dynamic> json) =>
      _$UserAddressDtoFromJson(json);
}

extension UserAddressDtoX on UserAddressDto {
  String get displayLines =>
      '$addressLine\nPin $pincode (Zone $zoneId, Area $areaId)';
}
