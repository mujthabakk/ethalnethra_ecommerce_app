// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderListItem _$OrderListItemFromJson(Map<String, dynamic> json) {
  return _OrderListItem.fromJson(json);
}

/// @nodoc
mixin _$OrderListItem {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count', fromJson: intFromJson)
  int get itemsCount => throw _privateConstructorUsedError;

  /// Serializes this OrderListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderListItemCopyWith<OrderListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListItemCopyWith<$Res> {
  factory $OrderListItemCopyWith(
    OrderListItem value,
    $Res Function(OrderListItem) then,
  ) = _$OrderListItemCopyWithImpl<$Res, OrderListItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'order_number') String orderNumber,
    String date,
    @JsonKey(fromJson: doubleFromJson) double total,
    String status,
    @JsonKey(name: 'items_count', fromJson: intFromJson) int itemsCount,
  });
}

/// @nodoc
class _$OrderListItemCopyWithImpl<$Res, $Val extends OrderListItem>
    implements $OrderListItemCopyWith<$Res> {
  _$OrderListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? date = null,
    Object? total = null,
    Object? status = null,
    Object? itemsCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            itemsCount: null == itemsCount
                ? _value.itemsCount
                : itemsCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderListItemImplCopyWith<$Res>
    implements $OrderListItemCopyWith<$Res> {
  factory _$$OrderListItemImplCopyWith(
    _$OrderListItemImpl value,
    $Res Function(_$OrderListItemImpl) then,
  ) = __$$OrderListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'order_number') String orderNumber,
    String date,
    @JsonKey(fromJson: doubleFromJson) double total,
    String status,
    @JsonKey(name: 'items_count', fromJson: intFromJson) int itemsCount,
  });
}

/// @nodoc
class __$$OrderListItemImplCopyWithImpl<$Res>
    extends _$OrderListItemCopyWithImpl<$Res, _$OrderListItemImpl>
    implements _$$OrderListItemImplCopyWith<$Res> {
  __$$OrderListItemImplCopyWithImpl(
    _$OrderListItemImpl _value,
    $Res Function(_$OrderListItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? date = null,
    Object? total = null,
    Object? status = null,
    Object? itemsCount = null,
  }) {
    return _then(
      _$OrderListItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        itemsCount: null == itemsCount
            ? _value.itemsCount
            : itemsCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderListItemImpl implements _OrderListItem {
  const _$OrderListItemImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(name: 'order_number') required this.orderNumber,
    required this.date,
    @JsonKey(fromJson: doubleFromJson) required this.total,
    required this.status,
    @JsonKey(name: 'items_count', fromJson: intFromJson)
    required this.itemsCount,
  });

  factory _$OrderListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderListItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String date;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  final String status;
  @override
  @JsonKey(name: 'items_count', fromJson: intFromJson)
  final int itemsCount;

  @override
  String toString() {
    return 'OrderListItem(id: $id, orderNumber: $orderNumber, date: $date, total: $total, status: $status, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    date,
    total,
    status,
    itemsCount,
  );

  /// Create a copy of OrderListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderListItemImplCopyWith<_$OrderListItemImpl> get copyWith =>
      __$$OrderListItemImplCopyWithImpl<_$OrderListItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderListItemImplToJson(this);
  }
}

abstract class _OrderListItem implements OrderListItem {
  const factory _OrderListItem({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(name: 'order_number') required final String orderNumber,
    required final String date,
    @JsonKey(fromJson: doubleFromJson) required final double total,
    required final String status,
    @JsonKey(name: 'items_count', fromJson: intFromJson)
    required final int itemsCount,
  }) = _$OrderListItemImpl;

  factory _OrderListItem.fromJson(Map<String, dynamic> json) =
      _$OrderListItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get date;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  String get status;
  @override
  @JsonKey(name: 'items_count', fromJson: intFromJson)
  int get itemsCount;

  /// Create a copy of OrderListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderListItemImplCopyWith<_$OrderListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrdersListResponse _$OrdersListResponseFromJson(Map<String, dynamic> json) {
  return _OrdersListResponse.fromJson(json);
}

