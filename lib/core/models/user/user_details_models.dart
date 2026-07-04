// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../catalog/json_converters.dart';
import '../safe_json_parse.dart';

part 'user_details_models.freezed.dart';
part 'user_details_models.g.dart';

/// GET/POST user profile. API may return `name` or `username` for display name.
@freezed
class UserDetails with _$UserDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserDetails({
    @JsonKey(fromJson: stringFromJson) String? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? gender,
    @JsonKey(name: 'reward_coins', fromJson: intFromJson) @Default(0) int rewardCoins,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      userDetailsFromJsonLoose(json);
}

extension UserDetailsX on UserDetails {
  String get displayName {
    if (name != null && name!.trim().isNotEmpty) return name!.trim();
    if (username != null && username!.trim().isNotEmpty) {
      return username!.trim();
    }
    return '';
  }
}

@freezed
class UpdateUserDetailsResponse with _$UpdateUserDetailsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UpdateUserDetailsResponse({
    required String message,
    required UserDetails user,
  }) = _UpdateUserDetailsResponse;

  factory UpdateUserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      updateUserDetailsResponseFromJsonLoose(json);
}
