// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateAddressResponse _$CreateAddressResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreateAddressResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateAddressResponse {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;

  /// Serializes this CreateAddressResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAddressResponseCopyWith<CreateAddressResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAddressResponseCopyWith<$Res> {
  factory $CreateAddressResponseCopyWith(
    CreateAddressResponse value,
    $Res Function(CreateAddressResponse) then,
  ) = _$CreateAddressResponseCopyWithImpl<$Res, CreateAddressResponse>;
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id});
}

/// @nodoc
class _$CreateAddressResponseCopyWithImpl<
  $Res,
  $Val extends CreateAddressResponse
>
    implements $CreateAddressResponseCopyWith<$Res> {
  _$CreateAddressResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateAddressResponseImplCopyWith<$Res>
    implements $CreateAddressResponseCopyWith<$Res> {
  factory _$$CreateAddressResponseImplCopyWith(
    _$CreateAddressResponseImpl value,
    $Res Function(_$CreateAddressResponseImpl) then,
  ) = __$$CreateAddressResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id});
}

/// @nodoc
class __$$CreateAddressResponseImplCopyWithImpl<$Res>
    extends
        _$CreateAddressResponseCopyWithImpl<$Res, _$CreateAddressResponseImpl>
    implements _$$CreateAddressResponseImplCopyWith<$Res> {
  __$$CreateAddressResponseImplCopyWithImpl(
    _$CreateAddressResponseImpl _value,
    $Res Function(_$CreateAddressResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$CreateAddressResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CreateAddressResponseImpl implements _CreateAddressResponse {
  const _$CreateAddressResponseImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
  });

  factory _$CreateAddressResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAddressResponseImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;

  @override
  String toString() {
    return 'CreateAddressResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAddressResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of CreateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAddressResponseImplCopyWith<_$CreateAddressResponseImpl>
  get copyWith =>
      __$$CreateAddressResponseImplCopyWithImpl<_$CreateAddressResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAddressResponseImplToJson(this);
  }
}

abstract class _CreateAddressResponse implements CreateAddressResponse {
  const factory _CreateAddressResponse({
    @JsonKey(fromJson: stringFromJson) required final String id,
  }) = _$CreateAddressResponseImpl;

  factory _CreateAddressResponse.fromJson(Map<String, dynamic> json) =
      _$CreateAddressResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;

  /// Create a copy of CreateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAddressResponseImplCopyWith<_$CreateAddressResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