/// @nodoc
mixin _$OrdersListResponse {
  List<OrderListItem> get orders => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get pages => throw _privateConstructorUsedError;

  /// Serializes this OrdersListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersListResponseCopyWith<OrdersListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersListResponseCopyWith<$Res> {
  factory $OrdersListResponseCopyWith(
    OrdersListResponse value,
    $Res Function(OrdersListResponse) then,
  ) = _$OrdersListResponseCopyWithImpl<$Res, OrdersListResponse>;
  @useResult
  $Res call({
    List<OrderListItem> orders,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(fromJson: doubleFromJson) double pages,
  });
}

/// @nodoc
class _$OrdersListResponseCopyWithImpl<$Res, $Val extends OrdersListResponse>
    implements $OrdersListResponseCopyWith<$Res> {
  _$OrdersListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<OrderListItem>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrdersListResponseImplCopyWith<$Res>
    implements $OrdersListResponseCopyWith<$Res> {
  factory _$$OrdersListResponseImplCopyWith(
    _$OrdersListResponseImpl value,
    $Res Function(_$OrdersListResponseImpl) then,
  ) = __$$OrdersListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<OrderListItem> orders,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(fromJson: doubleFromJson) double pages,
  });
}

/// @nodoc
class __$$OrdersListResponseImplCopyWithImpl<$Res>
    extends _$OrdersListResponseCopyWithImpl<$Res, _$OrdersListResponseImpl>
    implements _$$OrdersListResponseImplCopyWith<$Res> {
  __$$OrdersListResponseImplCopyWithImpl(
    _$OrdersListResponseImpl _value,
    $Res Function(_$OrdersListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _$OrdersListResponseImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderListItem>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrdersListResponseImpl implements _OrdersListResponse {
  const _$OrdersListResponseImpl({
    required final List<OrderListItem> orders,
    @JsonKey(fromJson: doubleFromJson) required this.total,
    @JsonKey(fromJson: doubleFromJson) required this.pages,
  }) : _orders = orders;

  factory _$OrdersListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersListResponseImplFromJson(json);

  final List<OrderListItem> _orders;
  @override
  List<OrderListItem> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double pages;

  @override
  String toString() {
    return 'OrdersListResponse(orders: $orders, total: $total, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersListResponseImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    total,
    pages,
  );

  /// Create a copy of OrdersListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersListResponseImplCopyWith<_$OrdersListResponseImpl> get copyWith =>
      __$$OrdersListResponseImplCopyWithImpl<_$OrdersListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersListResponseImplToJson(this);
  }
}

abstract class _OrdersListResponse implements OrdersListResponse {
  const factory _OrdersListResponse({
    required final List<OrderListItem> orders,
    @JsonKey(fromJson: doubleFromJson) required final double total,
    @JsonKey(fromJson: doubleFromJson) required final double pages,
  }) = _$OrdersListResponseImpl;

  factory _OrdersListResponse.fromJson(Map<String, dynamic> json) =
      _$OrdersListResponseImpl.fromJson;

  @override
  List<OrderListItem> get orders;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get pages;

  /// Create a copy of OrdersListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersListResponseImplCopyWith<_$OrdersListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceOrderResponse _$PlaceOrderResponseFromJson(Map<String, dynamic> json) {
  return _PlaceOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$PlaceOrderResponse {
  @JsonKey(name: 'order_id', fromJson: stringFromJson)
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_url')
  String get trackingUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get discounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'loyalty_applied')
  bool get loyaltyApplied => throw _privateConstructorUsedError;
  String get eta => throw _privateConstructorUsedError;

  /// Serializes this PlaceOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceOrderResponseCopyWith<PlaceOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceOrderResponseCopyWith<$Res> {
  factory $PlaceOrderResponseCopyWith(
    PlaceOrderResponse value,
    $Res Function(PlaceOrderResponse) then,
  ) = _$PlaceOrderResponseCopyWithImpl<$Res, PlaceOrderResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'order_id', fromJson: stringFromJson) String orderId,
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    @JsonKey(name: 'tracking_url') String trackingUrl,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: dynamicListFromJson) List<dynamic> discounts,
    @JsonKey(name: 'loyalty_applied') bool loyaltyApplied,
    String eta,
  });
}

