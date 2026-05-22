import 'package:freezed_annotation/freezed_annotation.dart';

import '../safe_json_parse.dart';
import 'auth_user.dart';

part 'verify_otp_response.freezed.dart';
part 'verify_otp_response.g.dart';

@freezed
class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    required bool status,
    required String message,
    String? token,
    AuthUser? user,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      verifyOtpResponseFromJsonLoose(json);
}
