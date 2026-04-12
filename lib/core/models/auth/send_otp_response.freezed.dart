// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) {
  return _SendOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$SendOtpResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Msg91Info? get msg91 => throw _privateConstructorUsedError;

  /// Serializes this SendOtpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpResponseCopyWith<SendOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpResponseCopyWith<$Res> {
  factory $SendOtpResponseCopyWith(
    SendOtpResponse value,
    $Res Function(SendOtpResponse) then,
  ) = _$SendOtpResponseCopyWithImpl<$Res, SendOtpResponse>;
  @useResult
  $Res call({bool status, String message, Msg91Info? msg91});

  $Msg91InfoCopyWith<$Res>? get msg91;
}

/// @nodoc
class _$SendOtpResponseCopyWithImpl<$Res, $Val extends SendOtpResponse>
    implements $SendOtpResponseCopyWith<$Res> {
  _$SendOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? msg91 = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            msg91: freezed == msg91
                ? _value.msg91
                : msg91 // ignore: cast_nullable_to_non_nullable
                      as Msg91Info?,
          )
          as $Val,
    );
  }

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Msg91InfoCopyWith<$Res>? get msg91 {
    if (_value.msg91 == null) {
      return null;
    }

    return $Msg91InfoCopyWith<$Res>(_value.msg91!, (value) {
      return _then(_value.copyWith(msg91: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SendOtpResponseImplCopyWith<$Res>
    implements $SendOtpResponseCopyWith<$Res> {
  factory _$$SendOtpResponseImplCopyWith(
    _$SendOtpResponseImpl value,
    $Res Function(_$SendOtpResponseImpl) then,
  ) = __$$SendOtpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, Msg91Info? msg91});

  @override
  $Msg91InfoCopyWith<$Res>? get msg91;
}

/// @nodoc
class __$$SendOtpResponseImplCopyWithImpl<$Res>
    extends _$SendOtpResponseCopyWithImpl<$Res, _$SendOtpResponseImpl>
    implements _$$SendOtpResponseImplCopyWith<$Res> {
  __$$SendOtpResponseImplCopyWithImpl(
    _$SendOtpResponseImpl _value,
    $Res Function(_$SendOtpResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? msg91 = freezed,
  }) {
    return _then(
      _$SendOtpResponseImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        msg91: freezed == msg91
            ? _value.msg91
            : msg91 // ignore: cast_nullable_to_non_nullable
                  as Msg91Info?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpResponseImpl implements _SendOtpResponse {
  const _$SendOtpResponseImpl({
    required this.status,
    required this.message,
    this.msg91,
  });

  factory _$SendOtpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final Msg91Info? msg91;

  @override
  String toString() {
    return 'SendOtpResponse(status: $status, message: $message, msg91: $msg91)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.msg91, msg91) || other.msg91 == msg91));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, msg91);

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpResponseImplCopyWith<_$SendOtpResponseImpl> get copyWith =>
      __$$SendOtpResponseImplCopyWithImpl<_$SendOtpResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpResponseImplToJson(this);
  }
}

abstract class _SendOtpResponse implements SendOtpResponse {
  const factory _SendOtpResponse({
    required final bool status,
    required final String message,
    final Msg91Info? msg91,
  }) = _$SendOtpResponseImpl;

  factory _SendOtpResponse.fromJson(Map<String, dynamic> json) =
      _$SendOtpResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  Msg91Info? get msg91;

  /// Create a copy of SendOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpResponseImplCopyWith<_$SendOtpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
