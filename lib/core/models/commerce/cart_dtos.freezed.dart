// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartLineDto _$CartLineDtoFromJson(Map<String, dynamic> json) {
  return _CartLineDto.fromJson(json);
}

/// @nodoc
mixin _$CartLineDto {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ml')
  String get nameMl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get isPreorder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_accept', fromJson: boolFromJson)
  bool get isAccept => throw _privateConstructorUsedError;

  /// Serializes this CartLineDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartLineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartLineDtoCopyWith<CartLineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartLineDtoCopyWith<$Res> {
  factory $CartLineDtoCopyWith(
    CartLineDto value,
    $Res Function(CartLineDto) then,
  ) = _$CartLineDtoCopyWithImpl<$Res, CartLineDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(fromJson: stringFromJson) String productId,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey(fromJson: stringFromJson) String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: boolFromJson) bool isPreorder,
    @JsonKey(name: 'is_accept', fromJson: boolFromJson) bool isAccept,
  });
}

/// @nodoc
class _$CartLineDtoCopyWithImpl<$Res, $Val extends CartLineDto>
    implements $CartLineDtoCopyWith<$Res> {
  _$CartLineDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartLineDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? nameMl = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? imageUrl = null,
    Object? subtotal = null,
    Object? isPreorder = null,
    Object? isAccept = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
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
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            isPreorder: null == isPreorder
                ? _value.isPreorder
                : isPreorder // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAccept: null == isAccept
                ? _value.isAccept
                : isAccept // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartLineDtoImplCopyWith<$Res>
    implements $CartLineDtoCopyWith<$Res> {
  factory _$$CartLineDtoImplCopyWith(
    _$CartLineDtoImpl value,
    $Res Function(_$CartLineDtoImpl) then,
  ) = __$$CartLineDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(fromJson: stringFromJson) String productId,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey(fromJson: stringFromJson) String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: boolFromJson) bool isPreorder,
    @JsonKey(name: 'is_accept', fromJson: boolFromJson) bool isAccept,
  });
}

/// @nodoc
class __$$CartLineDtoImplCopyWithImpl<$Res>
    extends _$CartLineDtoCopyWithImpl<$Res, _$CartLineDtoImpl>
    implements _$$CartLineDtoImplCopyWith<$Res> {
  __$$CartLineDtoImplCopyWithImpl(
    _$CartLineDtoImpl _value,
    $Res Function(_$CartLineDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartLineDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? nameMl = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? imageUrl = null,
    Object? subtotal = null,
    Object? isPreorder = null,
    Object? isAccept = null,
  }) {
    return _then(
      _$CartLineDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
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
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        isPreorder: null == isPreorder
            ? _value.isPreorder
            : isPreorder // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAccept: null == isAccept
            ? _value.isAccept
            : isAccept // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CartLineDtoImpl implements _CartLineDto {
  const _$CartLineDtoImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(fromJson: stringFromJson) required this.productId,
    @JsonKey(name: 'name_ml') this.nameMl = '',
    @JsonKey(fromJson: stringFromJson) required this.name,
    @JsonKey(fromJson: doubleFromJson) required this.price,
    @JsonKey(fromJson: doubleFromJson) required this.quantity,
    @JsonKey(fromJson: stringFromJson) this.imageUrl = '',
    @JsonKey(fromJson: doubleFromJson) required this.subtotal,
    @JsonKey(fromJson: boolFromJson) this.isPreorder = false,
    @JsonKey(name: 'is_accept', fromJson: boolFromJson) this.isAccept = true,
  });

  factory _$CartLineDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartLineDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String productId;
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
  final double quantity;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String imageUrl;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool isPreorder;
  @override
  @JsonKey(name: 'is_accept', fromJson: boolFromJson)
  final bool isAccept;

  @override
  String toString() {
    return 'CartLineDto(id: $id, productId: $productId, nameMl: $nameMl, name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, subtotal: $subtotal, isPreorder: $isPreorder, isAccept: $isAccept)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartLineDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.nameMl, nameMl) || other.nameMl == nameMl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.isPreorder, isPreorder) ||
                other.isPreorder == isPreorder) &&
            (identical(other.isAccept, isAccept) ||
                other.isAccept == isAccept));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    nameMl,
    name,
    price,
    quantity,
    imageUrl,
    subtotal,
    isPreorder,
    isAccept,
  );

  /// Create a copy of CartLineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartLineDtoImplCopyWith<_$CartLineDtoImpl> get copyWith =>
      __$$CartLineDtoImplCopyWithImpl<_$CartLineDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartLineDtoImplToJson(this);
  }
}

