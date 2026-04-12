// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendOtpResponseImpl _$$SendOtpResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SendOtpResponseImpl(
  status: json['status'] as bool,
  message: json['message'] as String,
  msg91: json['msg91'] == null
      ? null
      : Msg91Info.fromJson(json['msg91'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SendOtpResponseImplToJson(
  _$SendOtpResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'msg91': instance.msg91,
};
