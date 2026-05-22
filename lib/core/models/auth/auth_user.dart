import 'package:freezed_annotation/freezed_annotation.dart';

import '../safe_json_parse.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthUser({
    required int id,
    required String phone,
    required String name,
    required String email,
    required String createdAt,
    required String updatedAt,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      authUserFromJsonLoose(json);
}