abstract class _CartLineDto implements CartLineDto {
  const factory _CartLineDto({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(fromJson: stringFromJson) required final String productId,
    @JsonKey(name: 'name_ml') final String nameMl,
    @JsonKey(fromJson: stringFromJson) required final String name,
    @JsonKey(fromJson: doubleFromJson) required final double price,
    @JsonKey(fromJson: doubleFromJson) required final double quantity,
    @JsonKey(fromJson: stringFromJson) final String imageUrl,
    @JsonKey(fromJson: doubleFromJson) required final double subtotal,
    @JsonKey(fromJson: boolFromJson) final bool isPreorder,
    @JsonKey(name: 'is_accept', fromJson: boolFromJson) final bool isAccept,
  }) = _$CartLineDtoImpl;

  factory _CartLineDto.fromJson(Map<String, dynamic> json) =
      _$CartLineDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get productId;
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
  double get quantity;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get isPreorder;
  @override
  @JsonKey(name: 'is_accept', fromJson: boolFromJson)
  bool get isAccept;

  /// Create a copy of CartLineDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartLineDtoImplCopyWith<_$CartLineDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  List<CartLineDto> get instant => throw _privateConstructorUsedError;
  List<CartLineDto> get preorder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_count', fromJson: intFromJson)
  int get itemCount => throw _privateConstructorUsedError;

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
    CartResponse value,
    $Res Function(CartResponse) then,
  ) = _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call({
    List<CartLineDto> instant,
    List<CartLineDto> preorder,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(name: 'item_count', fromJson: intFromJson) int itemCount,
  });
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instant = null,
    Object? preorder = null,
    Object? total = null,
    Object? itemCount = null,
  }) {
    return _then(
      _value.copyWith(
            instant: null == instant
                ? _value.instant
                : instant // ignore: cast_nullable_to_non_nullable
                      as List<CartLineDto>,
            preorder: null == preorder
                ? _value.preorder
                : preorder // ignore: cast_nullable_to_non_nullable
                      as List<CartLineDto>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            itemCount: null == itemCount
                ? _value.itemCount
                : itemCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartResponseImplCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$CartResponseImplCopyWith(
    _$CartResponseImpl value,
    $Res Function(_$CartResponseImpl) then,
  ) = __$$CartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CartLineDto> instant,
    List<CartLineDto> preorder,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(name: 'item_count', fromJson: intFromJson) int itemCount,
  });
}

/// @nodoc
class __$$CartResponseImplCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$CartResponseImpl>
    implements _$$CartResponseImplCopyWith<$Res> {
  __$$CartResponseImplCopyWithImpl(
    _$CartResponseImpl _value,
    $Res Function(_$CartResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instant = null,
    Object? preorder = null,
    Object? total = null,
    Object? itemCount = null,
  }) {
    return _then(
      _$CartResponseImpl(
        instant: null == instant
            ? _value._instant
            : instant // ignore: cast_nullable_to_non_nullable
                  as List<CartLineDto>,
        preorder: null == preorder
            ? _value._preorder
            : preorder // ignore: cast_nullable_to_non_nullable
                  as List<CartLineDto>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        itemCount: null == itemCount
            ? _value.itemCount
            : itemCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CartResponseImpl implements _CartResponse {
  const _$CartResponseImpl({
    final List<CartLineDto> instant = const [],
    final List<CartLineDto> preorder = const [],
    @JsonKey(fromJson: doubleFromJson) required this.total,
    @JsonKey(name: 'item_count', fromJson: intFromJson) required this.itemCount,
  }) : _instant = instant,
       _preorder = preorder;

  factory _$CartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartResponseImplFromJson(json);

  final List<CartLineDto> _instant;
  @override
  @JsonKey()
  List<CartLineDto> get instant {
    if (_instant is EqualUnmodifiableListView) return _instant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instant);
  }

  final List<CartLineDto> _preorder;
  @override
  @JsonKey()
  List<CartLineDto> get preorder {
    if (_preorder is EqualUnmodifiableListView) return _preorder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preorder);
  }

  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  @JsonKey(name: 'item_count', fromJson: intFromJson)
  final int itemCount;

  @override
  String toString() {
    return 'CartResponse(instant: $instant, preorder: $preorder, total: $total, itemCount: $itemCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartResponseImpl &&
            const DeepCollectionEquality().equals(other._instant, _instant) &&
            const DeepCollectionEquality().equals(other._preorder, _preorder) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_instant),
    const DeepCollectionEquality().hash(_preorder),
    total,
    itemCount,
  );

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      __$$CartResponseImplCopyWithImpl<_$CartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartResponseImplToJson(this);
  }
}

