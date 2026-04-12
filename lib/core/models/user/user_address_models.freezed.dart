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

UserAddressDto _$UserAddressDtoFromJson(Map<String, dynamic> json) {
  return _UserAddressDto.fromJson(json);
}

/// @nodoc
mixin _$UserAddressDto {
  @JsonKey(fromJson: intFromJson)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: intFromJson)
  int get userId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get zoneId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get areaId => throw _privateConstructorUsedError;
  String get addressLine => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserAddressDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAddressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAddressDtoCopyWith<UserAddressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressDtoCopyWith<$Res> {
  factory $UserAddressDtoCopyWith(
    UserAddressDto value,
    $Res Function(UserAddressDto) then,
  ) = _$UserAddressDtoCopyWithImpl<$Res, UserAddressDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: intFromJson) int id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) int userId,
    String label,
    @JsonKey(fromJson: stringFromJson) String zoneId,
    @JsonKey(fromJson: stringFromJson) String areaId,
    String addressLine,
    String pincode,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class _$UserAddressDtoCopyWithImpl<$Res, $Val extends UserAddressDto>
    implements $UserAddressDtoCopyWith<$Res> {
  _$UserAddressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAddressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? label = null,
    Object? zoneId = null,
    Object? areaId = null,
    Object? addressLine = null,
    Object? pincode = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            zoneId: null == zoneId
                ? _value.zoneId
                : zoneId // ignore: cast_nullable_to_non_nullable
                      as String,
            areaId: null == areaId
                ? _value.areaId
                : areaId // ignore: cast_nullable_to_non_nullable
                      as String,
            addressLine: null == addressLine
                ? _value.addressLine
                : addressLine // ignore: cast_nullable_to_non_nullable
                      as String,
            pincode: null == pincode
                ? _value.pincode
                : pincode // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserAddressDtoImplCopyWith<$Res>
    implements $UserAddressDtoCopyWith<$Res> {
  factory _$$UserAddressDtoImplCopyWith(
    _$UserAddressDtoImpl value,
    $Res Function(_$UserAddressDtoImpl) then,
  ) = __$$UserAddressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: intFromJson) int id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) int userId,
    String label,
    @JsonKey(fromJson: stringFromJson) String zoneId,
    @JsonKey(fromJson: stringFromJson) String areaId,
    String addressLine,
    String pincode,
    String? createdAt,
    String? updatedAt,
  });
}

/// @nodoc
class __$$UserAddressDtoImplCopyWithImpl<$Res>
    extends _$UserAddressDtoCopyWithImpl<$Res, _$UserAddressDtoImpl>
    implements _$$UserAddressDtoImplCopyWith<$Res> {
  __$$UserAddressDtoImplCopyWithImpl(
    _$UserAddressDtoImpl _value,
    $Res Function(_$UserAddressDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserAddressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? label = null,
    Object? zoneId = null,
    Object? areaId = null,
    Object? addressLine = null,
    Object? pincode = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserAddressDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        zoneId: null == zoneId
            ? _value.zoneId
            : zoneId // ignore: cast_nullable_to_non_nullable
                  as String,
        areaId: null == areaId
            ? _value.areaId
            : areaId // ignore: cast_nullable_to_non_nullable
                  as String,
        addressLine: null == addressLine
            ? _value.addressLine
            : addressLine // ignore: cast_nullable_to_non_nullable
                  as String,
        pincode: null == pincode
            ? _value.pincode
            : pincode // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserAddressDtoImpl implements _UserAddressDto {
  const _$UserAddressDtoImpl({
    @JsonKey(fromJson: intFromJson) required this.id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) required this.userId,
    required this.label,
    @JsonKey(fromJson: stringFromJson) required this.zoneId,
    @JsonKey(fromJson: stringFromJson) required this.areaId,
    required this.addressLine,
    required this.pincode,
    this.createdAt,
    this.updatedAt,
  });

  factory _$UserAddressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: intFromJson)
  final int id;
  @override
  @JsonKey(name: 'user_id', fromJson: intFromJson)
  final int userId;
  @override
  final String label;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String zoneId;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String areaId;
  @override
  final String addressLine;
  @override
  final String pincode;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'UserAddressDto(id: $id, userId: $userId, label: $label, zoneId: $zoneId, areaId: $areaId, addressLine: $addressLine, pincode: $pincode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            (identical(other.addressLine, addressLine) ||
                other.addressLine == addressLine) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    label,
    zoneId,
    areaId,
    addressLine,
    pincode,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserAddressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressDtoImplCopyWith<_$UserAddressDtoImpl> get copyWith =>
      __$$UserAddressDtoImplCopyWithImpl<_$UserAddressDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressDtoImplToJson(this);
  }
}

abstract class _UserAddressDto implements UserAddressDto {
  const factory _UserAddressDto({
    @JsonKey(fromJson: intFromJson) required final int id,
    @JsonKey(name: 'user_id', fromJson: intFromJson) required final int userId,
    required final String label,
    @JsonKey(fromJson: stringFromJson) required final String zoneId,
    @JsonKey(fromJson: stringFromJson) required final String areaId,
    required final String addressLine,
    required final String pincode,
    final String? createdAt,
    final String? updatedAt,
  }) = _$UserAddressDtoImpl;

  factory _UserAddressDto.fromJson(Map<String, dynamic> json) =
      _$UserAddressDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: intFromJson)
  int get id;
  @override
  @JsonKey(name: 'user_id', fromJson: intFromJson)
  int get userId;
  @override
  String get label;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get zoneId;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get areaId;
  @override
  String get addressLine;
  @override
  String get pincode;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of UserAddressDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAddressDtoImplCopyWith<_$UserAddressDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
