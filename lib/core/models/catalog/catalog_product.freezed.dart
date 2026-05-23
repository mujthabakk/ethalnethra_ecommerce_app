// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CatalogProduct _$CatalogProductFromJson(Map<String, dynamic> json) {
  return _CatalogProduct.fromJson(json);
}

/// @nodoc
mixin _$CatalogProduct {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ml')
  String get nameMl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get ourPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get displayPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get preorderAvailable => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get instantOrderAvailable => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get preorderPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get hasDiscount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discountPercentage => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intFromJson)
  int get stock => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get type => throw _privateConstructorUsedError;

  /// Serializes this CatalogProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogProductCopyWith<CatalogProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogProductCopyWith<$Res> {
  factory $CatalogProductCopyWith(
    CatalogProduct value,
    $Res Function(CatalogProduct) then,
  ) = _$CatalogProductCopyWithImpl<$Res, CatalogProduct>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'name_ml') String nameMl,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double ourPrice,
    @JsonKey(fromJson: doubleFromJson) double finalPrice,
    @JsonKey(fromJson: doubleFromJson) double displayPrice,
    @JsonKey(fromJson: boolFromJson) bool preorderAvailable,
    @JsonKey(fromJson: boolFromJson) bool instantOrderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) double discountPercentage,
    String imageUrl,
    String weight,
    String category,
    @JsonKey(fromJson: intFromJson) int stock,
    @JsonKey(fromJson: stringFromJson) String type,
  });
}

/// @nodoc
class _$CatalogProductCopyWithImpl<$Res, $Val extends CatalogProduct>
    implements $CatalogProductCopyWith<$Res> {
  _$CatalogProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameMl = null,
    Object? name = null,
    Object? price = null,
    Object? ourPrice = null,
    Object? finalPrice = null,
    Object? displayPrice = null,
    Object? preorderAvailable = null,
    Object? instantOrderAvailable = null,
    Object? preorderPrice = freezed,
    Object? hasDiscount = null,
    Object? discountPercentage = null,
    Object? imageUrl = null,
    Object? weight = null,
    Object? category = null,
    Object? stock = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            nameMl: null == nameMl
                ? _value.nameMl
                : nameMl // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            ourPrice: null == ourPrice
                ? _value.ourPrice
                : ourPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            finalPrice: null == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            displayPrice: null == displayPrice
                ? _value.displayPrice
                : displayPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            preorderAvailable: null == preorderAvailable
                ? _value.preorderAvailable
                : preorderAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            instantOrderAvailable: null == instantOrderAvailable
                ? _value.instantOrderAvailable
                : instantOrderAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            preorderPrice: freezed == preorderPrice
                ? _value.preorderPrice
                : preorderPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            hasDiscount: null == hasDiscount
                ? _value.hasDiscount
                : hasDiscount // ignore: cast_nullable_to_non_nullable
                      as bool,
            discountPercentage: null == discountPercentage
                ? _value.discountPercentage
                : discountPercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CatalogProductImplCopyWith<$Res>
    implements $CatalogProductCopyWith<$Res> {
  factory _$$CatalogProductImplCopyWith(
    _$CatalogProductImpl value,
    $Res Function(_$CatalogProductImpl) then,
  ) = __$$CatalogProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'name_ml') String nameMl,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double ourPrice,
    @JsonKey(fromJson: doubleFromJson) double finalPrice,
    @JsonKey(fromJson: doubleFromJson) double displayPrice,
    @JsonKey(fromJson: boolFromJson) bool preorderAvailable,
    @JsonKey(fromJson: boolFromJson) bool instantOrderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) double discountPercentage,
    String imageUrl,
    String weight,
    String category,
    @JsonKey(fromJson: intFromJson) int stock,
    @JsonKey(fromJson: stringFromJson) String type,
  });
}

