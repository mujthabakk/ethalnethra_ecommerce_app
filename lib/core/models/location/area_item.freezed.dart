// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AreaItem _$AreaItemFromJson(Map<String, dynamic> json) {
  return _AreaItem.fromJson(json);
}

/// @nodoc
mixin _$AreaItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AreaItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaItemCopyWith<AreaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaItemCopyWith<$Res> {
  factory $AreaItemCopyWith(AreaItem value, $Res Function(AreaItem) then) =
      _$AreaItemCopyWithImpl<$Res, AreaItem>;
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id, String name});
}

/// @nodoc
class _$AreaItemCopyWithImpl<$Res, $Val extends AreaItem>
    implements $AreaItemCopyWith<$Res> {
  _$AreaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaItem
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
abstract class _$$AreaItemImplCopyWith<$Res>
    implements $AreaItemCopyWith<$Res> {
  factory _$$AreaItemImplCopyWith(
    _$AreaItemImpl value,
    $Res Function(_$AreaItemImpl) then,
  ) = __$$AreaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: stringFromJson) String id, String name});
}

/// @nodoc
class __$$AreaItemImplCopyWithImpl<$Res>
    extends _$AreaItemCopyWithImpl<$Res, _$AreaItemImpl>
    implements _$$AreaItemImplCopyWith<$Res> {
  __$$AreaItemImplCopyWithImpl(
    _$AreaItemImpl _value,
    $Res Function(_$AreaItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AreaItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$AreaItemImpl(
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
class _$AreaItemImpl implements _AreaItem {
  const _$AreaItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    required this.name,
  });

  factory _$AreaItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'AreaItem(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AreaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaItemImplCopyWith<_$AreaItemImpl> get copyWith =>
      __$$AreaItemImplCopyWithImpl<_$AreaItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaItemImplToJson(this);
  }
}

abstract class _AreaItem implements AreaItem {
  const factory _AreaItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    required final String name,
  }) = _$AreaItemImpl;

  factory _AreaItem.fromJson(Map<String, dynamic> json) =
      _$AreaItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  String get name;

  /// Create a copy of AreaItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaItemImplCopyWith<_$AreaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AreasListResponse _$AreasListResponseFromJson(Map<String, dynamic> json) {
  return _AreasListResponse.fromJson(json);
}

/// @nodoc
mixin _$AreasListResponse {
  List<AreaItem> get areas => throw _privateConstructorUsedError;

  /// Serializes this AreasListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreasListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreasListResponseCopyWith<AreasListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreasListResponseCopyWith<$Res> {
  factory $AreasListResponseCopyWith(
    AreasListResponse value,
    $Res Function(AreasListResponse) then,
  ) = _$AreasListResponseCopyWithImpl<$Res, AreasListResponse>;
  @useResult
  $Res call({List<AreaItem> areas});
}

/// @nodoc
class _$AreasListResponseCopyWithImpl<$Res, $Val extends AreasListResponse>
    implements $AreasListResponseCopyWith<$Res> {
  _$AreasListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreasListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? areas = null}) {
    return _then(
      _value.copyWith(
            areas: null == areas
                ? _value.areas
                : areas // ignore: cast_nullable_to_non_nullable
                      as List<AreaItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AreasListResponseImplCopyWith<$Res>
    implements $AreasListResponseCopyWith<$Res> {
  factory _$$AreasListResponseImplCopyWith(
    _$AreasListResponseImpl value,
    $Res Function(_$AreasListResponseImpl) then,
  ) = __$$AreasListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AreaItem> areas});
}

/// @nodoc
class __$$AreasListResponseImplCopyWithImpl<$Res>
    extends _$AreasListResponseCopyWithImpl<$Res, _$AreasListResponseImpl>
    implements _$$AreasListResponseImplCopyWith<$Res> {
  __$$AreasListResponseImplCopyWithImpl(
    _$AreasListResponseImpl _value,
    $Res Function(_$AreasListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AreasListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? areas = null}) {
    return _then(
      _$AreasListResponseImpl(
        areas: null == areas
            ? _value._areas
            : areas // ignore: cast_nullable_to_non_nullable
                  as List<AreaItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AreasListResponseImpl implements _AreasListResponse {
  const _$AreasListResponseImpl({required final List<AreaItem> areas})
    : _areas = areas;

  factory _$AreasListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreasListResponseImplFromJson(json);

  final List<AreaItem> _areas;
  @override
  List<AreaItem> get areas {
    if (_areas is EqualUnmodifiableListView) return _areas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areas);
  }

  @override
  String toString() {
    return 'AreasListResponse(areas: $areas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreasListResponseImpl &&
            const DeepCollectionEquality().equals(other._areas, _areas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_areas));

  /// Create a copy of AreasListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreasListResponseImplCopyWith<_$AreasListResponseImpl> get copyWith =>
      __$$AreasListResponseImplCopyWithImpl<_$AreasListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AreasListResponseImplToJson(this);
  }
}

abstract class _AreasListResponse implements AreasListResponse {
  const factory _AreasListResponse({required final List<AreaItem> areas}) =
      _$AreasListResponseImpl;

  factory _AreasListResponse.fromJson(Map<String, dynamic> json) =
      _$AreasListResponseImpl.fromJson;

  @override
  List<AreaItem> get areas;

  /// Create a copy of AreasListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreasListResponseImplCopyWith<_$AreasListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
