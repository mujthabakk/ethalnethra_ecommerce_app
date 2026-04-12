// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpResponseImpl _$$VerifyOtpResponseImplFromJson(
  Map<String, dynamic> json,
) => _$VerifyOtpResponseImpl(
  status: json['status'] as bool,
  message: json['message'] as String,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : AuthUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$VerifyOtpResponseImplToJson(
  _$VerifyOtpResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