/// @nodoc
class _$PlaceOrderResponseCopyWithImpl<$Res, $Val extends PlaceOrderResponse>
    implements $PlaceOrderResponseCopyWith<$Res> {
  _$PlaceOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? trackingUrl = null,
    Object? total = null,
    Object? discount = null,
    Object? discounts = null,
    Object? loyaltyApplied = null,
    Object? eta = null,
  }) {
    return _then(
      _value.copyWith(
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            trackingUrl: null == trackingUrl
                ? _value.trackingUrl
                : trackingUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            discounts: null == discounts
                ? _value.discounts
                : discounts // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            loyaltyApplied: null == loyaltyApplied
                ? _value.loyaltyApplied
                : loyaltyApplied // ignore: cast_nullable_to_non_nullable
                      as bool,
            eta: null == eta
                ? _value.eta
                : eta // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaceOrderResponseImplCopyWith<$Res>
    implements $PlaceOrderResponseCopyWith<$Res> {
  factory _$$PlaceOrderResponseImplCopyWith(
    _$PlaceOrderResponseImpl value,
    $Res Function(_$PlaceOrderResponseImpl) then,
  ) = __$$PlaceOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'order_id', fromJson: stringFromJson) String orderId,
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    @JsonKey(name: 'tracking_url') String trackingUrl,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: dynamicListFromJson) List<dynamic> discounts,
    @JsonKey(name: 'loyalty_applied') bool loyaltyApplied,
    String eta,
  });
}

/// @nodoc
class __$$PlaceOrderResponseImplCopyWithImpl<$Res>
    extends _$PlaceOrderResponseCopyWithImpl<$Res, _$PlaceOrderResponseImpl>
    implements _$$PlaceOrderResponseImplCopyWith<$Res> {
  __$$PlaceOrderResponseImplCopyWithImpl(
    _$PlaceOrderResponseImpl _value,
    $Res Function(_$PlaceOrderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaceOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? trackingUrl = null,
    Object? total = null,
    Object? discount = null,
    Object? discounts = null,
    Object? loyaltyApplied = null,
    Object? eta = null,
  }) {
    return _then(
      _$PlaceOrderResponseImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        trackingUrl: null == trackingUrl
            ? _value.trackingUrl
            : trackingUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        discounts: null == discounts
            ? _value._discounts
            : discounts // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        loyaltyApplied: null == loyaltyApplied
            ? _value.loyaltyApplied
            : loyaltyApplied // ignore: cast_nullable_to_non_nullable
                  as bool,
        eta: null == eta
            ? _value.eta
            : eta // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PlaceOrderResponseImpl implements _PlaceOrderResponse {
  const _$PlaceOrderResponseImpl({
    @JsonKey(name: 'order_id', fromJson: stringFromJson) required this.orderId,
    @JsonKey(name: 'order_number') required this.orderNumber,
    required this.status,
    @JsonKey(name: 'tracking_url') required this.trackingUrl,
    @JsonKey(fromJson: doubleFromJson) required this.total,
    @JsonKey(fromJson: doubleFromJson) required this.discount,
    @JsonKey(fromJson: dynamicListFromJson)
    final List<dynamic> discounts = const [],
    @JsonKey(name: 'loyalty_applied') this.loyaltyApplied = false,
    required this.eta,
  }) : _discounts = discounts;

  factory _$PlaceOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceOrderResponseImplFromJson(json);

  @override
  @JsonKey(name: 'order_id', fromJson: stringFromJson)
  final String orderId;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'tracking_url')
  final String trackingUrl;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discount;
  final List<dynamic> _discounts;
  @override
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get discounts {
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discounts);
  }

  @override
  @JsonKey(name: 'loyalty_applied')
  final bool loyaltyApplied;
  @override
  final String eta;

  @override
  String toString() {
    return 'PlaceOrderResponse(orderId: $orderId, orderNumber: $orderNumber, status: $status, trackingUrl: $trackingUrl, total: $total, discount: $discount, discounts: $discounts, loyaltyApplied: $loyaltyApplied, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceOrderResponseImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(
              other._discounts,
              _discounts,
            ) &&
            (identical(other.loyaltyApplied, loyaltyApplied) ||
                other.loyaltyApplied == loyaltyApplied) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    orderNumber,
    status,
    trackingUrl,
    total,
    discount,
    const DeepCollectionEquality().hash(_discounts),
    loyaltyApplied,
    eta,
  );

  /// Create a copy of PlaceOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceOrderResponseImplCopyWith<_$PlaceOrderResponseImpl> get copyWith =>
      __$$PlaceOrderResponseImplCopyWithImpl<_$PlaceOrderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceOrderResponseImplToJson(this);
  }
}

