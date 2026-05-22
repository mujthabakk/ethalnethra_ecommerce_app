// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductDetailDto _$ProductDetailDtoFromJson(Map<String, dynamic> json) {
  return _ProductDetailDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailDto {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ml')
  String get nameMl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
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
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get preorderPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get hasDiscount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get weight => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intFromJson)
  int get stock => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_ml')
  String? get descriptionMl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringListFromJson)
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
  List<dynamic> get nutritions => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_count', fromJson: intFromJson)
  int get reviewCount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get reviews => throw _privateConstructorUsedError;

  /// Serializes this ProductDetailDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailDtoCopyWith<ProductDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailDtoCopyWith<$Res> {
  factory $ProductDetailDtoCopyWith(
    ProductDetailDto value,
    $Res Function(ProductDetailDto) then,
  ) = _$ProductDetailDtoCopyWithImpl<$Res, ProductDetailDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey(fromJson: stringFromJson) String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double ourPrice,
    @JsonKey(fromJson: doubleFromJson) double finalPrice,
    @JsonKey(fromJson: doubleFromJson) double displayPrice,
    @JsonKey(fromJson: boolFromJson) bool preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) double discountPercentage,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: stringFromJson) String weight,
    @JsonKey(fromJson: stringFromJson) String category,
    @JsonKey(fromJson: intFromJson) int stock,
    @JsonKey(fromJson: stringFromJson) String type,
    String? description,
    @JsonKey(name: 'description_ml') String? descriptionMl,
    @JsonKey(fromJson: stringListFromJson) List<String> images,
    @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
    List<dynamic> nutritions,
    @JsonKey(fromJson: doubleNullableFromJson) double? rating,
    @JsonKey(name: 'review_count', fromJson: intFromJson) int reviewCount,
    @JsonKey(fromJson: dynamicListFromJson) List<dynamic> reviews,
  });
}

/// @nodoc
class _$ProductDetailDtoCopyWithImpl<$Res, $Val extends ProductDetailDto>
    implements $ProductDetailDtoCopyWith<$Res> {
  _$ProductDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailDto
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
    Object? preorderPrice = freezed,
    Object? hasDiscount = null,
    Object? discountPercentage = null,
    Object? imageUrl = null,
    Object? weight = null,
    Object? category = null,
    Object? stock = null,
    Object? type = null,
    Object? description = freezed,
    Object? descriptionMl = freezed,
    Object? images = null,
    Object? nutritions = null,
    Object? rating = freezed,
    Object? reviewCount = null,
    Object? reviews = null,
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
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            descriptionMl: freezed == descriptionMl
                ? _value.descriptionMl
                : descriptionMl // ignore: cast_nullable_to_non_nullable
                      as String?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            nutritions: null == nutritions
                ? _value.nutritions
                : nutritions // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            reviewCount: null == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int,
            reviews: null == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductDetailDtoImplCopyWith<$Res>
    implements $ProductDetailDtoCopyWith<$Res> {
  factory _$$ProductDetailDtoImplCopyWith(
    _$ProductDetailDtoImpl value,
    $Res Function(_$ProductDetailDtoImpl) then,
  ) = __$$ProductDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey(fromJson: stringFromJson) String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double ourPrice,
    @JsonKey(fromJson: doubleFromJson) double finalPrice,
    @JsonKey(fromJson: doubleFromJson) double displayPrice,
    @JsonKey(fromJson: boolFromJson) bool preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) double discountPercentage,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: stringFromJson) String weight,
    @JsonKey(fromJson: stringFromJson) String category,
    @JsonKey(fromJson: intFromJson) int stock,
    @JsonKey(fromJson: stringFromJson) String type,
    String? description,
    @JsonKey(name: 'description_ml') String? descriptionMl,
    @JsonKey(fromJson: stringListFromJson) List<String> images,
    @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
    List<dynamic> nutritions,
    @JsonKey(fromJson: doubleNullableFromJson) double? rating,
    @JsonKey(name: 'review_count', fromJson: intFromJson) int reviewCount,
    @JsonKey(fromJson: dynamicListFromJson) List<dynamic> reviews,
  });
}

