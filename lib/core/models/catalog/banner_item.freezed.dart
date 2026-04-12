// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) {
  return _BannerItem.fromJson(json);
}

/// @nodoc
mixin _$BannerItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this BannerItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerItemCopyWith<BannerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerItemCopyWith<$Res> {
  factory $BannerItemCopyWith(
    BannerItem value,
    $Res Function(BannerItem) then,
  ) = _$BannerItemCopyWithImpl<$Res, BannerItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String title,
    String imageUrl,
    String? description,
  });
}

/// @nodoc
class _$BannerItemCopyWithImpl<$Res, $Val extends BannerItem>
    implements $BannerItemCopyWith<$Res> {
  _$BannerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerItemImplCopyWith<$Res>
    implements $BannerItemCopyWith<$Res> {
  factory _$$BannerItemImplCopyWith(
    _$BannerItemImpl value,
    $Res Function(_$BannerItemImpl) then,
  ) = __$$BannerItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String title,
    String imageUrl,
    String? description,
  });
}

/// @nodoc
class __$$BannerItemImplCopyWithImpl<$Res>
    extends _$BannerItemCopyWithImpl<$Res, _$BannerItemImpl>
    implements _$$BannerItemImplCopyWith<$Res> {
  __$$BannerItemImplCopyWithImpl(
    _$BannerItemImpl _value,
    $Res Function(_$BannerItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? description = freezed,
  }) {
    return _then(
      _$BannerItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BannerItemImpl implements _BannerItem {
  const _$BannerItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
  });

  factory _$BannerItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'BannerItem(id: $id, title: $title, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, imageUrl, description);

  /// Create a copy of BannerItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerItemImplCopyWith<_$BannerItemImpl> get copyWith =>
      __$$BannerItemImplCopyWithImpl<_$BannerItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerItemImplToJson(this);
  }
}

abstract class _BannerItem implements BannerItem {
  const factory _BannerItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    required final String title,
    required final String imageUrl,
    final String? description,
  }) = _$BannerItemImpl;

  factory _BannerItem.fromJson(Map<String, dynamic> json) =
      _$BannerItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String? get description;

  /// Create a copy of BannerItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerItemImplCopyWith<_$BannerItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BannerListResponse _$BannerListResponseFromJson(Map<String, dynamic> json) {
  return _BannerListResponse.fromJson(json);
}

/// @nodoc
mixin _$BannerListResponse {
  List<BannerItem> get banners => throw _privateConstructorUsedError;

  /// Serializes this BannerListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerListResponseCopyWith<BannerListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerListResponseCopyWith<$Res> {
  factory $BannerListResponseCopyWith(
    BannerListResponse value,
    $Res Function(BannerListResponse) then,
  ) = _$BannerListResponseCopyWithImpl<$Res, BannerListResponse>;
  @useResult
  $Res call({List<BannerItem> banners});
}

/// @nodoc
class _$BannerListResponseCopyWithImpl<$Res, $Val extends BannerListResponse>
    implements $BannerListResponseCopyWith<$Res> {
  _$BannerListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? banners = null}) {
    return _then(
      _value.copyWith(
            banners: null == banners
                ? _value.banners
                : banners // ignore: cast_nullable_to_non_nullable
                      as List<BannerItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerListResponseImplCopyWith<$Res>
    implements $BannerListResponseCopyWith<$Res> {
  factory _$$BannerListResponseImplCopyWith(
    _$BannerListResponseImpl value,
    $Res Function(_$BannerListResponseImpl) then,
  ) = __$$BannerListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BannerItem> banners});
}

/// @nodoc
class __$$BannerListResponseImplCopyWithImpl<$Res>
    extends _$BannerListResponseCopyWithImpl<$Res, _$BannerListResponseImpl>
    implements _$$BannerListResponseImplCopyWith<$Res> {
  __$$BannerListResponseImplCopyWithImpl(
    _$BannerListResponseImpl _value,
    $Res Function(_$BannerListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? banners = null}) {
    return _then(
      _$BannerListResponseImpl(
        banners: null == banners
            ? _value._banners
            : banners // ignore: cast_nullable_to_non_nullable
                  as List<BannerItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BannerListResponseImpl implements _BannerListResponse {
  const _$BannerListResponseImpl({required final List<BannerItem> banners})
    : _banners = banners;

  factory _$BannerListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerListResponseImplFromJson(json);

  final List<BannerItem> _banners;
  @override
  List<BannerItem> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'BannerListResponse(banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerListResponseImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banners));

  /// Create a copy of BannerListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerListResponseImplCopyWith<_$BannerListResponseImpl> get copyWith =>
      __$$BannerListResponseImplCopyWithImpl<_$BannerListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerListResponseImplToJson(this);
  }
}

abstract class _BannerListResponse implements BannerListResponse {
  const factory _BannerListResponse({required final List<BannerItem> banners}) =
      _$BannerListResponseImpl;

  factory _BannerListResponse.fromJson(Map<String, dynamic> json) =
      _$BannerListResponseImpl.fromJson;

  @override
  List<BannerItem> get banners;

  /// Create a copy of BannerListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerListResponseImplCopyWith<_$BannerListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