abstract class _PlaceOrderResponse implements PlaceOrderResponse {
  const factory _PlaceOrderResponse({
    @JsonKey(name: 'order_id', fromJson: stringFromJson)
    required final String orderId,
    @JsonKey(name: 'order_number') required final String orderNumber,
    required final String status,
    @JsonKey(name: 'tracking_url') required final String trackingUrl,
    @JsonKey(fromJson: doubleFromJson) required final double total,
    @JsonKey(fromJson: doubleFromJson) required final double discount,
    @JsonKey(fromJson: dynamicListFromJson) final List<dynamic> discounts,
    @JsonKey(name: 'loyalty_applied') final bool loyaltyApplied,
    required final String eta,
  }) = _$PlaceOrderResponseImpl;

  factory _PlaceOrderResponse.fromJson(Map<String, dynamic> json) =
      _$PlaceOrderResponseImpl.fromJson;

  @override
  @JsonKey(name: 'order_id', fromJson: stringFromJson)
  String get orderId;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get status;
  @override
  @JsonKey(name: 'tracking_url')
  String get trackingUrl;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discount;
  @override
  @JsonKey(fromJson: dynamicListFromJson)
  List<dynamic> get discounts;
  @override
  @JsonKey(name: 'loyalty_applied')
  bool get loyaltyApplied;
  @override
  String get eta;

  /// Create a copy of PlaceOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceOrderResponseImplCopyWith<_$PlaceOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTrackResponse _$OrderTrackResponseFromJson(Map<String, dynamic> json) {
  return _OrderTrackResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderTrackResponse {
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get eta => throw _privateConstructorUsedError;

  /// Serializes this OrderTrackResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTrackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTrackResponseCopyWith<OrderTrackResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackResponseCopyWith<$Res> {
  factory $OrderTrackResponseCopyWith(
    OrderTrackResponse value,
    $Res Function(OrderTrackResponse) then,
  ) = _$OrderTrackResponseCopyWithImpl<$Res, OrderTrackResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    String eta,
  });
}

