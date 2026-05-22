import 'package:freezed_annotation/freezed_annotation.dart';

import '../safe_json_parse.dart';
import 'msg91_info.dart';

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';

/// Response for [POST /api/auth/send-otp] and [POST /api/auth/resend-otp].
@freezed
class SendOtpResponse with _$SendOtpResponse {
  const factory SendOtpResponse({
    required bool status,
    required String message,
    Msg91Info? msg91,
  }) = _SendOtpResponse;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      sendOtpResponseFromJsonLoose(json);
}
