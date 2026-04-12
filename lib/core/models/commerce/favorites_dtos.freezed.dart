// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FavoriteProductDto _$FavoriteProductDtoFromJson(Map<String, dynamic> json) {
  return _FavoriteProductDto.fromJson(json);
}

/// @nodoc
mixin _$FavoriteProductDto {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this FavoriteProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteProductDtoCopyWith<FavoriteProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteProductDtoCopyWith<$Res> {
  factory $FavoriteProductDtoCopyWith(
    FavoriteProductDto value,
    $Res Function(FavoriteProductDto) then,
  ) = _$FavoriteProductDtoCopyWithImpl<$Res, FavoriteProductDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    String imageUrl,
  });
}

/// @nodoc
class _$FavoriteProductDtoCopyWithImpl<$Res, $Val extends FavoriteProductDto>
    implements $FavoriteProductDtoCopyWith<$Res> {
  _$FavoriteProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageUrl = null,
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
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FavoriteProductDtoImplCopyWith<$Res>
    implements $FavoriteProductDtoCopyWith<$Res> {
  factory _$$FavoriteProductDtoImplCopyWith(
    _$FavoriteProductDtoImpl value,
    $Res Function(_$FavoriteProductDtoImpl) then,
  ) = __$$FavoriteProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    String imageUrl,
  });
}

/// @nodoc
class __$$FavoriteProductDtoImplCopyWithImpl<$Res>
    extends _$FavoriteProductDtoCopyWithImpl<$Res, _$FavoriteProductDtoImpl>
    implements _$$FavoriteProductDtoImplCopyWith<$Res> {
  __$$FavoriteProductDtoImplCopyWithImpl(
    _$FavoriteProductDtoImpl _value,
    $Res Function(_$FavoriteProductDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageUrl = null,
  }) {
    return _then(
      _$FavoriteProductDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FavoriteProductDtoImpl implements _FavoriteProductDto {
  const _$FavoriteProductDtoImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    required this.name,
    @JsonKey(fromJson: doubleFromJson) required this.price,
    required this.imageUrl,
  });

  factory _$FavoriteProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteProductDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  final String name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double price;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'FavoriteProductDto(id: $id, name: $name, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, imageUrl);

  /// Create a copy of FavoriteProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteProductDtoImplCopyWith<_$FavoriteProductDtoImpl> get copyWith =>
      __$$FavoriteProductDtoImplCopyWithImpl<_$FavoriteProductDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteProductDtoImplToJson(this);
  }
}

abstract class _FavoriteProductDto implements FavoriteProductDto {
  const factory _FavoriteProductDto({
    @JsonKey(fromJson: stringFromJson) required final String id,
    required final String name,
    @JsonKey(fromJson: doubleFromJson) required final double price,
    required final String imageUrl,
  }) = _$FavoriteProductDtoImpl;

  factory _FavoriteProductDto.fromJson(Map<String, dynamic> json) =
      _$FavoriteProductDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  String get name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get price;
  @override
  String get imageUrl;

  /// Create a copy of FavoriteProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteProductDtoImplCopyWith<_$FavoriteProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoritesListResponse _$FavoritesListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _FavoritesListResponse.fromJson(json);
}

/// @nodoc
mixin _$FavoritesListResponse {
  List<FavoriteProductDto> get products => throw _privateConstructorUsedError;

  /// Serializes this FavoritesListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoritesListResponseCopyWith<FavoritesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesListResponseCopyWith<$Res> {
  factory $FavoritesListResponseCopyWith(
    FavoritesListResponse value,
    $Res Function(FavoritesListResponse) then,
  ) = _$FavoritesListResponseCopyWithImpl<$Res, FavoritesListResponse>;
  @useResult
  $Res call({List<FavoriteProductDto> products});
}

/// @nodoc
class _$FavoritesListResponseCopyWithImpl<
  $Res,
  $Val extends FavoritesListResponse
>
    implements $FavoritesListResponseCopyWith<$Res> {
  _$FavoritesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _value.copyWith(
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<FavoriteProductDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FavoritesListResponseImplCopyWith<$Res>
    implements $FavoritesListResponseCopyWith<$Res> {
  factory _$$FavoritesListResponseImplCopyWith(
    _$FavoritesListResponseImpl value,
    $Res Function(_$FavoritesListResponseImpl) then,
  ) = __$$FavoritesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FavoriteProductDto> products});
}

/// @nodoc
class __$$FavoritesListResponseImplCopyWithImpl<$Res>
    extends
        _$FavoritesListResponseCopyWithImpl<$Res, _$FavoritesListResponseImpl>
    implements _$$FavoritesListResponseImplCopyWith<$Res> {
  __$$FavoritesListResponseImplCopyWithImpl(
    _$FavoritesListResponseImpl _value,
    $Res Function(_$FavoritesListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? products = null}) {
    return _then(
      _$FavoritesListResponseImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<FavoriteProductDto>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FavoritesListResponseImpl implements _FavoritesListResponse {
  const _$FavoritesListResponseImpl({
    required final List<FavoriteProductDto> products,
  }) : _products = products;

  factory _$FavoritesListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoritesListResponseImplFromJson(json);

  final List<FavoriteProductDto> _products;
  @override
  List<FavoriteProductDto> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'FavoritesListResponse(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesListResponseImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesListResponseImplCopyWith<_$FavoritesListResponseImpl>
  get copyWith =>
      __$$FavoritesListResponseImplCopyWithImpl<_$FavoritesListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoritesListResponseImplToJson(this);
  }
}

abstract class _FavoritesListResponse implements FavoritesListResponse {
  const factory _FavoritesListResponse({
    required final List<FavoriteProductDto> products,
  }) = _$FavoritesListResponseImpl;

  factory _FavoritesListResponse.fromJson(Map<String, dynamic> json) =
      _$FavoritesListResponseImpl.fromJson;

  @override
  List<FavoriteProductDto> get products;

  /// Create a copy of FavoritesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoritesListResponseImplCopyWith<_$FavoritesListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