abstract class _CartResponse implements CartResponse {
  const factory _CartResponse({
    final List<CartLineDto> instant,
    final List<CartLineDto> preorder,
    @JsonKey(fromJson: doubleFromJson) required final double total,
    @JsonKey(name: 'item_count', fromJson: intFromJson)
    required final int itemCount,
  }) = _$CartResponseImpl;

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$CartResponseImpl.fromJson;

  @override
  List<CartLineDto> get instant;
  @override
  List<CartLineDto> get preorder;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  @JsonKey(name: 'item_count', fromJson: intFromJson)
  int get itemCount;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartResponseImplCopyWith<_$CartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartAddResponse _$CartAddResponseFromJson(Map<String, dynamic> json) {
  return _CartAddResponse.fromJson(json);
}

/// @nodoc
mixin _$CartAddResponse {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart_total', fromJson: doubleFromJson)
  double get cartTotal => throw _privateConstructorUsedError;

  /// Serializes this CartAddResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartAddResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartAddResponseCopyWith<CartAddResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartAddResponseCopyWith<$Res> {
  factory $CartAddResponseCopyWith(
    CartAddResponse value,
    $Res Function(CartAddResponse) then,
  ) = _$CartAddResponseCopyWithImpl<$Res, CartAddResponse>;
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson) double cartTotal,
  });
}

/// @nodoc
class _$CartAddResponseCopyWithImpl<$Res, $Val extends CartAddResponse>
    implements $CartAddResponseCopyWith<$Res> {
  _$CartAddResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartAddResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? cartTotal = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            cartTotal: null == cartTotal
                ? _value.cartTotal
                : cartTotal // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartAddResponseImplCopyWith<$Res>
    implements $CartAddResponseCopyWith<$Res> {
  factory _$$CartAddResponseImplCopyWith(
    _$CartAddResponseImpl value,
    $Res Function(_$CartAddResponseImpl) then,
  ) = __$$CartAddResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson) double cartTotal,
  });
}

/// @nodoc
class __$$CartAddResponseImplCopyWithImpl<$Res>
    extends _$CartAddResponseCopyWithImpl<$Res, _$CartAddResponseImpl>
    implements _$$CartAddResponseImplCopyWith<$Res> {
  __$$CartAddResponseImplCopyWithImpl(
    _$CartAddResponseImpl _value,
    $Res Function(_$CartAddResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartAddResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? cartTotal = null}) {
    return _then(
      _$CartAddResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        cartTotal: null == cartTotal
            ? _value.cartTotal
            : cartTotal // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CartAddResponseImpl implements _CartAddResponse {
  const _$CartAddResponseImpl({
    required this.message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson)
    required this.cartTotal,
  });

  factory _$CartAddResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartAddResponseImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey(name: 'cart_total', fromJson: doubleFromJson)
  final double cartTotal;

  @override
  String toString() {
    return 'CartAddResponse(message: $message, cartTotal: $cartTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartAddResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, cartTotal);

  /// Create a copy of CartAddResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartAddResponseImplCopyWith<_$CartAddResponseImpl> get copyWith =>
      __$$CartAddResponseImplCopyWithImpl<_$CartAddResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartAddResponseImplToJson(this);
  }
}

abstract class _CartAddResponse implements CartAddResponse {
  const factory _CartAddResponse({
    required final String message,
    @JsonKey(name: 'cart_total', fromJson: doubleFromJson)
    required final double cartTotal,
  }) = _$CartAddResponseImpl;

  factory _CartAddResponse.fromJson(Map<String, dynamic> json) =
      _$CartAddResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: 'cart_total', fromJson: doubleFromJson)
  double get cartTotal;

  /// Create a copy of CartAddResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartAddResponseImplCopyWith<_$CartAddResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
