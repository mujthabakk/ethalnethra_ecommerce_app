// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'msg91_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Msg91Info _$Msg91InfoFromJson(Map<String, dynamic> json) {
  return _Msg91Info.fromJson(json);
}

/// @nodoc
mixin _$Msg91Info {
  String get requestId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this Msg91Info to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Msg91Info
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Msg91InfoCopyWith<Msg91Info> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Msg91InfoCopyWith<$Res> {
  factory $Msg91InfoCopyWith(Msg91Info value, $Res Function(Msg91Info) then) =
      _$Msg91InfoCopyWithImpl<$Res, Msg91Info>;
  @useResult
  $Res call({String requestId, String type});
}

/// @nodoc
class _$Msg91InfoCopyWithImpl<$Res, $Val extends Msg91Info>
    implements $Msg91InfoCopyWith<$Res> {
  _$Msg91InfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Msg91Info
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? requestId = null, Object? type = null}) {
    return _then(
      _value.copyWith(
            requestId: null == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Msg91InfoImplCopyWith<$Res>
    implements $Msg91InfoCopyWith<$Res> {
  factory _$$Msg91InfoImplCopyWith(
    _$Msg91InfoImpl value,
    $Res Function(_$Msg91InfoImpl) then,
  ) = __$$Msg91InfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, String type});
}

/// @nodoc
class __$$Msg91InfoImplCopyWithImpl<$Res>
    extends _$Msg91InfoCopyWithImpl<$Res, _$Msg91InfoImpl>
    implements _$$Msg91InfoImplCopyWith<$Res> {
  __$$Msg91InfoImplCopyWithImpl(
    _$Msg91InfoImpl _value,
    $Res Function(_$Msg91InfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Msg91Info
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? requestId = null, Object? type = null}) {
    return _then(
      _$Msg91InfoImpl(
        requestId: null == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$Msg91InfoImpl implements _Msg91Info {
  const _$Msg91InfoImpl({required this.requestId, required this.type});

  factory _$Msg91InfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$Msg91InfoImplFromJson(json);

  @override
  final String requestId;
  @override
  final String type;

  @override
  String toString() {
    return 'Msg91Info(requestId: $requestId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Msg91InfoImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, type);

  /// Create a copy of Msg91Info
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Msg91InfoImplCopyWith<_$Msg91InfoImpl> get copyWith =>
      __$$Msg91InfoImplCopyWithImpl<_$Msg91InfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Msg91InfoImplToJson(this);
  }
}

abstract class _Msg91Info implements Msg91Info {
  const factory _Msg91Info({
    required final String requestId,
    required final String type,
  }) = _$Msg91InfoImpl;

  factory _Msg91Info.fromJson(Map<String, dynamic> json) =
      _$Msg91InfoImpl.fromJson;

  @override
  String get requestId;
  @override
  String get type;

  /// Create a copy of Msg91Info
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Msg91InfoImplCopyWith<_$Msg91InfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
