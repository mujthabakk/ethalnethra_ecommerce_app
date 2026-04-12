// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return _CategoryItem.fromJson(json);
}

/// @nodoc
mixin _$CategoryItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CategoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryItemCopyWith<CategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemCopyWith<$Res> {
  factory $CategoryItemCopyWith(
    CategoryItem value,
    $Res Function(CategoryItem) then,
  ) = _$CategoryItemCopyWithImpl<$Res, CategoryItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String name,
    String? imageUrl,
  });
}

/// @nodoc
class _$CategoryItemCopyWithImpl<$Res, $Val extends CategoryItem>
    implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
  }) {
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
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryItemImplCopyWith<$Res>
    implements $CategoryItemCopyWith<$Res> {
  factory _$$CategoryItemImplCopyWith(
    _$CategoryItemImpl value,
    $Res Function(_$CategoryItemImpl) then,
  ) = __$$CategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String name,
    String? imageUrl,
  });
}

/// @nodoc
class __$$CategoryItemImplCopyWithImpl<$Res>
    extends _$CategoryItemCopyWithImpl<$Res, _$CategoryItemImpl>
    implements _$$CategoryItemImplCopyWith<$Res> {
  __$$CategoryItemImplCopyWithImpl(
    _$CategoryItemImpl _value,
    $Res Function(_$CategoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$CategoryItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CategoryItemImpl implements _CategoryItem {
  const _$CategoryItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    required this.name,
    this.imageUrl,
  });

  factory _$CategoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  final String name;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CategoryItem(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      __$$CategoryItemImplCopyWithImpl<_$CategoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryItemImplToJson(this);
  }
}

abstract class _CategoryItem implements CategoryItem {
  const factory _CategoryItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    required final String name,
    final String? imageUrl,
  }) = _$CategoryItemImpl;

  factory _CategoryItem.fromJson(Map<String, dynamic> json) =
      _$CategoryItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  String get name;
  @override
  String? get imageUrl;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryListResponse _$CategoryListResponseFromJson(Map<String, dynamic> json) {
  return _CategoryListResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryListResponse {
  List<CategoryItem> get categories => throw _privateConstructorUsedError;

  /// Serializes this CategoryListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryListResponseCopyWith<CategoryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListResponseCopyWith<$Res> {
  factory $CategoryListResponseCopyWith(
    CategoryListResponse value,
    $Res Function(CategoryListResponse) then,
  ) = _$CategoryListResponseCopyWithImpl<$Res, CategoryListResponse>;
  @useResult
  $Res call({List<CategoryItem> categories});
}

/// @nodoc
class _$CategoryListResponseCopyWithImpl<
  $Res,
  $Val extends CategoryListResponse
>
    implements $CategoryListResponseCopyWith<$Res> {
  _$CategoryListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryListResponseImplCopyWith<$Res>
    implements $CategoryListResponseCopyWith<$Res> {
  factory _$$CategoryListResponseImplCopyWith(
    _$CategoryListResponseImpl value,
    $Res Function(_$CategoryListResponseImpl) then,
  ) = __$$CategoryListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryItem> categories});
}

/// @nodoc
class __$$CategoryListResponseImplCopyWithImpl<$Res>
    extends _$CategoryListResponseCopyWithImpl<$Res, _$CategoryListResponseImpl>
    implements _$$CategoryListResponseImplCopyWith<$Res> {
  __$$CategoryListResponseImplCopyWithImpl(
    _$CategoryListResponseImpl _value,
    $Res Function(_$CategoryListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _$CategoryListResponseImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CategoryListResponseImpl implements _CategoryListResponse {
  const _$CategoryListResponseImpl({
    required final List<CategoryItem> categories,
  }) : _categories = categories;

  factory _$CategoryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryListResponseImplFromJson(json);

  final List<CategoryItem> _categories;
  @override
  List<CategoryItem> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryListResponse(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListResponseImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListResponseImplCopyWith<_$CategoryListResponseImpl>
  get copyWith =>
      __$$CategoryListResponseImplCopyWithImpl<_$CategoryListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryListResponseImplToJson(this);
  }
}

abstract class _CategoryListResponse implements CategoryListResponse {
  const factory _CategoryListResponse({
    required final List<CategoryItem> categories,
  }) = _$CategoryListResponseImpl;

  factory _CategoryListResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryListResponseImpl.fromJson;

  @override
  List<CategoryItem> get categories;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryListResponseImplCopyWith<_$CategoryListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