/// @nodoc
class __$$ProductDetailDtoImplCopyWithImpl<$Res>
    extends _$ProductDetailDtoCopyWithImpl<$Res, _$ProductDetailDtoImpl>
    implements _$$ProductDetailDtoImplCopyWith<$Res> {
  __$$ProductDetailDtoImplCopyWithImpl(
    _$ProductDetailDtoImpl _value,
    $Res Function(_$ProductDetailDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductDetailDto
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
    Object? preorderPrice = freezed,
    Object? hasDiscount = null,
    Object? discountPercentage = null,
    Object? imageUrl = null,
    Object? weight = null,
    Object? category = null,
    Object? stock = null,
    Object? type = null,
    Object? description = freezed,
    Object? descriptionMl = freezed,
    Object? images = null,
    Object? nutritions = null,
    Object? rating = freezed,
    Object? reviewCount = null,
    Object? reviews = null,
  }) {
    return _then(
      _$ProductDetailDtoImpl(
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
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        descriptionMl: freezed == descriptionMl
            ? _value.descriptionMl
            : descriptionMl // ignore: cast_nullable_to_non_nullable
                  as String?,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        nutritions: null == nutritions
            ? _value._nutritions
            : nutritions // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        reviewCount: null == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        reviews: null == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductDetailDtoImpl implements _ProductDetailDto {
  const _$ProductDetailDtoImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(name: 'name_ml') this.nameMl = '',
    @JsonKey(fromJson: stringFromJson) required this.name,
    @JsonKey(fromJson: doubleFromJson) required this.price,
    @JsonKey(fromJson: doubleFromJson) required this.ourPrice,
    @JsonKey(fromJson: doubleFromJson) required this.finalPrice,
    @JsonKey(fromJson: doubleFromJson) required this.displayPrice,
    @JsonKey(fromJson: boolFromJson) required this.preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) this.preorderPrice,
    @JsonKey(fromJson: boolFromJson) required this.hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required this.discountPercentage,
    @JsonKey(fromJson: stringFromJson) this.imageUrl = '',
    @JsonKey(fromJson: stringFromJson) this.weight = '',
    @JsonKey(fromJson: stringFromJson) this.category = '',
    @JsonKey(fromJson: intFromJson) this.stock = 0,
    @JsonKey(fromJson: stringFromJson) this.type = '',
    this.description,
    @JsonKey(name: 'description_ml') this.descriptionMl,
    @JsonKey(fromJson: stringListFromJson) final List<String> images = const [],
    @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
    final List<dynamic> nutritions = const [],
    @JsonKey(fromJson: doubleNullableFromJson) this.rating,
    @JsonKey(name: 'review_count', fromJson: intFromJson) this.reviewCount = 0,
    @JsonKey(fromJson: dynamicListFromJson)
    final List<dynamic> reviews = const [],
  }) : _images = images,
       _nutritions = nutritions,
       _reviews = reviews;

  factory _$ProductDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(name: 'name_ml')
  final String nameMl;
  @override
  @JsonKey(fromJson: stringFromJson)
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
  @JsonKey(fromJson: doubleNullableFromJson)
  final double? preorderPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool hasDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discountPercentage;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String imageUrl;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String weight;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String category;
  @override
  @JsonKey(fromJson: intFromJson)
  final int stock;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String type;
  @override
  final String? description;
  @override
  @JsonKey(name: 'description_ml')
  final String? descriptionMl;
  final List<String> _images;
  @override
  @JsonKey(fromJson: stringListFromJson)
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<dynamic> _nutritions;
  @override
  @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
  List<dynamic> get nutritions {
    if (_nutritions is EqualUnmodifiableListView) return _nutritions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutritions);
  }

  @override
  @JsonKey(fromJson: doubleNullableFromJson)
  final double? rating;
  @override
  @JsonKey(name: 'review_count', fromJson: intFromJson)
  final int reviewCount;
  final List<dynamic> _reviews;
  @override
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'ProductDetailDto(id: $id, nameMl: $nameMl, name: $name, price: $price, ourPrice: $ourPrice, finalPrice: $finalPrice, displayPrice: $displayPrice, preorderAvailable: $preorderAvailable, preorderPrice: $preorderPrice, hasDiscount: $hasDiscount, discountPercentage: $discountPercentage, imageUrl: $imageUrl, weight: $weight, category: $category, stock: $stock, type: $type, description: $description, descriptionMl: $descriptionMl, images: $images, nutritions: $nutritions, rating: $rating, reviewCount: $reviewCount, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailDtoImpl &&
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
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionMl, descriptionMl) ||
                other.descriptionMl == descriptionMl) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(
              other._nutritions,
              _nutritions,
            ) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    nameMl,
    name,
    price,
    ourPrice,
    finalPrice,
    displayPrice,
    preorderAvailable,
    preorderPrice,
    hasDiscount,
    discountPercentage,
    imageUrl,
    weight,
    category,
    stock,
    type,
    description,
    descriptionMl,
    const DeepCollectionEquality().hash(_images),
    const DeepCollectionEquality().hash(_nutritions),
    rating,
    reviewCount,
    const DeepCollectionEquality().hash(_reviews),
  ]);

  /// Create a copy of ProductDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailDtoImplCopyWith<_$ProductDetailDtoImpl> get copyWith =>
      __$$ProductDetailDtoImplCopyWithImpl<_$ProductDetailDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailDtoImplToJson(this);
  }
}

