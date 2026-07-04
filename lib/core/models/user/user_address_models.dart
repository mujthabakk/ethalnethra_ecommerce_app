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
    /// Pincode record id sent on create/update (`pincode` in API body).
    @JsonKey(fromJson: stringFromJson) required String pincode,
    @JsonKey(fromJson: boolFromJson) @Default(false) bool isDefault,
    @JsonKey(name: 'zone_name') @Default('') String zoneName,
    @JsonKey(name: 'area_name') @Default('') String areaName,
    @JsonKey(name: 'pincode_value') @Default('') String pincodeValue,
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson) int? pincodeId,
    String? createdAt,
    String? updatedAt,
  }) = _UserAddressDto;

  factory UserAddressDto.fromJson(Map<String, dynamic> json) =>
      userAddressFromJsonLoose(json);
}

UserAddressDto userAddressFromJsonLoose(Map<String, dynamic> json) {
  final pincodeRaw = stringFromJson(json['pincode']);
  return UserAddressDto(
    id: intFromJson(json['id']),
    userId: intFromJson(json['user_id'] ?? json['userId']),
    label: stringFromJson(json['label']),
    zoneId: stringFromJson(json['zone_id'] ?? json['zoneId']),
    areaId: stringFromJson(json['area_id'] ?? json['areaId']),
    addressLine: stringFromJson(json['address_line'] ?? json['addressLine']),
    pincode: pincodeRaw,
    isDefault: boolFromJson(json['is_default'] ?? json['isDefault']),
    zoneName: stringFromJson(json['zone_name'] ?? json['zoneName']),
    areaName: stringFromJson(json['area_name'] ?? json['areaName']),
    pincodeValue: stringFromJson(json['pincode_value'] ?? json['pincodeValue']),
    pincodeId: intNullableFromJson(
      json['pincode_id'] ?? json['pincodeId'] ?? pincodeRaw,
    ),
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
  /// Pincode id for dropdowns and create/update payloads.
  String get pincodeSelectionId =>
      pincodeId?.toString() ?? (pincode.isNotEmpty ? pincode : '');

  String get displayPincode =>
      pincodeValue.isNotEmpty ? pincodeValue : pincode;

  String get displayLines {
    final parts = <String>[];
    if (addressLine.trim().isNotEmpty) parts.add(addressLine.trim());
    if (areaName.isNotEmpty) {
      parts.add(areaName);
    } else if (zoneName.isNotEmpty) {
      parts.add(zoneName);
    }
    if (displayPincode.isNotEmpty) parts.add('Pincode: $displayPincode');
    if (parts.isEmpty) return label;
    return parts.join('\n');
  }

  /// One line for app bars (e.g. home). Uses API names when present.
  String headerSummary({String? zoneName, String? areaName}) {
    final zone = (zoneName ?? this.zoneName).trim();
    final area = (areaName ?? this.areaName).trim();
    if (zone.isNotEmpty && area.isNotEmpty) return '$zone, $area';
    if (zone.isNotEmpty) return zone;
    if (area.isNotEmpty) return area;
    if (addressLine.trim().isNotEmpty) return addressLine.trim();
    if (label.trim().isNotEmpty) return label.trim();
    return 'Delivery address';
  }

  bool get hasResolvedLocationNames =>
      zoneName.isNotEmpty || areaName.isNotEmpty;
}

UserAddressDto? pickDefaultAddress(List<UserAddressDto> addresses) {
  if (addresses.isEmpty) return null;
  return addresses.where((a) => a.isDefault).firstOrNull ?? addresses.first;
}
