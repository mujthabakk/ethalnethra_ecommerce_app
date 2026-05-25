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
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_type')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'dispatch_date')
  String get dispatchDate => throw _privateConstructorUsedError;
  @JsonKey()
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;

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
    String status,
    @JsonKey(name: 'order_type') String orderType,
    @JsonKey(name: 'created_at') String date,
    @JsonKey(name: 'dispatch_date') String dispatchDate,
    @JsonKey() String notes,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
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
    Object? status = null,
    Object? orderType = null,
    Object? date = null,
    Object? dispatchDate = null,
    Object? notes = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            orderType: null == orderType
                ? _value.orderType
                : orderType // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            dispatchDate: null == dispatchDate
                ? _value.dispatchDate
                : dispatchDate // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
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
    String status,
    @JsonKey(name: 'order_type') String orderType,
    @JsonKey(name: 'created_at') String date,
    @JsonKey(name: 'dispatch_date') String dispatchDate,
    @JsonKey() String notes,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
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
    Object? status = null,
    Object? orderType = null,
    Object? date = null,
    Object? dispatchDate = null,
    Object? notes = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        orderType: null == orderType
            ? _value.orderType
            : orderType // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        dispatchDate: null == dispatchDate
            ? _value.dispatchDate
            : dispatchDate // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
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
    required this.status,
    @JsonKey(name: 'order_type') this.orderType = '',
    @JsonKey(name: 'created_at') this.date = '',
    @JsonKey(name: 'dispatch_date') this.dispatchDate = '',
    @JsonKey() this.notes = '',
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
    @JsonKey(fromJson: doubleFromJson) this.discount = 0,
    @JsonKey(fromJson: doubleFromJson) required this.total,
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
  final String status;
  @override
  @JsonKey(name: 'order_type')
  final String orderType;
  @override
  @JsonKey(name: 'created_at')
  final String date;
  @override
  @JsonKey(name: 'dispatch_date')
  final String dispatchDate;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;

  @override
  String toString() {
    return 'OrderListItem(id: $id, orderNumber: $orderNumber, status: $status, orderType: $orderType, date: $date, dispatchDate: $dispatchDate, notes: $notes, subtotal: $subtotal, discount: $discount, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dispatchDate, dispatchDate) ||
                other.dispatchDate == dispatchDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    status,
    orderType,
    date,
    dispatchDate,
    notes,
    subtotal,
    discount,
    total,
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
    required final String status,
    @JsonKey(name: 'order_type') final String orderType,
    @JsonKey(name: 'created_at') final String date,
    @JsonKey(name: 'dispatch_date') final String dispatchDate,
    @JsonKey() final String notes,
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
    @JsonKey(fromJson: doubleFromJson) final double discount,
    @JsonKey(fromJson: doubleFromJson) required final double total,
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
  String get status;
  @override
  @JsonKey(name: 'order_type')
  String get orderType;
  @override
  @JsonKey(name: 'created_at')
  String get date;
  @override
  @JsonKey(name: 'dispatch_date')
  String get dispatchDate;
  @override
  @JsonKey()
  String get notes;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;

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
  @JsonKey(fromJson: intFromJson)
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: intFromJson)
  int get lastPage => throw _privateConstructorUsedError;

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
    @JsonKey(fromJson: intFromJson) int totalCount,
    @JsonKey(name: 'current_page', fromJson: intFromJson) int currentPage,
    @JsonKey(name: 'last_page', fromJson: intFromJson) int lastPage,
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
    Object? totalCount = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(
      _value.copyWith(
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<OrderListItem>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            lastPage: null == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int,
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
    @JsonKey(fromJson: intFromJson) int totalCount,
    @JsonKey(name: 'current_page', fromJson: intFromJson) int currentPage,
    @JsonKey(name: 'last_page', fromJson: intFromJson) int lastPage,
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
    Object? totalCount = null,
    Object? currentPage = null,
    Object? lastPage = null,
  }) {
    return _then(
      _$OrdersListResponseImpl(
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderListItem>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        lastPage: null == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrdersListResponseImpl implements _OrdersListResponse {
  const _$OrdersListResponseImpl({
    required final List<OrderListItem> orders,
    @JsonKey(fromJson: intFromJson) this.totalCount = 0,
    @JsonKey(name: 'current_page', fromJson: intFromJson) this.currentPage = 1,
    @JsonKey(name: 'last_page', fromJson: intFromJson) this.lastPage = 1,
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
  @JsonKey(fromJson: intFromJson)
  final int totalCount;
  @override
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  final int currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: intFromJson)
  final int lastPage;

  @override
  String toString() {
    return 'OrdersListResponse(orders: $orders, totalCount: $totalCount, currentPage: $currentPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersListResponseImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_orders),
    totalCount,
    currentPage,
    lastPage,
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
    @JsonKey(fromJson: intFromJson) final int totalCount,
    @JsonKey(name: 'current_page', fromJson: intFromJson) final int currentPage,
    @JsonKey(name: 'last_page', fromJson: intFromJson) final int lastPage,
  }) = _$OrdersListResponseImpl;

  factory _OrdersListResponse.fromJson(Map<String, dynamic> json) =
      _$OrdersListResponseImpl.fromJson;

  @override
  List<OrderListItem> get orders;
  @override
  @JsonKey(fromJson: intFromJson)
  int get totalCount;
  @override
  @JsonKey(name: 'current_page', fromJson: intFromJson)
  int get currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: intFromJson)
  int get lastPage;

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
  @JsonKey(name: 'dispatch_date')
  String get dispatchDate => throw _privateConstructorUsedError;
  @JsonKey()
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge => throw _privateConstructorUsedError;
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
    @JsonKey(name: 'dispatch_date') String dispatchDate,
    @JsonKey() String notes,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
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
    Object? dispatchDate = null,
    Object? notes = null,
    Object? deliveryCharge = null,
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
            dispatchDate: null == dispatchDate
                ? _value.dispatchDate
                : dispatchDate // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryCharge: null == deliveryCharge
                ? _value.deliveryCharge
                : deliveryCharge // ignore: cast_nullable_to_non_nullable
                      as double,
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
    @JsonKey(name: 'dispatch_date') String dispatchDate,
    @JsonKey() String notes,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
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
    Object? dispatchDate = null,
    Object? notes = null,
    Object? deliveryCharge = null,
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
        dispatchDate: null == dispatchDate
            ? _value.dispatchDate
            : dispatchDate // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryCharge: null == deliveryCharge
            ? _value.deliveryCharge
            : deliveryCharge // ignore: cast_nullable_to_non_nullable
                  as double,
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
    @JsonKey(name: 'tracking_url') this.trackingUrl = '',
    @JsonKey(name: 'dispatch_date') this.dispatchDate = '',
    @JsonKey() this.notes = '',
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    this.deliveryCharge = 0,
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
  @JsonKey(name: 'dispatch_date')
  final String dispatchDate;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  final double deliveryCharge;
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
    return 'PlaceOrderResponse(orderId: $orderId, orderNumber: $orderNumber, status: $status, trackingUrl: $trackingUrl, dispatchDate: $dispatchDate, notes: $notes, deliveryCharge: $deliveryCharge, total: $total, discount: $discount, discounts: $discounts, loyaltyApplied: $loyaltyApplied, eta: $eta)';
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
            (identical(other.dispatchDate, dispatchDate) ||
                other.dispatchDate == dispatchDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
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
    dispatchDate,
    notes,
    deliveryCharge,
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
    @JsonKey(name: 'tracking_url') final String trackingUrl,
    @JsonKey(name: 'dispatch_date') final String dispatchDate,
    @JsonKey() final String notes,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    final double deliveryCharge,
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
  @JsonKey(name: 'dispatch_date')
  String get dispatchDate;
  @override
  @JsonKey()
  String get notes;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge;
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

OrderDetailItem _$OrderDetailItemFromJson(Map<String, dynamic> json) {
  return _OrderDetailItem.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailItem {
  @JsonKey(fromJson: stringFromJson)
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_ml')
  String get nameMl => throw _privateConstructorUsedError;
  @JsonKey()
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey()
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolFromJson)
  bool get isPreorder => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailItemCopyWith<OrderDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailItemCopyWith<$Res> {
  factory $OrderDetailItemCopyWith(
    OrderDetailItem value,
    $Res Function(OrderDetailItem) then,
  ) = _$OrderDetailItemCopyWithImpl<$Res, OrderDetailItem>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String productId,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey() String name,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey() String unit,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: boolFromJson) bool isPreorder,
  });
}

/// @nodoc
class _$OrderDetailItemCopyWithImpl<$Res, $Val extends OrderDetailItem>
    implements $OrderDetailItemCopyWith<$Res> {
  _$OrderDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? nameMl = null,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? subtotal = null,
    Object? imageUrl = null,
    Object? isPreorder = null,
  }) {
    return _then(
      _value.copyWith(
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
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            isPreorder: null == isPreorder
                ? _value.isPreorder
                : isPreorder // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderDetailItemImplCopyWith<$Res>
    implements $OrderDetailItemCopyWith<$Res> {
  factory _$$OrderDetailItemImplCopyWith(
    _$OrderDetailItemImpl value,
    $Res Function(_$OrderDetailItemImpl) then,
  ) = __$$OrderDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String productId,
    @JsonKey(name: 'name_ml') String nameMl,
    @JsonKey() String name,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey() String unit,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: stringFromJson) String imageUrl,
    @JsonKey(fromJson: boolFromJson) bool isPreorder,
  });
}

/// @nodoc
class __$$OrderDetailItemImplCopyWithImpl<$Res>
    extends _$OrderDetailItemCopyWithImpl<$Res, _$OrderDetailItemImpl>
    implements _$$OrderDetailItemImplCopyWith<$Res> {
  __$$OrderDetailItemImplCopyWithImpl(
    _$OrderDetailItemImpl _value,
    $Res Function(_$OrderDetailItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? nameMl = null,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? subtotal = null,
    Object? imageUrl = null,
    Object? isPreorder = null,
  }) {
    return _then(
      _$OrderDetailItemImpl(
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
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        isPreorder: null == isPreorder
            ? _value.isPreorder
            : isPreorder // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderDetailItemImpl implements _OrderDetailItem {
  const _$OrderDetailItemImpl({
    @JsonKey(fromJson: stringFromJson) this.productId = '',
    @JsonKey(name: 'name_ml') this.nameMl = '',
    @JsonKey() this.name = '',
    @JsonKey(fromJson: doubleFromJson) this.quantity = 1,
    @JsonKey() this.unit = '',
    @JsonKey(fromJson: doubleFromJson) this.price = 0,
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
    @JsonKey(fromJson: stringFromJson) this.imageUrl = '',
    @JsonKey(fromJson: boolFromJson) this.isPreorder = false,
  });

  factory _$OrderDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailItemImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String productId;
  @override
  @JsonKey(name: 'name_ml')
  final String nameMl;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double quantity;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(fromJson: stringFromJson)
  final String imageUrl;
  @override
  @JsonKey(fromJson: boolFromJson)
  final bool isPreorder;

  @override
  String toString() {
    return 'OrderDetailItem(productId: $productId, nameMl: $nameMl, name: $name, quantity: $quantity, unit: $unit, price: $price, subtotal: $subtotal, imageUrl: $imageUrl, isPreorder: $isPreorder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.nameMl, nameMl) || other.nameMl == nameMl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isPreorder, isPreorder) ||
                other.isPreorder == isPreorder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    nameMl,
    name,
    quantity,
    unit,
    price,
    subtotal,
    imageUrl,
    isPreorder,
  );

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailItemImplCopyWith<_$OrderDetailItemImpl> get copyWith =>
      __$$OrderDetailItemImplCopyWithImpl<_$OrderDetailItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailItemImplToJson(this);
  }
}

abstract class _OrderDetailItem implements OrderDetailItem {
  const factory _OrderDetailItem({
    @JsonKey(fromJson: stringFromJson) final String productId,
    @JsonKey(name: 'name_ml') final String nameMl,
    @JsonKey() final String name,
    @JsonKey(fromJson: doubleFromJson) final double quantity,
    @JsonKey() final String unit,
    @JsonKey(fromJson: doubleFromJson) final double price,
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
    @JsonKey(fromJson: stringFromJson) final String imageUrl,
    @JsonKey(fromJson: boolFromJson) final bool isPreorder,
  }) = _$OrderDetailItemImpl;

  factory _OrderDetailItem.fromJson(Map<String, dynamic> json) =
      _$OrderDetailItemImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get productId;
  @override
  @JsonKey(name: 'name_ml')
  String get nameMl;
  @override
  @JsonKey()
  String get name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get quantity;
  @override
  @JsonKey()
  String get unit;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(fromJson: stringFromJson)
  String get imageUrl;
  @override
  @JsonKey(fromJson: boolFromJson)
  bool get isPreorder;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailItemImplCopyWith<_$OrderDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailResponse _$OrderDetailResponseFromJson(Map<String, dynamic> json) {
  return _OrderDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailResponse {
  @JsonKey(fromJson: stringFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_type')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey()
  String get notes => throw _privateConstructorUsedError;
  List<OrderDetailItem> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_history')
  List<OrderDetailItem> get historyItems => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailResponseCopyWith<OrderDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailResponseCopyWith<$Res> {
  factory $OrderDetailResponseCopyWith(
    OrderDetailResponse value,
    $Res Function(OrderDetailResponse) then,
  ) = _$OrderDetailResponseCopyWithImpl<$Res, OrderDetailResponse>;
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    @JsonKey(name: 'order_type') String orderType,
    @JsonKey(name: 'created_at') String date,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey() String notes,
    List<OrderDetailItem> items,
    @JsonKey(name: 'order_history') List<OrderDetailItem> historyItems,
  });
}

/// @nodoc
class _$OrderDetailResponseCopyWithImpl<$Res, $Val extends OrderDetailResponse>
    implements $OrderDetailResponseCopyWith<$Res> {
  _$OrderDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? orderType = null,
    Object? date = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? deliveryCharge = null,
    Object? notes = null,
    Object? items = null,
    Object? historyItems = null,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            orderType: null == orderType
                ? _value.orderType
                : orderType // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            deliveryCharge: null == deliveryCharge
                ? _value.deliveryCharge
                : deliveryCharge // ignore: cast_nullable_to_non_nullable
                      as double,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderDetailItem>,
            historyItems: null == historyItems
                ? _value.historyItems
                : historyItems // ignore: cast_nullable_to_non_nullable
                      as List<OrderDetailItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderDetailResponseImplCopyWith<$Res>
    implements $OrderDetailResponseCopyWith<$Res> {
  factory _$$OrderDetailResponseImplCopyWith(
    _$OrderDetailResponseImpl value,
    $Res Function(_$OrderDetailResponseImpl) then,
  ) = __$$OrderDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: stringFromJson) String id,
    @JsonKey(name: 'order_number') String orderNumber,
    String status,
    @JsonKey(name: 'order_type') String orderType,
    @JsonKey(name: 'created_at') String date,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey() String notes,
    List<OrderDetailItem> items,
    @JsonKey(name: 'order_history') List<OrderDetailItem> historyItems,
  });
}

/// @nodoc
class __$$OrderDetailResponseImplCopyWithImpl<$Res>
    extends _$OrderDetailResponseCopyWithImpl<$Res, _$OrderDetailResponseImpl>
    implements _$$OrderDetailResponseImplCopyWith<$Res> {
  __$$OrderDetailResponseImplCopyWithImpl(
    _$OrderDetailResponseImpl _value,
    $Res Function(_$OrderDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? orderType = null,
    Object? date = null,
    Object? subtotal = null,
    Object? discount = null,
    Object? total = null,
    Object? deliveryCharge = null,
    Object? notes = null,
    Object? items = null,
    Object? historyItems = null,
  }) {
    return _then(
      _$OrderDetailResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        orderType: null == orderType
            ? _value.orderType
            : orderType // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        deliveryCharge: null == deliveryCharge
            ? _value.deliveryCharge
            : deliveryCharge // ignore: cast_nullable_to_non_nullable
                  as double,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderDetailItem>,
        historyItems: null == historyItems
            ? _value._historyItems
            : historyItems // ignore: cast_nullable_to_non_nullable
                  as List<OrderDetailItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderDetailResponseImpl implements _OrderDetailResponse {
  const _$OrderDetailResponseImpl({
    @JsonKey(fromJson: stringFromJson) required this.id,
    @JsonKey(name: 'order_number') required this.orderNumber,
    required this.status,
    @JsonKey(name: 'order_type') this.orderType = '',
    @JsonKey(name: 'created_at') this.date = '',
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
    @JsonKey(fromJson: doubleFromJson) this.discount = 0,
    @JsonKey(fromJson: doubleFromJson) required this.total,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    this.deliveryCharge = 0,
    @JsonKey() this.notes = '',
    final List<OrderDetailItem> items = const [],
    @JsonKey(name: 'order_history')
    final List<OrderDetailItem> historyItems = const [],
  }) : _items = items,
       _historyItems = historyItems;

  factory _$OrderDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailResponseImplFromJson(json);

  @override
  @JsonKey(fromJson: stringFromJson)
  final String id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'order_type')
  final String orderType;
  @override
  @JsonKey(name: 'created_at')
  final String date;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  final double deliveryCharge;
  @override
  @JsonKey()
  final String notes;
  final List<OrderDetailItem> _items;
  @override
  @JsonKey()
  List<OrderDetailItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<OrderDetailItem> _historyItems;
  @override
  @JsonKey(name: 'order_history')
  List<OrderDetailItem> get historyItems {
    if (_historyItems is EqualUnmodifiableListView) return _historyItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyItems);
  }

  @override
  String toString() {
    return 'OrderDetailResponse(id: $id, orderNumber: $orderNumber, status: $status, orderType: $orderType, date: $date, subtotal: $subtotal, discount: $discount, total: $total, deliveryCharge: $deliveryCharge, notes: $notes, items: $items, historyItems: $historyItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._historyItems,
              _historyItems,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    status,
    orderType,
    date,
    subtotal,
    discount,
    total,
    deliveryCharge,
    notes,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_historyItems),
  );

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      __$$OrderDetailResponseImplCopyWithImpl<_$OrderDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailResponseImplToJson(this);
  }
}

abstract class _OrderDetailResponse implements OrderDetailResponse {
  const factory _OrderDetailResponse({
    @JsonKey(fromJson: stringFromJson) required final String id,
    @JsonKey(name: 'order_number') required final String orderNumber,
    required final String status,
    @JsonKey(name: 'order_type') final String orderType,
    @JsonKey(name: 'created_at') final String date,
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
    @JsonKey(fromJson: doubleFromJson) final double discount,
    @JsonKey(fromJson: doubleFromJson) required final double total,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    final double deliveryCharge,
    @JsonKey() final String notes,
    final List<OrderDetailItem> items,
    @JsonKey(name: 'order_history') final List<OrderDetailItem> historyItems,
  }) = _$OrderDetailResponseImpl;

  factory _OrderDetailResponse.fromJson(Map<String, dynamic> json) =
      _$OrderDetailResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: stringFromJson)
  String get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  String get status;
  @override
  @JsonKey(name: 'order_type')
  String get orderType;
  @override
  @JsonKey(name: 'created_at')
  String get date;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge;
  @override
  @JsonKey()
  String get notes;
  @override
  List<OrderDetailItem> get items;
  @override
  @JsonKey(name: 'order_history')
  List<OrderDetailItem> get historyItems;

  /// Create a copy of OrderDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailResponseImplCopyWith<_$OrderDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
