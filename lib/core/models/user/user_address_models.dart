// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';
import '../safe_json_parse.dart';

part 'user_address_models.freezed.dart';
part 'user_address_models.g.dart';

@freezed
class CreateAddressResponse with _$CreateAddressResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateAddressResponse({
    @JsonKey(fromJson: stringFromJson) required String id,
  }) = _CreateAddressResponse;

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      createAddressResponseFromJsonLoose(json);
}

/// One row from `GET /api/user/addresses` → `{ "addresses": [...] }`.
@freezed
class UserAddressDto with _$UserAddressDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserAddressDto({
    @JsonKey(fromJson: intFromJson) required int id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) required int userId,
    @JsonKey(fromJson: stringFromJson) required String label,
    @JsonKey(fromJson: stringFromJson) required String zoneId,
    @JsonKey(fromJson: stringFromJson) required String areaId,
    @JsonKey(fromJson: stringFromJson) required String addressLine,
    @JsonKey(fromJson: stringFromJson) required String pincode,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool isDefault,
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson) int? pincodeId,
    String? createdAt,
    String? updatedAt,
  }) = _UserAddressDto;

  factory UserAddressDto.fromJson(Map<String, dynamic> json) =>
      userAddressFromJsonLoose(json);
}

UserAddressDto userAddressFromJsonLoose(Map<String, dynamic> json) {
  return UserAddressDto(
    id: intFromJson(json['id']),
    userId: intFromJson(json['user_id'] ?? json['userId']),
    label: stringFromJson(json['label']),
    zoneId: stringFromJson(json['zone_id'] ?? json['zoneId']),
    areaId: stringFromJson(json['area_id'] ?? json['areaId']),
    addressLine: stringFromJson(json['address_line'] ?? json['addressLine']),
    pincode: stringFromJson(json['pincode']),
    isDefault: boolFromJson(json['is_default'] ?? json['isDefault']),
    pincodeId: intNullableFromJson(json['pincode_id'] ?? json['pincodeId']),
    createdAt: json['created_at']?.toString() ?? json['createdAt']?.toString(),
    updatedAt: json['updated_at']?.toString() ?? json['updatedAt']?.toString(),
  );
}

List<UserAddressDto> userAddressesFromApi(dynamic data) {
  if (data == null) return [];
  List<dynamic> raw;
  if (data is List) {
    raw = data;
  } else if (data is Map<String, dynamic>) {
    final inner = data['addresses'] ?? data['data'];
    raw = inner is List ? inner : [];
  } else if (data is Map) {
    final map = Map<String, dynamic>.from(data);
    final inner = map['addresses'] ?? map['data'];
    raw = inner is List ? inner : [];
  } else {
    return [];
  }
  return raw
      .map((e) {
        if (e is! Map) return null;
        final map =
            e is Map<String, dynamic> ? e : Map<String, dynamic>.from(e);
        return userAddressFromJsonLoose(map);
      })
      .whereType<UserAddressDto>()
      .where((a) => a.id > 0)
      .toList();
}

extension UserAddressDtoX on UserAddressDto {
  String get displayLines {
    final parts = <String>[addressLine];
    if (pincode.isNotEmpty) parts.add('Pincode: $pincode');
    parts.add('Zone $zoneId · Area $areaId');
    return parts.join('\n');
  }

  /// One line for app bars (e.g. home): zone/area names when known.
  String headerSummary({String? zoneName, String? areaName}) {
    final zone = (zoneName ?? '').trim();
    final area = (areaName ?? '').trim();
    if (zone.isNotEmpty && area.isNotEmpty) return '$zone, $area';
    if (zone.isNotEmpty) return zone;
    if (area.isNotEmpty) return area;
    if (addressLine.trim().isNotEmpty) return addressLine.trim();
    if (label.trim().isNotEmpty) return label.trim();
    return 'Delivery address';
  }
}

UserAddressDto? pickDefaultAddress(List<UserAddressDto> addresses) {
  if (addresses.isEmpty) return null;
  return addresses.where((a) => a.isDefault).firstOrNull ?? addresses.first;
}