/// @nodoc
class __$$CatalogProductImplCopyWithImpl<$Res>
    extends _$CatalogProductCopyWithImpl<$Res, _$CatalogProductImpl>
    implements _$$CatalogProductImplCopyWith<$Res> {
  __$$CatalogProductImplCopyWithImpl(
    _$CatalogProductImpl _value,
    $Res Function(_$CatalogProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameMl = null,
    Object? name = null,
    Object? price = null,
    Object? ourPrice = null,
    Object? finalPrice = null,
    Object? displayPrice = null,
    Object? preorderAvailable = null,
    Object? instantOrderAvailable = null,
    Object? preorderPrice = freezed,
    Object? hasDiscount = null,
    Object? discountPercentage = null,
    Object? imageUrl = null,
    Object? weight = null,
    Object? category = null,
    Object? stock = null,
    Object? type = null,
  }) {
    return _then(
      _$CatalogProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nameMl: null == nameMl
            ? _value.nameMl
            : nameMl // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        ourPrice: null == ourPrice
            ? _value.ourPrice
            : ourPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        finalPrice: null == finalPrice
            ? _value.finalPrice
            : finalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        displayPrice: null == displayPrice
            ? _value.displayPrice
            : displayPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        preorderAvailable: null == preorderAvailable
            ? _value.preorderAvailable
            : preorderAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        instantOrderAvailable: null == instantOrderAvailable
            ? _value.instantOrderAvailable
            : instantOrderAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        preorderPrice: freezed == preorderPrice
            ? _value.preorderPrice
            : preorderPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        hasDiscount: null == hasDiscount
            ? _value.hasDiscount
            : hasDiscount // ignore: cast_nullable_to_non_nullable
                  as bool,
        discountPercentage: null == discountPercentage
            ? _value.discountPercentage
            : discountPercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CatalogProductImpl implements _CatalogProduct {
  const _$CatalogProductImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(name: 'name_ml') this.nameMl = '',
    required this.name,
    @JsonKey(fromJson: doubleFromJson) required this.price,
    @JsonKey(fromJson: doubleFromJson) required this.ourPrice,
    @JsonKey(fromJson: doubleFromJson) required this.finalPrice,
    @JsonKey(fromJson: doubleFromJson) required this.displayPrice,
    @JsonKey(fromJson: boolFromJson) required this.preorderAvailable,
    @JsonKey(fromJson: boolFromJson) this.instantOrderAvailable = false,
    @JsonKey(fromJson: doubleNullableFromJson) this.preorderPrice,
    @JsonKey(fromJson: boolFromJson) required this.hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required this.discountPercentage,
    required this.imageUrl,
    required this.weight,
    required this.category,
    @JsonKey(fromJson: intFromJson) required this.stock,
    @JsonKey(fromJson: stringFromJson) this.type = '',
  });

  factory _$CatalogProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogProductImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(name: 'name_ml')
  final String nameMl;
  @override
  final String name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double ourPrice;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double finalPrice;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double displayPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool preorderAvailable;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool instantOrderAvailable;
  @override
  @JsonKey(fromJson: doubleNullableFromJson)
  final double? preorderPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool hasDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discountPercentage;
  @override
  final String imageUrl;
  @override
  final String weight;
  @override
  final String category;
  @override
  @JsonKey(fromJson: intFromJson)
  final int stock;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String type;

  @override
  String toString() {
    return 'CatalogProduct(id: $id, nameMl: $nameMl, name: $name, price: $price, ourPrice: $ourPrice, finalPrice: $finalPrice, displayPrice: $displayPrice, preorderAvailable: $preorderAvailable, instantOrderAvailable: $instantOrderAvailable, preorderPrice: $preorderPrice, hasDiscount: $hasDiscount, discountPercentage: $discountPercentage, imageUrl: $imageUrl, weight: $weight, category: $category, stock: $stock, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameMl, nameMl) || other.nameMl == nameMl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ourPrice, ourPrice) ||
                other.ourPrice == ourPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.displayPrice, displayPrice) ||
                other.displayPrice == displayPrice) &&
            (identical(other.preorderAvailable, preorderAvailable) ||
                other.preorderAvailable == preorderAvailable) &&
            (identical(other.instantOrderAvailable, instantOrderAvailable) ||
                other.instantOrderAvailable == instantOrderAvailable) &&
            (identical(other.preorderPrice, preorderPrice) ||
                other.preorderPrice == preorderPrice) &&
            (identical(other.hasDiscount, hasDiscount) ||
                other.hasDiscount == hasDiscount) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    nameMl,
    name,
    price,
    ourPrice,
    finalPrice,
    displayPrice,
    preorderAvailable,
    instantOrderAvailable,
    preorderPrice,
    hasDiscount,
    discountPercentage,
    imageUrl,
    weight,
    category,
    stock,
    type,
  );

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogProductImplCopyWith<_$CatalogProductImpl> get copyWith =>
      __$$CatalogProductImplCopyWithImpl<_$CatalogProductImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogProductImplToJson(this);
  }
}

