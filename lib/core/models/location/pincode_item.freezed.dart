// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pincode_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PincodeItem _$PincodeItemFromJson(Map<String, dynamic> json) {
  return _PincodeItem.fromJson(json);
}

/// @nodoc
mixin _$PincodeItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get pincode => throw _privateConstructorUsedError;

  /// Serializes this PincodeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PincodeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PincodeItemCopyWith<PincodeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PincodeItemCopyWith<$Res> {
  factory $PincodeItemCopyWith(
    PincodeItem value,
    $Res Function(PincodeItem) then,
  ) = _$PincodeItemCopyWithImpl<$Res, PincodeItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(fromJson: stringFromJson) String pincode,
  });
}

/// @nodoc
class _$PincodeItemCopyWithImpl<$Res, $Val extends PincodeItem>
    implements $PincodeItemCopyWith<$Res> {
  _$PincodeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PincodeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? pincode = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            pincode: null == pincode
                ? _value.pincode
                : pincode // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PincodeItemImplCopyWith<$Res>
    implements $PincodeItemCopyWith<$Res> {
  factory _$$PincodeItemImplCopyWith(
    _$PincodeItemImpl value,
    $Res Function(_$PincodeItemImpl) then,
  ) = __$$PincodeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(fromJson: stringFromJson) String pincode,
  });
}

/// @nodoc
class __$$PincodeItemImplCopyWithImpl<$Res>
    extends _$PincodeItemCopyWithImpl<$Res, _$PincodeItemImpl>
    implements _$$PincodeItemImplCopyWith<$Res> {
  __$$PincodeItemImplCopyWithImpl(
    _$PincodeItemImpl _value,
    $Res Function(_$PincodeItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PincodeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? pincode = null}) {
    return _then(
      _$PincodeItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        pincode: null == pincode
            ? _value.pincode
            : pincode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PincodeItemImpl implements _PincodeItem {
  const _$PincodeItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(fromJson: stringFromJson) required this.pincode,
  });

  factory _$PincodeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PincodeItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String pincode;

  @override
  String toString() {
    return 'PincodeItem(id: $id, pincode: $pincode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PincodeItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pincode, pincode) || other.pincode == pincode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pincode);

  /// Create a copy of PincodeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PincodeItemImplCopyWith<_$PincodeItemImpl> get copyWith =>
      __$$PincodeItemImplCopyWithImpl<_$PincodeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PincodeItemImplToJson(this);
  }
}

abstract class _PincodeItem implements PincodeItem {
  const factory _PincodeItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(fromJson: stringFromJson) required final String pincode,
  }) = _$PincodeItemImpl;

  factory _PincodeItem.fromJson(Map<String, dynamic> json) =
      _$PincodeItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get pincode;

  /// Create a copy of PincodeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PincodeItemImplCopyWith<_$PincodeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PincodesListResponse _$PincodesListResponseFromJson(Map<String, dynamic> json) {
  return _PincodesListResponse.fromJson(json);
}

/// @nodoc
mixin _$PincodesListResponse {
  List<PincodeItem> get pincodes => throw _privateConstructorUsedError;

  /// Serializes this PincodesListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PincodesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PincodesListResponseCopyWith<PincodesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PincodesListResponseCopyWith<$Res> {
  factory $PincodesListResponseCopyWith(
    PincodesListResponse value,
    $Res Function(PincodesListResponse) then,
  ) = _$PincodesListResponseCopyWithImpl<$Res, PincodesListResponse>;
  @useResult
  $Res call({List<PincodeItem> pincodes});
}

/// @nodoc
class _$PincodesListResponseCopyWithImpl<
  $Res,
  $Val extends PincodesListResponse
>
    implements $PincodesListResponseCopyWith<$Res> {
  _$PincodesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PincodesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pincodes = null}) {
    return _then(
      _value.copyWith(
            pincodes: null == pincodes
                ? _value.pincodes
                : pincodes // ignore: cast_nullable_to_non_nullable
                      as List<PincodeItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PincodesListResponseImplCopyWith<$Res>
    implements $PincodesListResponseCopyWith<$Res> {
  factory _$$PincodesListResponseImplCopyWith(
    _$PincodesListResponseImpl value,
    $Res Function(_$PincodesListResponseImpl) then,
  ) = __$$PincodesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PincodeItem> pincodes});
}

/// @nodoc
class __$$PincodesListResponseImplCopyWithImpl<$Res>
    extends _$PincodesListResponseCopyWithImpl<$Res, _$PincodesListResponseImpl>
    implements _$$PincodesListResponseImplCopyWith<$Res> {
  __$$PincodesListResponseImplCopyWithImpl(
    _$PincodesListResponseImpl _value,
    $Res Function(_$PincodesListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PincodesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pincodes = null}) {
    return _then(
      _$PincodesListResponseImpl(
        pincodes: null == pincodes
            ? _value._pincodes
            : pincodes // ignore: cast_nullable_to_non_nullable
                  as List<PincodeItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PincodesListResponseImpl implements _PincodesListResponse {
  const _$PincodesListResponseImpl({required final List<PincodeItem> pincodes})
    : _pincodes = pincodes;

  factory _$PincodesListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PincodesListResponseImplFromJson(json);

  final List<PincodeItem> _pincodes;
  @override
  List<PincodeItem> get pincodes {
    if (_pincodes is EqualUnmodifiableListView) return _pincodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pincodes);
  }

  @override
  String toString() {
    return 'PincodesListResponse(pincodes: $pincodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PincodesListResponseImpl &&
            const DeepCollectionEquality().equals(other._pincodes, _pincodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pincodes));

  /// Create a copy of PincodesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PincodesListResponseImplCopyWith<_$PincodesListResponseImpl>
  get copyWith =>
      __$$PincodesListResponseImplCopyWithImpl<_$PincodesListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PincodesListResponseImplToJson(this);
  }
}

abstract class _PincodesListResponse implements PincodesListResponse {
  const factory _PincodesListResponse({
    required final List<PincodeItem> pincodes,
  }) = _$PincodesListResponseImpl;

  factory _PincodesListResponse.fromJson(Map<String, dynamic> json) =
      _$PincodesListResponseImpl.fromJson;

  @override
  List<PincodeItem> get pincodes;

  /// Create a copy of PincodesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PincodesListResponseImplCopyWith<_$PincodesListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
