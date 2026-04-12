// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ZoneItem _$ZoneItemFromJson(Map<String, dynamic> json) {
  return _ZoneItem.fromJson(json);
}

/// @nodoc
mixin _$ZoneItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ZoneItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ZoneItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZoneItemCopyWith<ZoneItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneItemCopyWith<$Res> {
  factory $ZoneItemCopyWith(ZoneItem value, $Res Function(ZoneItem) then) =
      _$ZoneItemCopyWithImpl<$Res, ZoneItem>;
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id, String name});
}

/// @nodoc
class _$ZoneItemCopyWithImpl<$Res, $Val extends ZoneItem>
    implements $ZoneItemCopyWith<$Res> {
  _$ZoneItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZoneItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ZoneItemImplCopyWith<$Res>
    implements $ZoneItemCopyWith<$Res> {
  factory _$$ZoneItemImplCopyWith(
    _$ZoneItemImpl value,
    $Res Function(_$ZoneItemImpl) then,
  ) = __$$ZoneItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id, String name});
}

/// @nodoc
class __$$ZoneItemImplCopyWithImpl<$Res>
    extends _$ZoneItemCopyWithImpl<$Res, _$ZoneItemImpl>
    implements _$$ZoneItemImplCopyWith<$Res> {
  __$$ZoneItemImplCopyWithImpl(
    _$ZoneItemImpl _value,
    $Res Function(_$ZoneItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ZoneItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$ZoneItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ZoneItemImpl implements _ZoneItem {
  const _$ZoneItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    required this.name,
  });

  factory _$ZoneItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ZoneItem(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ZoneItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneItemImplCopyWith<_$ZoneItemImpl> get copyWith =>
      __$$ZoneItemImplCopyWithImpl<_$ZoneItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneItemImplToJson(this);
  }
}

abstract class _ZoneItem implements ZoneItem {
  const factory _ZoneItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    required final String name,
  }) = _$ZoneItemImpl;

  factory _ZoneItem.fromJson(Map<String, dynamic> json) =
      _$ZoneItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  String get name;

  /// Create a copy of ZoneItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoneItemImplCopyWith<_$ZoneItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZonesListResponse _$ZonesListResponseFromJson(Map<String, dynamic> json) {
  return _ZonesListResponse.fromJson(json);
}

/// @nodoc
mixin _$ZonesListResponse {
  List<ZoneItem> get zones => throw _privateConstructorUsedError;

  /// Serializes this ZonesListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ZonesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZonesListResponseCopyWith<ZonesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZonesListResponseCopyWith<$Res> {
  factory $ZonesListResponseCopyWith(
    ZonesListResponse value,
    $Res Function(ZonesListResponse) then,
  ) = _$ZonesListResponseCopyWithImpl<$Res, ZonesListResponse>;
  @useResult
  $Res call({List<ZoneItem> zones});
}

/// @nodoc
class _$ZonesListResponseCopyWithImpl<$Res, $Val extends ZonesListResponse>
    implements $ZonesListResponseCopyWith<$Res> {
  _$ZonesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZonesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? zones = null}) {
    return _then(
      _value.copyWith(
            zones: null == zones
                ? _value.zones
                : zones // ignore: cast_nullable_to_non_nullable
                      as List<ZoneItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ZonesListResponseImplCopyWith<$Res>
    implements $ZonesListResponseCopyWith<$Res> {
  factory _$$ZonesListResponseImplCopyWith(
    _$ZonesListResponseImpl value,
    $Res Function(_$ZonesListResponseImpl) then,
  ) = __$$ZonesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ZoneItem> zones});
}

/// @nodoc
class __$$ZonesListResponseImplCopyWithImpl<$Res>
    extends _$ZonesListResponseCopyWithImpl<$Res, _$ZonesListResponseImpl>
    implements _$$ZonesListResponseImplCopyWith<$Res> {
  __$$ZonesListResponseImplCopyWithImpl(
    _$ZonesListResponseImpl _value,
    $Res Function(_$ZonesListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ZonesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? zones = null}) {
    return _then(
      _$ZonesListResponseImpl(
        zones: null == zones
            ? _value._zones
            : zones // ignore: cast_nullable_to_non_nullable
                  as List<ZoneItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ZonesListResponseImpl implements _ZonesListResponse {
  const _$ZonesListResponseImpl({required final List<ZoneItem> zones})
    : _zones = zones;

  factory _$ZonesListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZonesListResponseImplFromJson(json);

  final List<ZoneItem> _zones;
  @override
  List<ZoneItem> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  @override
  String toString() {
    return 'ZonesListResponse(zones: $zones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZonesListResponseImpl &&
            const DeepCollectionEquality().equals(other._zones, _zones));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_zones));

  /// Create a copy of ZonesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZonesListResponseImplCopyWith<_$ZonesListResponseImpl> get copyWith =>
      __$$ZonesListResponseImplCopyWithImpl<_$ZonesListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ZonesListResponseImplToJson(this);
  }
}

abstract class _ZonesListResponse implements ZonesListResponse {
  const factory _ZonesListResponse({required final List<ZoneItem> zones}) =
      _$ZonesListResponseImpl;

  factory _ZonesListResponse.fromJson(Map<String, dynamic> json) =
      _$ZonesListResponseImpl.fromJson;

  @override
  List<ZoneItem> get zones;

  /// Create a copy of ZonesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZonesListResponseImplCopyWith<_$ZonesListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