/// @nodoc
class _$OrderTrackResponseCopyWithImpl<$Res, $Val extends OrderTrackResponse>
    implements $OrderTrackResponseCopyWith<$Res> {
  _$OrderTrackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTrackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? status = null,
    Object? eta = null,
  }) {
    return _then(
      _value.copyWith(
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            eta: null == eta
                ? _value.eta
                : eta // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderTrackResponseImplCopyWith<$Res>
    implements $OrderTrackResponseCopyWith<$Res> {
  factory _$$OrderTrackResponseImplCopyWith(
    _$OrderTrackResponseImpl value,
    $Res Function(_$OrderTrackResponseImpl) then,
  ) = __$$OrderTrackResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    String eta,
  });
}

/// @nodoc
class __$$OrderTrackResponseImplCopyWithImpl<$Res>
    extends _$OrderTrackResponseCopyWithImpl<$Res, _$OrderTrackResponseImpl>
    implements _$$OrderTrackResponseImplCopyWith<$Res> {
  __$$OrderTrackResponseImplCopyWithImpl(
    _$OrderTrackResponseImpl _value,
    $Res Function(_$OrderTrackResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderTrackResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
    Object? status = null,
    Object? eta = null,
  }) {
    return _then(
      _$OrderTrackResponseImpl(
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        eta: null == eta
            ? _value.eta
            : eta // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderTrackResponseImpl implements _OrderTrackResponse {
  const _$OrderTrackResponseImpl({
    @JsonKey(name: 'order_number') required this.orderNumber,
    required this.status,
    this.eta = '',
  });

  factory _$OrderTrackResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTrackResponseImplFromJson(json);

  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey()
  final String eta;

  @override
  String toString() {
    return 'OrderTrackResponse(orderNumber: $orderNumber, status: $status, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackResponseImpl &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderNumber, status, eta);

  /// Create a copy of OrderTrackResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackResponseImplCopyWith<_$OrderTrackResponseImpl> get copyWith =>
      __$$OrderTrackResponseImplCopyWithImpl<_$OrderTrackResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTrackResponseImplToJson(this);
  }
}

abstract class _OrderTrackResponse implements OrderTrackResponse {
  const factory _OrderTrackResponse({
    @JsonKey(name: 'order_number') required final String orderNumber,
    required final String status,
    final String eta,
  }) = _$OrderTrackResponseImpl;

  factory _OrderTrackResponse.fromJson(Map<String, dynamic> json) =
      _$OrderTrackResponseImpl.fromJson;

  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get status;
  @override
  String get eta;

  /// Create a copy of OrderTrackResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTrackResponseImplCopyWith<_$OrderTrackResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelOrderResponse _$CancelOrderResponseFromJson(Map<String, dynamic> json) {
  return _CancelOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$CancelOrderResponse {
  String get message => throw _privateConstructorUsedError;

  /// Serializes this CancelOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelOrderResponseCopyWith<CancelOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelOrderResponseCopyWith<$Res> {
  factory $CancelOrderResponseCopyWith(
    CancelOrderResponse value,
    $Res Function(CancelOrderResponse) then,
  ) = _$CancelOrderResponseCopyWithImpl<$Res, CancelOrderResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CancelOrderResponseCopyWithImpl<$Res, $Val extends CancelOrderResponse>
    implements $CancelOrderResponseCopyWith<$Res> {
  _$CancelOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CancelOrderResponseImplCopyWith<$Res>
    implements $CancelOrderResponseCopyWith<$Res> {
  factory _$$CancelOrderResponseImplCopyWith(
    _$CancelOrderResponseImpl value,
    $Res Function(_$CancelOrderResponseImpl) then,
  ) = __$$CancelOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CancelOrderResponseImplCopyWithImpl<$Res>
    extends _$CancelOrderResponseCopyWithImpl<$Res, _$CancelOrderResponseImpl>
    implements _$$CancelOrderResponseImplCopyWith<$Res> {
  __$$CancelOrderResponseImplCopyWithImpl(
    _$CancelOrderResponseImpl _value,
    $Res Function(_$CancelOrderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CancelOrderResponseImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelOrderResponseImpl implements _CancelOrderResponse {
  const _$CancelOrderResponseImpl({required this.message});

  factory _$CancelOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelOrderResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'CancelOrderResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderResponseImplCopyWith<_$CancelOrderResponseImpl> get copyWith =>
      __$$CancelOrderResponseImplCopyWithImpl<_$CancelOrderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelOrderResponseImplToJson(this);
  }
}

abstract class _CancelOrderResponse implements CancelOrderResponse {
  const factory _CancelOrderResponse({required final String message}) =
      _$CancelOrderResponseImpl;

  factory _CancelOrderResponse.fromJson(Map<String, dynamic> json) =
      _$CancelOrderResponseImpl.fromJson;

  @override
  String get message;

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderResponseImplCopyWith<_$CancelOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
