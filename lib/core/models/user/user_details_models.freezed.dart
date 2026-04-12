// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  @JsonKey(fromJson: stringFromJson)
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this UserDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
    UserDetails value,
    $Res Function(UserDetails) then,
  ) = _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String? id,
    String? name,
    String? username,
    String? email,
    String? phone,
  });
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDetailsImplCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$UserDetailsImplCopyWith(
    _$UserDetailsImpl value,
    $Res Function(_$UserDetailsImpl) then,
  ) = __$$UserDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String? id,
    String? name,
    String? username,
    String? email,
    String? phone,
  });
}

/// @nodoc
class __$$UserDetailsImplCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$UserDetailsImpl>
    implements _$$UserDetailsImplCopyWith<$Res> {
  __$$UserDetailsImplCopyWithImpl(
    _$UserDetailsImpl _value,
    $Res Function(_$UserDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _$UserDetailsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserDetailsImpl implements _UserDetails {
  const _$UserDetailsImpl({
    @JsonKey(fromJson: stringFromJson) this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
  });

  factory _$UserDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;

  @override
  String toString() {
    return 'UserDetails(id: $id, name: $name, username: $username, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, email, phone);

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      __$$UserDetailsImplCopyWithImpl<_$UserDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsImplToJson(this);
  }
}

abstract class _UserDetails implements UserDetails {
  const factory _UserDetails({
    @JsonKey(fromJson: stringFromJson) final String? id,
    final String? name,
    final String? username,
    final String? email,
    final String? phone,
  }) = _$UserDetailsImpl;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$UserDetailsImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String? get id;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;

  /// Create a copy of UserDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailsImplCopyWith<_$UserDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserDetailsResponse _$UpdateUserDetailsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateUserDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserDetailsResponse {
  String get message => throw _privateConstructorUsedError;
  UserDetails get user => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserDetailsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserDetailsResponseCopyWith<UpdateUserDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserDetailsResponseCopyWith<$Res> {
  factory $UpdateUserDetailsResponseCopyWith(
    UpdateUserDetailsResponse value,
    $Res Function(UpdateUserDetailsResponse) then,
  ) = _$UpdateUserDetailsResponseCopyWithImpl<$Res, UpdateUserDetailsResponse>;
  @useResult
  $Res call({String message, UserDetails user});

  $UserDetailsCopyWith<$Res> get user;
}

/// @nodoc
class _$UpdateUserDetailsResponseCopyWithImpl<
  $Res,
  $Val extends UpdateUserDetailsResponse
>
    implements $UpdateUserDetailsResponseCopyWith<$Res> {
  _$UpdateUserDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? user = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserDetails,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get user {
    return $UserDetailsCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateUserDetailsResponseImplCopyWith<$Res>
    implements $UpdateUserDetailsResponseCopyWith<$Res> {
  factory _$$UpdateUserDetailsResponseImplCopyWith(
    _$UpdateUserDetailsResponseImpl value,
    $Res Function(_$UpdateUserDetailsResponseImpl) then,
  ) = __$$UpdateUserDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, UserDetails user});

  @override
  $UserDetailsCopyWith<$Res> get user;
}

/// @nodoc
class __$$UpdateUserDetailsResponseImplCopyWithImpl<$Res>
    extends
        _$UpdateUserDetailsResponseCopyWithImpl<
          $Res,
          _$UpdateUserDetailsResponseImpl
        >
    implements _$$UpdateUserDetailsResponseImplCopyWith<$Res> {
  __$$UpdateUserDetailsResponseImplCopyWithImpl(
    _$UpdateUserDetailsResponseImpl _value,
    $Res Function(_$UpdateUserDetailsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? user = null}) {
    return _then(
      _$UpdateUserDetailsResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserDetails,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UpdateUserDetailsResponseImpl implements _UpdateUserDetailsResponse {
  const _$UpdateUserDetailsResponseImpl({
    required this.message,
    required this.user,
  });

  factory _$UpdateUserDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserDetailsResponseImplFromJson(json);

  @override
  final String message;
  @override
  final UserDetails user;

  @override
  String toString() {
    return 'UpdateUserDetailsResponse(message: $message, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserDetailsResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, user);

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserDetailsResponseImplCopyWith<_$UpdateUserDetailsResponseImpl>
  get copyWith =>
      __$$UpdateUserDetailsResponseImplCopyWithImpl<
        _$UpdateUserDetailsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserDetailsResponseImplToJson(this);
  }
}

abstract class _UpdateUserDetailsResponse implements UpdateUserDetailsResponse {
  const factory _UpdateUserDetailsResponse({
    required final String message,
    required final UserDetails user,
  }) = _$UpdateUserDetailsResponseImpl;

  factory _UpdateUserDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateUserDetailsResponseImpl.fromJson;

  @override
  String get message;
  @override
  UserDetails get user;

  /// Create a copy of UpdateUserDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserDetailsResponseImplCopyWith<_$UpdateUserDetailsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
