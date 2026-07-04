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
  @JsonKey(fromJson: stringFromJson)
  String get label => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get zoneId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get areaId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get addressLine => throw _privateConstructorUsedError;

  /// Pincode record id sent on create/update (`pincode` in API body).
  @JsonKey(fromJson: stringFromJson)
  String get pincode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'zone_name')
  String get zoneName => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String get areaName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pincode_value')
  String get pincodeValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson)
  int? get pincodeId => throw _privateConstructorUsedError;
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
    @JsonKey(fromJson: stringFromJson) String label,
    @JsonKey(fromJson: stringFromJson) String zoneId,
    @JsonKey(fromJson: stringFromJson) String areaId,
    @JsonKey(fromJson: stringFromJson) String addressLine,
    @JsonKey(fromJson: stringFromJson) String pincode,
    @JsonKey(fromJson: boolFromJson) bool isDefault,
    @JsonKey(name: 'zone_name') String zoneName,
    @JsonKey(name: 'area_name') String areaName,
    @JsonKey(name: 'pincode_value') String pincodeValue,
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson) int? pincodeId,
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
    Object? isDefault = null,
    Object? zoneName = null,
    Object? areaName = null,
    Object? pincodeValue = null,
    Object? pincodeId = freezed,
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
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            zoneName: null == zoneName
                ? _value.zoneName
                : zoneName // ignore: cast_nullable_to_non_nullable
                      as String,
            areaName: null == areaName
                ? _value.areaName
                : areaName // ignore: cast_nullable_to_non_nullable
                      as String,
            pincodeValue: null == pincodeValue
                ? _value.pincodeValue
                : pincodeValue // ignore: cast_nullable_to_non_nullable
                      as String,
            pincodeId: freezed == pincodeId
                ? _value.pincodeId
                : pincodeId // ignore: cast_nullable_to_non_nullable
                      as int?,
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
    @JsonKey(fromJson: stringFromJson) String label,
    @JsonKey(fromJson: stringFromJson) String zoneId,
    @JsonKey(fromJson: stringFromJson) String areaId,
    @JsonKey(fromJson: stringFromJson) String addressLine,
    @JsonKey(fromJson: stringFromJson) String pincode,
    @JsonKey(fromJson: boolFromJson) bool isDefault,
    @JsonKey(name: 'zone_name') String zoneName,
    @JsonKey(name: 'area_name') String areaName,
    @JsonKey(name: 'pincode_value') String pincodeValue,
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson) int? pincodeId,
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
    Object? isDefault = null,
    Object? zoneName = null,
    Object? areaName = null,
    Object? pincodeValue = null,
    Object? pincodeId = freezed,
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
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        zoneName: null == zoneName
            ? _value.zoneName
            : zoneName // ignore: cast_nullable_to_non_nullable
                  as String,
        areaName: null == areaName
            ? _value.areaName
            : areaName // ignore: cast_nullable_to_non_nullable
                  as String,
        pincodeValue: null == pincodeValue
            ? _value.pincodeValue
            : pincodeValue // ignore: cast_nullable_to_non_nullable
                  as String,
        pincodeId: freezed == pincodeId
            ? _value.pincodeId
            : pincodeId // ignore: cast_nullable_to_non_nullable
                  as int?,
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
    @JsonKey(fromJson: stringFromJson) required this.label,
    @JsonKey(fromJson: stringFromJson) required this.zoneId,
    @JsonKey(fromJson: stringFromJson) required this.areaId,
    @JsonKey(fromJson: stringFromJson) required this.addressLine,
    @JsonKey(fromJson: stringFromJson) required this.pincode,
    @JsonKey(fromJson: boolFromJson) this.isDefault = false,
    @JsonKey(name: 'zone_name') this.zoneName = '',
    @JsonKey(name: 'area_name') this.areaName = '',
    @JsonKey(name: 'pincode_value') this.pincodeValue = '',
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson) this.pincodeId,
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
  @JsonKey(fromJson: stringFromJson)
  final String label;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String zoneId;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String areaId;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String addressLine;

  /// Pincode record id sent on create/update (`pincode` in API body).
  @override
  @JsonKey(fromJson: stringFromJson)
  final String pincode;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool isDefault;
  @override
  @JsonKey(name: 'zone_name')
  final String zoneName;
  @override
  @JsonKey(name: 'area_name')
  final String areaName;
  @override
  @JsonKey(name: 'pincode_value')
  final String pincodeValue;
  @override
  @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson)
  final int? pincodeId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'UserAddressDto(id: $id, userId: $userId, label: $label, zoneId: $zoneId, areaId: $areaId, addressLine: $addressLine, pincode: $pincode, isDefault: $isDefault, zoneName: $zoneName, areaName: $areaName, pincodeValue: $pincodeValue, pincodeId: $pincodeId, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.pincodeValue, pincodeValue) ||
                other.pincodeValue == pincodeValue) &&
            (identical(other.pincodeId, pincodeId) ||
                other.pincodeId == pincodeId) &&
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
    isDefault,
    zoneName,
    areaName,
    pincodeValue,
    pincodeId,
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
    @JsonKey(fromJson: stringFromJson) required final String label,
    @JsonKey(fromJson: stringFromJson) required final String zoneId,
    @JsonKey(fromJson: stringFromJson) required final String areaId,
    @JsonKey(fromJson: stringFromJson) required final String addressLine,
    @JsonKey(fromJson: stringFromJson) required final String pincode,
    @JsonKey(fromJson: boolFromJson) final bool isDefault,
    @JsonKey(name: 'zone_name') final String zoneName,
    @JsonKey(name: 'area_name') final String areaName,
    @JsonKey(name: 'pincode_value') final String pincodeValue,
    @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson)
    final int? pincodeId,
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
  @JsonKey(fromJson: stringFromJson)
  String get label;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get zoneId;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get areaId;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get addressLine;

  /// Pincode record id sent on create/update (`pincode` in API body).
  @override
  @JsonKey(fromJson: stringFromJson)
  String get pincode;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get isDefault;
  @override
  @JsonKey(name: 'zone_name')
  String get zoneName;
  @override
  @JsonKey(name: 'area_name')
  String get areaName;
  @override
  @JsonKey(name: 'pincode_value')
  String get pincodeValue;
  @override
  @JsonKey(name: 'pincode_id', fromJson: intNullableFromJson)
  int? get pincodeId;
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