abstract class _ProductDetailDto implements ProductDetailDto {
  const factory _ProductDetailDto({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(name: 'name_ml') final String nameMl,
    @JsonKey(fromJson: stringFromJson) required final String name,
    @JsonKey(fromJson: doubleFromJson) required final double price,
    @JsonKey(fromJson: doubleFromJson) required final double ourPrice,
    @JsonKey(fromJson: doubleFromJson) required final double finalPrice,
    @JsonKey(fromJson: doubleFromJson) required final double displayPrice,
    @JsonKey(fromJson: boolFromJson) required final bool preorderAvailable,
    @JsonKey(fromJson: doubleNullableFromJson) final double? preorderPrice,
    @JsonKey(fromJson: boolFromJson) required final bool hasDiscount,
    @JsonKey(fromJson: doubleFromJson) required final double discountPercentage,
    @JsonKey(fromJson: stringFromJson) final String imageUrl,
    @JsonKey(fromJson: stringFromJson) final String weight,
    @JsonKey(fromJson: stringFromJson) final String category,
    @JsonKey(fromJson: intFromJson) final int stock,
    @JsonKey(fromJson: stringFromJson) final String type,
    final String? description,
    @JsonKey(name: 'description_ml') final String? descriptionMl,
    @JsonKey(fromJson: stringListFromJson) final List<String> images,
    @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
    final List<dynamic> nutritions,
    @JsonKey(fromJson: doubleNullableFromJson) final double? rating,
    @JsonKey(name: 'review_count', fromJson: intFromJson) final int reviewCount,
    @JsonKey(fromJson: dynamicListFromJson) final List<dynamic> reviews,
  }) = _$ProductDetailDtoImpl;

  factory _ProductDetailDto.fromJson(Map<String, dynamic> json) =
      _$ProductDetailDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(name: 'name_ml')
  String get nameMl;
  @override
  @JsonKey(fromJson: stringFromJson)
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
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get preorderPrice;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get hasDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discountPercentage;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get weight;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get category;
  @override
  @JsonKey(fromJson: intFromJson)
  int get stock;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get type;
  @override
  String? get description;
  @override
  @JsonKey(name: 'description_ml')
  String? get descriptionMl;
  @override
  @JsonKey(fromJson: stringListFromJson)
  List<String> get images;
  @override
  @JsonKey(name: 'nutritions', fromJson: dynamicListFromJson)
  List<dynamic> get nutritions;
  @override
  @JsonKey(fromJson: doubleNullableFromJson)
  double? get rating;
  @override
  @JsonKey(name: 'review_count', fromJson: intFromJson)
  int get reviewCount;
  @override
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get reviews;

  /// Create a copy of ProductDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailDtoImplCopyWith<_$ProductDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