abstract class _CatalogProduct implements CatalogProduct {
  const factory _CatalogProduct({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(name: 'name_ml') final String nameMl,
    required final String name,
    @JsonKey(fromJson: doubleFromJson) required final double price,
    @JsonKey(fromJson: doubleFromJson) required final double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required final double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required final double displayPrice,
    @JsonKey(fromJson: boolFromJson) required final bool preorderAvailable,
    @JsonKey(fromJson: boolFromJson) final bool instantOrderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) final double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) required final bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required final double discountPercentage,
    required final String imageUrl,
    required final String weight,
    required final String category,
    @JsonKey(fromJson: intFromJson) required final int stock,
    @JsonKey(fromJson: stringFromJson) final String type,
  }) = _$CatalogProductImpl;

  factory _CatalogProduct.fromJson(Map<String, dynamic> json) =
      _$CatalogProductImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(name: 'name_ml')
  String get nameMl;
  @override
  String get name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get ourPrice;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get finalPrice;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get displayPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get preorderAvailable;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get instantOrderAvailable;
  @override
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get preorderPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get hasDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discountPercentage;
  @override
  String get imageUrl;
  @override
  String get weight;
  @override
  String get category;
  @override
  @JsonKey(fromJson: intFromJson)
  int get stock;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get type;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogProductImplCopyWith<_$CatalogProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductsListResponse _$ProductsListResponseFromJson(Map<String, dynamic> json) {
  return _ProductsListResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductsListResponse {
  List<CatalogProduct> get products => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intFromJson)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intFromJson)
  int get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  int get currentPage => throw _privateConstructorUsedError;

  /// Serializes this ProductsListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsListResponseCopyWith<ProductsListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsListResponseCopyWith<$Res> {
  factory $ProductsListResponseCopyWith(
    ProductsListResponse value,
    $Res Function(ProductsListResponse) then,
  ) = _$ProductsListResponseCopyWithImpl<$Res, ProductsListResponse>;
  @useResult
  $Res call({
    List<CatalogProduct> products,
    @JsonKey(fromJson: intFromJson) int total,
    @JsonKey(fromJson: intFromJson) int pages,
    @JsonKey(name: 'current_page', fromJson: intFromJson) int currentPage,
  });
}

/// @nodoc
class _$ProductsListResponseCopyWithImpl<
  $Res,
  $Val extends ProductsListResponse
>
    implements $ProductsListResponseCopyWith<$Res> {
  _$ProductsListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? pages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _value.copyWith(
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<CatalogProduct>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsListResponseImplCopyWith<$Res>
    implements $ProductsListResponseCopyWith<$Res> {
  factory _$$ProductsListResponseImplCopyWith(
    _$ProductsListResponseImpl value,
    $Res Function(_$ProductsListResponseImpl) then,
  ) = __$$ProductsListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CatalogProduct> products,
    @JsonKey(fromJson: intFromJson) int total,
    @JsonKey(fromJson: intFromJson) int pages,
    @JsonKey(name: 'current_page', fromJson: intFromJson) int currentPage,
  });
}

/// @nodoc
class __$$ProductsListResponseImplCopyWithImpl<$Res>
    extends _$ProductsListResponseCopyWithImpl<$Res, _$ProductsListResponseImpl>
    implements _$$ProductsListResponseImplCopyWith<$Res> {
  __$$ProductsListResponseImplCopyWithImpl(
    _$ProductsListResponseImpl _value,
    $Res Function(_$ProductsListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? pages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _$ProductsListResponseImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<CatalogProduct>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductsListResponseImpl implements _ProductsListResponse {
  const _$ProductsListResponseImpl({
    required final List<CatalogProduct> products,
    @JsonKey(fromJson: intFromJson) required this.total,
    @JsonKey(fromJson: intFromJson) required this.pages,
    @JsonKey(name: 'current_page', fromJson: intFromJson)
    required this.currentPage,
  }) : _products = products;

  factory _$ProductsListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsListResponseImplFromJson(json);

  final List<CatalogProduct> _products;
  @override
  List<CatalogProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey(fromJson: intFromJson)
  final int total;
  @override
  @JsonKey(fromJson: intFromJson)
  final int pages;
  @override
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  final int currentPage;

  @override
  String toString() {
    return 'ProductsListResponse(products: $products, total: $total, pages: $pages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsListResponseImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    total,
    pages,
    currentPage,
  );

  /// Create a copy of ProductsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsListResponseImplCopyWith<_$ProductsListResponseImpl>
  get copyWith =>
      __$$ProductsListResponseImplCopyWithImpl<_$ProductsListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsListResponseImplToJson(this);
  }
}

abstract class _ProductsListResponse implements ProductsListResponse {
  const factory _ProductsListResponse({
    required final List<CatalogProduct> products,
    @JsonKey(fromJson: intFromJson) required final int total,
    @JsonKey(fromJson: intFromJson) required final int pages,
    @JsonKey(name: 'current_page', fromJson: intFromJson)
    required final int currentPage,
  }) = _$ProductsListResponseImpl;

  factory _ProductsListResponse.fromJson(Map<String, dynamic> json) =
      _$ProductsListResponseImpl.fromJson;

  @override
  List<CatalogProduct> get products;
  @override
  @JsonKey(fromJson: intFromJson)
  int get total;
  @override
  @JsonKey(fromJson: intFromJson)
  int get pages;
  @override
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  int get currentPage;

  /// Create a copy of ProductsListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsListResponseImplCopyWith<_$ProductsListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
