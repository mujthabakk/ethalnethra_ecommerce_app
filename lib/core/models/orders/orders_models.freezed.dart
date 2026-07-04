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

RewardWallet _$RewardWalletFromJson(Map<String, dynamic> json) {
  return _RewardWallet.fromJson(json);
}

/// @nodoc
mixin _$RewardWallet {
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  int get availableCoins => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_required', fromJson: intFromJson)
  int get minimumRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  bool get canRedeem => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
  double get maximumDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_value', fromJson: doubleFromJson)
  double get coinValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
  int get coinsToBeEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
  double get payableAfterRedeeming => throw _privateConstructorUsedError;

  /// Serializes this RewardWallet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardWalletCopyWith<RewardWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardWalletCopyWith<$Res> {
  factory $RewardWalletCopyWith(
    RewardWallet value,
    $Res Function(RewardWallet) then,
  ) = _$RewardWalletCopyWithImpl<$Res, RewardWallet>;
  @useResult
  $Res call({
    @JsonKey(name: 'available_coins', fromJson: intFromJson) int availableCoins,
    @JsonKey(name: 'minimum_required', fromJson: intFromJson)
    int minimumRequired,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) bool canRedeem,
    @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
    double maximumDiscount,
    @JsonKey(name: 'coin_value', fromJson: doubleFromJson) double coinValue,
    @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
    int coinsToBeEarned,
    @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
    double payableAfterRedeeming,
  });
}

/// @nodoc
class _$RewardWalletCopyWithImpl<$Res, $Val extends RewardWallet>
    implements $RewardWalletCopyWith<$Res> {
  _$RewardWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableCoins = null,
    Object? minimumRequired = null,
    Object? canRedeem = null,
    Object? maximumDiscount = null,
    Object? coinValue = null,
    Object? coinsToBeEarned = null,
    Object? payableAfterRedeeming = null,
  }) {
    return _then(
      _value.copyWith(
            availableCoins: null == availableCoins
                ? _value.availableCoins
                : availableCoins // ignore: cast_nullable_to_non_nullable
                      as int,
            minimumRequired: null == minimumRequired
                ? _value.minimumRequired
                : minimumRequired // ignore: cast_nullable_to_non_nullable
                      as int,
            canRedeem: null == canRedeem
                ? _value.canRedeem
                : canRedeem // ignore: cast_nullable_to_non_nullable
                      as bool,
            maximumDiscount: null == maximumDiscount
                ? _value.maximumDiscount
                : maximumDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            coinValue: null == coinValue
                ? _value.coinValue
                : coinValue // ignore: cast_nullable_to_non_nullable
                      as double,
            coinsToBeEarned: null == coinsToBeEarned
                ? _value.coinsToBeEarned
                : coinsToBeEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            payableAfterRedeeming: null == payableAfterRedeeming
                ? _value.payableAfterRedeeming
                : payableAfterRedeeming // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RewardWalletImplCopyWith<$Res>
    implements $RewardWalletCopyWith<$Res> {
  factory _$$RewardWalletImplCopyWith(
    _$RewardWalletImpl value,
    $Res Function(_$RewardWalletImpl) then,
  ) = __$$RewardWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'available_coins', fromJson: intFromJson) int availableCoins,
    @JsonKey(name: 'minimum_required', fromJson: intFromJson)
    int minimumRequired,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) bool canRedeem,
    @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
    double maximumDiscount,
    @JsonKey(name: 'coin_value', fromJson: doubleFromJson) double coinValue,
    @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
    int coinsToBeEarned,
    @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
    double payableAfterRedeeming,
  });
}

/// @nodoc
class __$$RewardWalletImplCopyWithImpl<$Res>
    extends _$RewardWalletCopyWithImpl<$Res, _$RewardWalletImpl>
    implements _$$RewardWalletImplCopyWith<$Res> {
  __$$RewardWalletImplCopyWithImpl(
    _$RewardWalletImpl _value,
    $Res Function(_$RewardWalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableCoins = null,
    Object? minimumRequired = null,
    Object? canRedeem = null,
    Object? maximumDiscount = null,
    Object? coinValue = null,
    Object? coinsToBeEarned = null,
    Object? payableAfterRedeeming = null,
  }) {
    return _then(
      _$RewardWalletImpl(
        availableCoins: null == availableCoins
            ? _value.availableCoins
            : availableCoins // ignore: cast_nullable_to_non_nullable
                  as int,
        minimumRequired: null == minimumRequired
            ? _value.minimumRequired
            : minimumRequired // ignore: cast_nullable_to_non_nullable
                  as int,
        canRedeem: null == canRedeem
            ? _value.canRedeem
            : canRedeem // ignore: cast_nullable_to_non_nullable
                  as bool,
        maximumDiscount: null == maximumDiscount
            ? _value.maximumDiscount
            : maximumDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        coinValue: null == coinValue
            ? _value.coinValue
            : coinValue // ignore: cast_nullable_to_non_nullable
                  as double,
        coinsToBeEarned: null == coinsToBeEarned
            ? _value.coinsToBeEarned
            : coinsToBeEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        payableAfterRedeeming: null == payableAfterRedeeming
            ? _value.payableAfterRedeeming
            : payableAfterRedeeming // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RewardWalletImpl implements _RewardWallet {
  const _$RewardWalletImpl({
    @JsonKey(name: 'available_coins', fromJson: intFromJson)
    this.availableCoins = 0,
    @JsonKey(name: 'minimum_required', fromJson: intFromJson)
    this.minimumRequired = 0,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) this.canRedeem = false,
    @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
    this.maximumDiscount = 0,
    @JsonKey(name: 'coin_value', fromJson: doubleFromJson) this.coinValue = 1,
    @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
    this.coinsToBeEarned = 0,
    @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
    this.payableAfterRedeeming = 0,
  });

  factory _$RewardWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardWalletImplFromJson(json);

  @override
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  final int availableCoins;
  @override
  @JsonKey(name: 'minimum_required', fromJson: intFromJson)
  final int minimumRequired;
  @override
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  final bool canRedeem;
  @override
  @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
  final double maximumDiscount;
  @override
  @JsonKey(name: 'coin_value', fromJson: doubleFromJson)
  final double coinValue;
  @override
  @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
  final int coinsToBeEarned;
  @override
  @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
  final double payableAfterRedeeming;

  @override
  String toString() {
    return 'RewardWallet(availableCoins: $availableCoins, minimumRequired: $minimumRequired, canRedeem: $canRedeem, maximumDiscount: $maximumDiscount, coinValue: $coinValue, coinsToBeEarned: $coinsToBeEarned, payableAfterRedeeming: $payableAfterRedeeming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardWalletImpl &&
            (identical(other.availableCoins, availableCoins) ||
                other.availableCoins == availableCoins) &&
            (identical(other.minimumRequired, minimumRequired) ||
                other.minimumRequired == minimumRequired) &&
            (identical(other.canRedeem, canRedeem) ||
                other.canRedeem == canRedeem) &&
            (identical(other.maximumDiscount, maximumDiscount) ||
                other.maximumDiscount == maximumDiscount) &&
            (identical(other.coinValue, coinValue) ||
                other.coinValue == coinValue) &&
            (identical(other.coinsToBeEarned, coinsToBeEarned) ||
                other.coinsToBeEarned == coinsToBeEarned) &&
            (identical(other.payableAfterRedeeming, payableAfterRedeeming) ||
                other.payableAfterRedeeming == payableAfterRedeeming));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    availableCoins,
    minimumRequired,
    canRedeem,
    maximumDiscount,
    coinValue,
    coinsToBeEarned,
    payableAfterRedeeming,
  );

  /// Create a copy of RewardWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardWalletImplCopyWith<_$RewardWalletImpl> get copyWith =>
      __$$RewardWalletImplCopyWithImpl<_$RewardWalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardWalletImplToJson(this);
  }
}

abstract class _RewardWallet implements RewardWallet {
  const factory _RewardWallet({
    @JsonKey(name: 'available_coins', fromJson: intFromJson)
    final int availableCoins,
    @JsonKey(name: 'minimum_required', fromJson: intFromJson)
    final int minimumRequired,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) final bool canRedeem,
    @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
    final double maximumDiscount,
    @JsonKey(name: 'coin_value', fromJson: doubleFromJson)
    final double coinValue,
    @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
    final int coinsToBeEarned,
    @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
    final double payableAfterRedeeming,
  }) = _$RewardWalletImpl;

  factory _RewardWallet.fromJson(Map<String, dynamic> json) =
      _$RewardWalletImpl.fromJson;

  @override
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  int get availableCoins;
  @override
  @JsonKey(name: 'minimum_required', fromJson: intFromJson)
  int get minimumRequired;
  @override
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  bool get canRedeem;
  @override
  @JsonKey(name: 'maximum_discount', fromJson: doubleFromJson)
  double get maximumDiscount;
  @override
  @JsonKey(name: 'coin_value', fromJson: doubleFromJson)
  double get coinValue;
  @override
  @JsonKey(name: 'coins_to_be_earned', fromJson: intFromJson)
  int get coinsToBeEarned;
  @override
  @JsonKey(name: 'payable_after_redeeming', fromJson: doubleFromJson)
  double get payableAfterRedeeming;

  /// Create a copy of RewardWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardWalletImplCopyWith<_$RewardWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutAddress _$CheckoutAddressFromJson(Map<String, dynamic> json) {
  return _CheckoutAddress.fromJson(json);
}

/// @nodoc
mixin _$CheckoutAddress {
  @JsonKey(fromJson: intFromJson)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line')
  String get addressLine => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;

  /// Serializes this CheckoutAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutAddressCopyWith<CheckoutAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutAddressCopyWith<$Res> {
  factory $CheckoutAddressCopyWith(
    CheckoutAddress value,
    $Res Function(CheckoutAddress) then,
  ) = _$CheckoutAddressCopyWithImpl<$Res, CheckoutAddress>;
  @useResult
  $Res call({
    @JsonKey(fromJson: intFromJson) int id,
    @JsonKey(name: 'address_line') String addressLine,
    String pincode,
  });
}

/// @nodoc
class _$CheckoutAddressCopyWithImpl<$Res, $Val extends CheckoutAddress>
    implements $CheckoutAddressCopyWith<$Res> {
  _$CheckoutAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressLine = null,
    Object? pincode = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            addressLine: null == addressLine
                ? _value.addressLine
                : addressLine // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CheckoutAddressImplCopyWith<$Res>
    implements $CheckoutAddressCopyWith<$Res> {
  factory _$$CheckoutAddressImplCopyWith(
    _$CheckoutAddressImpl value,
    $Res Function(_$CheckoutAddressImpl) then,
  ) = __$$CheckoutAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: intFromJson) int id,
    @JsonKey(name: 'address_line') String addressLine,
    String pincode,
  });
}

/// @nodoc
class __$$CheckoutAddressImplCopyWithImpl<$Res>
    extends _$CheckoutAddressCopyWithImpl<$Res, _$CheckoutAddressImpl>
    implements _$$CheckoutAddressImplCopyWith<$Res> {
  __$$CheckoutAddressImplCopyWithImpl(
    _$CheckoutAddressImpl _value,
    $Res Function(_$CheckoutAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressLine = null,
    Object? pincode = null,
  }) {
    return _then(
      _$CheckoutAddressImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        addressLine: null == addressLine
            ? _value.addressLine
            : addressLine // ignore: cast_nullable_to_non_nullable
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
class _$CheckoutAddressImpl implements _CheckoutAddress {
  const _$CheckoutAddressImpl({
    @JsonKey(fromJson: intFromJson) this.id = 0,
    @JsonKey(name: 'address_line') this.addressLine = '',
    this.pincode = '',
  });

  factory _$CheckoutAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutAddressImplFromJson(json);

  @override
  @JsonKey(fromJson: intFromJson)
  final int id;
  @override
  @JsonKey(name: 'address_line')
  final String addressLine;
  @override
  @JsonKey()
  final String pincode;

  @override
  String toString() {
    return 'CheckoutAddress(id: $id, addressLine: $addressLine, pincode: $pincode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addressLine, addressLine) ||
                other.addressLine == addressLine) &&
            (identical(other.pincode, pincode) || other.pincode == pincode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, addressLine, pincode);

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutAddressImplCopyWith<_$CheckoutAddressImpl> get copyWith =>
      __$$CheckoutAddressImplCopyWithImpl<_$CheckoutAddressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutAddressImplToJson(this);
  }
}

abstract class _CheckoutAddress implements CheckoutAddress {
  const factory _CheckoutAddress({
    @JsonKey(fromJson: intFromJson) final int id,
    @JsonKey(name: 'address_line') final String addressLine,
    final String pincode,
  }) = _$CheckoutAddressImpl;

  factory _CheckoutAddress.fromJson(Map<String, dynamic> json) =
      _$CheckoutAddressImpl.fromJson;

  @override
  @JsonKey(fromJson: intFromJson)
  int get id;
  @override
  @JsonKey(name: 'address_line')
  String get addressLine;
  @override
  String get pincode;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutAddressImplCopyWith<_$CheckoutAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutItem _$CheckoutItemFromJson(Map<String, dynamic> json) {
  return _CheckoutItem.fromJson(json);
}

/// @nodoc
mixin _$CheckoutItem {
  @JsonKey(name: 'product_id', fromJson: intFromJson)
  int get productId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;

  /// Serializes this CheckoutItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutItemCopyWith<CheckoutItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutItemCopyWith<$Res> {
  factory $CheckoutItemCopyWith(
    CheckoutItem value,
    $Res Function(CheckoutItem) then,
  ) = _$CheckoutItemCopyWithImpl<$Res, CheckoutItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'product_id', fromJson: intFromJson) int productId,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
  });
}

/// @nodoc
class _$CheckoutItemCopyWithImpl<$Res, $Val extends CheckoutItem>
    implements $CheckoutItemCopyWith<$Res> {
  _$CheckoutItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int,
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
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutItemImplCopyWith<$Res>
    implements $CheckoutItemCopyWith<$Res> {
  factory _$$CheckoutItemImplCopyWith(
    _$CheckoutItemImpl value,
    $Res Function(_$CheckoutItemImpl) then,
  ) = __$$CheckoutItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'product_id', fromJson: intFromJson) int productId,
    String name,
    @JsonKey(fromJson: doubleFromJson) double price,
    @JsonKey(fromJson: doubleFromJson) double quantity,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
  });
}

/// @nodoc
class __$$CheckoutItemImplCopyWithImpl<$Res>
    extends _$CheckoutItemCopyWithImpl<$Res, _$CheckoutItemImpl>
    implements _$$CheckoutItemImplCopyWith<$Res> {
  __$$CheckoutItemImplCopyWithImpl(
    _$CheckoutItemImpl _value,
    $Res Function(_$CheckoutItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(
      _$CheckoutItemImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int,
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
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CheckoutItemImpl implements _CheckoutItem {
  const _$CheckoutItemImpl({
    @JsonKey(name: 'product_id', fromJson: intFromJson) this.productId = 0,
    this.name = '',
    @JsonKey(fromJson: doubleFromJson) this.price = 0,
    @JsonKey(fromJson: doubleFromJson) this.quantity = 0,
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
  });

  factory _$CheckoutItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutItemImplFromJson(json);

  @override
  @JsonKey(name: 'product_id', fromJson: intFromJson)
  final int productId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double quantity;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;

  @override
  String toString() {
    return 'CheckoutItem(productId: $productId, name: $name, price: $price, quantity: $quantity, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, name, price, quantity, subtotal);

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutItemImplCopyWith<_$CheckoutItemImpl> get copyWith =>
      __$$CheckoutItemImplCopyWithImpl<_$CheckoutItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutItemImplToJson(this);
  }
}

abstract class _CheckoutItem implements CheckoutItem {
  const factory _CheckoutItem({
    @JsonKey(name: 'product_id', fromJson: intFromJson) final int productId,
    final String name,
    @JsonKey(fromJson: doubleFromJson) final double price,
    @JsonKey(fromJson: doubleFromJson) final double quantity,
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
  }) = _$CheckoutItemImpl;

  factory _CheckoutItem.fromJson(Map<String, dynamic> json) =
      _$CheckoutItemImpl.fromJson;

  @override
  @JsonKey(name: 'product_id', fromJson: intFromJson)
  int get productId;
  @override
  String get name;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get price;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get quantity;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;

  /// Create a copy of CheckoutItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutItemImplCopyWith<_$CheckoutItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) {
  return _CheckoutResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckoutResponse {
  List<CheckoutItem> get items => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get discount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;
  RewardWallet? get rewardWallet => throw _privateConstructorUsedError;
  CheckoutAddress? get address => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get eta => throw _privateConstructorUsedError;

  /// Serializes this CheckoutResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutResponseCopyWith<CheckoutResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutResponseCopyWith<$Res> {
  factory $CheckoutResponseCopyWith(
    CheckoutResponse value,
    $Res Function(CheckoutResponse) then,
  ) = _$CheckoutResponseCopyWithImpl<$Res, CheckoutResponse>;
  @useResult
  $Res call({
    List<CheckoutItem> items,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
    RewardWallet? rewardWallet,
    CheckoutAddress? address,
    String type,
    String eta,
  });

  $RewardWalletCopyWith<$Res>? get rewardWallet;
  $CheckoutAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$CheckoutResponseCopyWithImpl<$Res, $Val extends CheckoutResponse>
    implements $CheckoutResponseCopyWith<$Res> {
  _$CheckoutResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryCharge = null,
    Object? discount = null,
    Object? total = null,
    Object? rewardWallet = freezed,
    Object? address = freezed,
    Object? type = null,
    Object? eta = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CheckoutItem>,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            deliveryCharge: null == deliveryCharge
                ? _value.deliveryCharge
                : deliveryCharge // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            rewardWallet: freezed == rewardWallet
                ? _value.rewardWallet
                : rewardWallet // ignore: cast_nullable_to_non_nullable
                      as RewardWallet?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as CheckoutAddress?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            eta: null == eta
                ? _value.eta
                : eta // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RewardWalletCopyWith<$Res>? get rewardWallet {
    if (_value.rewardWallet == null) {
      return null;
    }

    return $RewardWalletCopyWith<$Res>(_value.rewardWallet!, (value) {
      return _then(_value.copyWith(rewardWallet: value) as $Val);
    });
  }

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $CheckoutAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutResponseImplCopyWith<$Res>
    implements $CheckoutResponseCopyWith<$Res> {
  factory _$$CheckoutResponseImplCopyWith(
    _$CheckoutResponseImpl value,
    $Res Function(_$CheckoutResponseImpl) then,
  ) = __$$CheckoutResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CheckoutItem> items,
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey(fromJson: doubleFromJson) double discount,
    @JsonKey(fromJson: doubleFromJson) double total,
    RewardWallet? rewardWallet,
    CheckoutAddress? address,
    String type,
    String eta,
  });

  @override
  $RewardWalletCopyWith<$Res>? get rewardWallet;
  @override
  $CheckoutAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$CheckoutResponseImplCopyWithImpl<$Res>
    extends _$CheckoutResponseCopyWithImpl<$Res, _$CheckoutResponseImpl>
    implements _$$CheckoutResponseImplCopyWith<$Res> {
  __$$CheckoutResponseImplCopyWithImpl(
    _$CheckoutResponseImpl _value,
    $Res Function(_$CheckoutResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? subtotal = null,
    Object? deliveryCharge = null,
    Object? discount = null,
    Object? total = null,
    Object? rewardWallet = freezed,
    Object? address = freezed,
    Object? type = null,
    Object? eta = null,
  }) {
    return _then(
      _$CheckoutResponseImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CheckoutItem>,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        deliveryCharge: null == deliveryCharge
            ? _value.deliveryCharge
            : deliveryCharge // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        rewardWallet: freezed == rewardWallet
            ? _value.rewardWallet
            : rewardWallet // ignore: cast_nullable_to_non_nullable
                  as RewardWallet?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as CheckoutAddress?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
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
class _$CheckoutResponseImpl implements _CheckoutResponse {
  const _$CheckoutResponseImpl({
    final List<CheckoutItem> items = const [],
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    this.deliveryCharge = 0,
    @JsonKey(fromJson: doubleFromJson) this.discount = 0,
    @JsonKey(fromJson: doubleFromJson) this.total = 0,
    this.rewardWallet,
    this.address,
    this.type = '',
    this.eta = '',
  }) : _items = items;

  factory _$CheckoutResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutResponseImplFromJson(json);

  final List<CheckoutItem> _items;
  @override
  @JsonKey()
  List<CheckoutItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  final double deliveryCharge;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;
  @override
  final RewardWallet? rewardWallet;
  @override
  final CheckoutAddress? address;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String eta;

  @override
  String toString() {
    return 'CheckoutResponse(items: $items, subtotal: $subtotal, deliveryCharge: $deliveryCharge, discount: $discount, total: $total, rewardWallet: $rewardWallet, address: $address, type: $type, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.rewardWallet, rewardWallet) ||
                other.rewardWallet == rewardWallet) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    subtotal,
    deliveryCharge,
    discount,
    total,
    rewardWallet,
    address,
    type,
    eta,
  );

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutResponseImplCopyWith<_$CheckoutResponseImpl> get copyWith =>
      __$$CheckoutResponseImplCopyWithImpl<_$CheckoutResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutResponseImplToJson(this);
  }
}

abstract class _CheckoutResponse implements CheckoutResponse {
  const factory _CheckoutResponse({
    final List<CheckoutItem> items,
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    final double deliveryCharge,
    @JsonKey(fromJson: doubleFromJson) final double discount,
    @JsonKey(fromJson: doubleFromJson) final double total,
    final RewardWallet? rewardWallet,
    final CheckoutAddress? address,
    final String type,
    final String eta,
  }) = _$CheckoutResponseImpl;

  factory _CheckoutResponse.fromJson(Map<String, dynamic> json) =
      _$CheckoutResponseImpl.fromJson;

  @override
  List<CheckoutItem> get items;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get discount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;
  @override
  RewardWallet? get rewardWallet;
  @override
  CheckoutAddress? get address;
  @override
  String get type;
  @override
  String get eta;

  /// Create a copy of CheckoutResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutResponseImplCopyWith<_$CheckoutResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRewardInfo _$PaymentRewardInfoFromJson(Map<String, dynamic> json) {
  return _PaymentRewardInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentRewardInfo {
  @JsonKey(fromJson: boolFromJson)
  bool get used => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  int get availableCoins => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  bool get canRedeem => throw _privateConstructorUsedError;
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  double get rewardDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
  int get rewardCoinsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
  int get rewardCoinsEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
  double get payableAmount => throw _privateConstructorUsedError;

  /// Serializes this PaymentRewardInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRewardInfoCopyWith<PaymentRewardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRewardInfoCopyWith<$Res> {
  factory $PaymentRewardInfoCopyWith(
    PaymentRewardInfo value,
    $Res Function(PaymentRewardInfo) then,
  ) = _$PaymentRewardInfoCopyWithImpl<$Res, PaymentRewardInfo>;
  @useResult
  $Res call({
    @JsonKey(fromJson: boolFromJson) bool used,
    @JsonKey(name: 'available_coins', fromJson: intFromJson) int availableCoins,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) bool canRedeem,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    double rewardDiscount,
    @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
    int rewardCoinsRedeemed,
    @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
    int rewardCoinsEarned,
    @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
    double payableAmount,
  });
}

/// @nodoc
class _$PaymentRewardInfoCopyWithImpl<$Res, $Val extends PaymentRewardInfo>
    implements $PaymentRewardInfoCopyWith<$Res> {
  _$PaymentRewardInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? availableCoins = null,
    Object? canRedeem = null,
    Object? rewardDiscount = null,
    Object? rewardCoinsRedeemed = null,
    Object? rewardCoinsEarned = null,
    Object? payableAmount = null,
  }) {
    return _then(
      _value.copyWith(
            used: null == used
                ? _value.used
                : used // ignore: cast_nullable_to_non_nullable
                      as bool,
            availableCoins: null == availableCoins
                ? _value.availableCoins
                : availableCoins // ignore: cast_nullable_to_non_nullable
                      as int,
            canRedeem: null == canRedeem
                ? _value.canRedeem
                : canRedeem // ignore: cast_nullable_to_non_nullable
                      as bool,
            rewardDiscount: null == rewardDiscount
                ? _value.rewardDiscount
                : rewardDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            rewardCoinsRedeemed: null == rewardCoinsRedeemed
                ? _value.rewardCoinsRedeemed
                : rewardCoinsRedeemed // ignore: cast_nullable_to_non_nullable
                      as int,
            rewardCoinsEarned: null == rewardCoinsEarned
                ? _value.rewardCoinsEarned
                : rewardCoinsEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            payableAmount: null == payableAmount
                ? _value.payableAmount
                : payableAmount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentRewardInfoImplCopyWith<$Res>
    implements $PaymentRewardInfoCopyWith<$Res> {
  factory _$$PaymentRewardInfoImplCopyWith(
    _$PaymentRewardInfoImpl value,
    $Res Function(_$PaymentRewardInfoImpl) then,
  ) = __$$PaymentRewardInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: boolFromJson) bool used,
    @JsonKey(name: 'available_coins', fromJson: intFromJson) int availableCoins,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) bool canRedeem,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    double rewardDiscount,
    @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
    int rewardCoinsRedeemed,
    @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
    int rewardCoinsEarned,
    @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
    double payableAmount,
  });
}

/// @nodoc
class __$$PaymentRewardInfoImplCopyWithImpl<$Res>
    extends _$PaymentRewardInfoCopyWithImpl<$Res, _$PaymentRewardInfoImpl>
    implements _$$PaymentRewardInfoImplCopyWith<$Res> {
  __$$PaymentRewardInfoImplCopyWithImpl(
    _$PaymentRewardInfoImpl _value,
    $Res Function(_$PaymentRewardInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentRewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? used = null,
    Object? availableCoins = null,
    Object? canRedeem = null,
    Object? rewardDiscount = null,
    Object? rewardCoinsRedeemed = null,
    Object? rewardCoinsEarned = null,
    Object? payableAmount = null,
  }) {
    return _then(
      _$PaymentRewardInfoImpl(
        used: null == used
            ? _value.used
            : used // ignore: cast_nullable_to_non_nullable
                  as bool,
        availableCoins: null == availableCoins
            ? _value.availableCoins
            : availableCoins // ignore: cast_nullable_to_non_nullable
                  as int,
        canRedeem: null == canRedeem
            ? _value.canRedeem
            : canRedeem // ignore: cast_nullable_to_non_nullable
                  as bool,
        rewardDiscount: null == rewardDiscount
            ? _value.rewardDiscount
            : rewardDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        rewardCoinsRedeemed: null == rewardCoinsRedeemed
            ? _value.rewardCoinsRedeemed
            : rewardCoinsRedeemed // ignore: cast_nullable_to_non_nullable
                  as int,
        rewardCoinsEarned: null == rewardCoinsEarned
            ? _value.rewardCoinsEarned
            : rewardCoinsEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        payableAmount: null == payableAmount
            ? _value.payableAmount
            : payableAmount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PaymentRewardInfoImpl implements _PaymentRewardInfo {
  const _$PaymentRewardInfoImpl({
    @JsonKey(fromJson: boolFromJson) this.used = false,
    @JsonKey(name: 'available_coins', fromJson: intFromJson)
    this.availableCoins = 0,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) this.canRedeem = false,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    this.rewardDiscount = 0,
    @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
    this.rewardCoinsRedeemed = 0,
    @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
    this.rewardCoinsEarned = 0,
    @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
    this.payableAmount = 0,
  });

  factory _$PaymentRewardInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRewardInfoImplFromJson(json);

  @override
  @JsonKey(fromJson: boolFromJson)
  final bool used;
  @override
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  final int availableCoins;
  @override
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  final bool canRedeem;
  @override
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  final double rewardDiscount;
  @override
  @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
  final int rewardCoinsRedeemed;
  @override
  @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
  final int rewardCoinsEarned;
  @override
  @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
  final double payableAmount;

  @override
  String toString() {
    return 'PaymentRewardInfo(used: $used, availableCoins: $availableCoins, canRedeem: $canRedeem, rewardDiscount: $rewardDiscount, rewardCoinsRedeemed: $rewardCoinsRedeemed, rewardCoinsEarned: $rewardCoinsEarned, payableAmount: $payableAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRewardInfoImpl &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.availableCoins, availableCoins) ||
                other.availableCoins == availableCoins) &&
            (identical(other.canRedeem, canRedeem) ||
                other.canRedeem == canRedeem) &&
            (identical(other.rewardDiscount, rewardDiscount) ||
                other.rewardDiscount == rewardDiscount) &&
            (identical(other.rewardCoinsRedeemed, rewardCoinsRedeemed) ||
                other.rewardCoinsRedeemed == rewardCoinsRedeemed) &&
            (identical(other.rewardCoinsEarned, rewardCoinsEarned) ||
                other.rewardCoinsEarned == rewardCoinsEarned) &&
            (identical(other.payableAmount, payableAmount) ||
                other.payableAmount == payableAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    used,
    availableCoins,
    canRedeem,
    rewardDiscount,
    rewardCoinsRedeemed,
    rewardCoinsEarned,
    payableAmount,
  );

  /// Create a copy of PaymentRewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRewardInfoImplCopyWith<_$PaymentRewardInfoImpl> get copyWith =>
      __$$PaymentRewardInfoImplCopyWithImpl<_$PaymentRewardInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRewardInfoImplToJson(this);
  }
}

abstract class _PaymentRewardInfo implements PaymentRewardInfo {
  const factory _PaymentRewardInfo({
    @JsonKey(fromJson: boolFromJson) final bool used,
    @JsonKey(name: 'available_coins', fromJson: intFromJson)
    final int availableCoins,
    @JsonKey(name: 'can_redeem', fromJson: boolFromJson) final bool canRedeem,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    final double rewardDiscount,
    @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
    final int rewardCoinsRedeemed,
    @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
    final int rewardCoinsEarned,
    @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
    final double payableAmount,
  }) = _$PaymentRewardInfoImpl;

  factory _PaymentRewardInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentRewardInfoImpl.fromJson;

  @override
  @JsonKey(fromJson: boolFromJson)
  bool get used;
  @override
  @JsonKey(name: 'available_coins', fromJson: intFromJson)
  int get availableCoins;
  @override
  @JsonKey(name: 'can_redeem', fromJson: boolFromJson)
  bool get canRedeem;
  @override
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  double get rewardDiscount;
  @override
  @JsonKey(name: 'reward_coins_redeemed', fromJson: intFromJson)
  int get rewardCoinsRedeemed;
  @override
  @JsonKey(name: 'reward_coins_earned', fromJson: intFromJson)
  int get rewardCoinsEarned;
  @override
  @JsonKey(name: 'payable_amount', fromJson: doubleFromJson)
  double get payableAmount;

  /// Create a copy of PaymentRewardInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRewardInfoImplCopyWith<_$PaymentRewardInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentCustomer _$PaymentCustomerFromJson(Map<String, dynamic> json) {
  return _PaymentCustomer.fromJson(json);
}

/// @nodoc
mixin _$PaymentCustomer {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;

  /// Serializes this PaymentCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCustomerCopyWith<PaymentCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCustomerCopyWith<$Res> {
  factory $PaymentCustomerCopyWith(
    PaymentCustomer value,
    $Res Function(PaymentCustomer) then,
  ) = _$PaymentCustomerCopyWithImpl<$Res, PaymentCustomer>;
  @useResult
  $Res call({String name, String email, String contact});
}

/// @nodoc
class _$PaymentCustomerCopyWithImpl<$Res, $Val extends PaymentCustomer>
    implements $PaymentCustomerCopyWith<$Res> {
  _$PaymentCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? contact = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            contact: null == contact
                ? _value.contact
                : contact // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentCustomerImplCopyWith<$Res>
    implements $PaymentCustomerCopyWith<$Res> {
  factory _$$PaymentCustomerImplCopyWith(
    _$PaymentCustomerImpl value,
    $Res Function(_$PaymentCustomerImpl) then,
  ) = __$$PaymentCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String contact});
}

/// @nodoc
class __$$PaymentCustomerImplCopyWithImpl<$Res>
    extends _$PaymentCustomerCopyWithImpl<$Res, _$PaymentCustomerImpl>
    implements _$$PaymentCustomerImplCopyWith<$Res> {
  __$$PaymentCustomerImplCopyWithImpl(
    _$PaymentCustomerImpl _value,
    $Res Function(_$PaymentCustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? contact = null,
  }) {
    return _then(
      _$PaymentCustomerImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        contact: null == contact
            ? _value.contact
            : contact // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PaymentCustomerImpl implements _PaymentCustomer {
  const _$PaymentCustomerImpl({
    this.name = '',
    this.email = '',
    this.contact = '',
  });

  factory _$PaymentCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCustomerImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String contact;

  @override
  String toString() {
    return 'PaymentCustomer(name: $name, email: $email, contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCustomerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, contact);

  /// Create a copy of PaymentCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCustomerImplCopyWith<_$PaymentCustomerImpl> get copyWith =>
      __$$PaymentCustomerImplCopyWithImpl<_$PaymentCustomerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCustomerImplToJson(this);
  }
}

abstract class _PaymentCustomer implements PaymentCustomer {
  const factory _PaymentCustomer({
    final String name,
    final String email,
    final String contact,
  }) = _$PaymentCustomerImpl;

  factory _PaymentCustomer.fromJson(Map<String, dynamic> json) =
      _$PaymentCustomerImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get contact;

  /// Create a copy of PaymentCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCustomerImplCopyWith<_$PaymentCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentSummary _$PaymentSummaryFromJson(Map<String, dynamic> json) {
  return _PaymentSummary.fromJson(json);
}

/// @nodoc
mixin _$PaymentSummary {
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  double get rewardDiscount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: doubleFromJson)
  double get total => throw _privateConstructorUsedError;

  /// Serializes this PaymentSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentSummaryCopyWith<PaymentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryCopyWith<$Res> {
  factory $PaymentSummaryCopyWith(
    PaymentSummary value,
    $Res Function(PaymentSummary) then,
  ) = _$PaymentSummaryCopyWithImpl<$Res, PaymentSummary>;
  @useResult
  $Res call({
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    double rewardDiscount,
    @JsonKey(fromJson: doubleFromJson) double total,
  });
}

/// @nodoc
class _$PaymentSummaryCopyWithImpl<$Res, $Val extends PaymentSummary>
    implements $PaymentSummaryCopyWith<$Res> {
  _$PaymentSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryCharge = null,
    Object? rewardDiscount = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            deliveryCharge: null == deliveryCharge
                ? _value.deliveryCharge
                : deliveryCharge // ignore: cast_nullable_to_non_nullable
                      as double,
            rewardDiscount: null == rewardDiscount
                ? _value.rewardDiscount
                : rewardDiscount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PaymentSummaryImplCopyWith<$Res>
    implements $PaymentSummaryCopyWith<$Res> {
  factory _$$PaymentSummaryImplCopyWith(
    _$PaymentSummaryImpl value,
    $Res Function(_$PaymentSummaryImpl) then,
  ) = __$$PaymentSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: doubleFromJson) double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    double deliveryCharge,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    double rewardDiscount,
    @JsonKey(fromJson: doubleFromJson) double total,
  });
}

/// @nodoc
class __$$PaymentSummaryImplCopyWithImpl<$Res>
    extends _$PaymentSummaryCopyWithImpl<$Res, _$PaymentSummaryImpl>
    implements _$$PaymentSummaryImplCopyWith<$Res> {
  __$$PaymentSummaryImplCopyWithImpl(
    _$PaymentSummaryImpl _value,
    $Res Function(_$PaymentSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? deliveryCharge = null,
    Object? rewardDiscount = null,
    Object? total = null,
  }) {
    return _then(
      _$PaymentSummaryImpl(
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        deliveryCharge: null == deliveryCharge
            ? _value.deliveryCharge
            : deliveryCharge // ignore: cast_nullable_to_non_nullable
                  as double,
        rewardDiscount: null == rewardDiscount
            ? _value.rewardDiscount
            : rewardDiscount // ignore: cast_nullable_to_non_nullable
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
class _$PaymentSummaryImpl implements _PaymentSummary {
  const _$PaymentSummaryImpl({
    @JsonKey(fromJson: doubleFromJson) this.subtotal = 0,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    this.deliveryCharge = 0,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    this.rewardDiscount = 0,
    @JsonKey(fromJson: doubleFromJson) this.total = 0,
  });

  factory _$PaymentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSummaryImplFromJson(json);

  @override
  @JsonKey(fromJson: doubleFromJson)
  final double subtotal;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  final double deliveryCharge;
  @override
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  final double rewardDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  final double total;

  @override
  String toString() {
    return 'PaymentSummary(subtotal: $subtotal, deliveryCharge: $deliveryCharge, rewardDiscount: $rewardDiscount, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.rewardDiscount, rewardDiscount) ||
                other.rewardDiscount == rewardDiscount) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subtotal, deliveryCharge, rewardDiscount, total);

  /// Create a copy of PaymentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryImplCopyWith<_$PaymentSummaryImpl> get copyWith =>
      __$$PaymentSummaryImplCopyWithImpl<_$PaymentSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSummaryImplToJson(this);
  }
}

abstract class _PaymentSummary implements PaymentSummary {
  const factory _PaymentSummary({
    @JsonKey(fromJson: doubleFromJson) final double subtotal,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    final double deliveryCharge,
    @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
    final double rewardDiscount,
    @JsonKey(fromJson: doubleFromJson) final double total,
  }) = _$PaymentSummaryImpl;

  factory _PaymentSummary.fromJson(Map<String, dynamic> json) =
      _$PaymentSummaryImpl.fromJson;

  @override
  @JsonKey(fromJson: doubleFromJson)
  double get subtotal;
  @override
  @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
  double get deliveryCharge;
  @override
  @JsonKey(name: 'reward_discount', fromJson: doubleFromJson)
  double get rewardDiscount;
  @override
  @JsonKey(fromJson: doubleFromJson)
  double get total;

  /// Create a copy of PaymentSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSummaryImplCopyWith<_$PaymentSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePaymentResponse _$CreatePaymentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreatePaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentResponse {
  @JsonKey(fromJson: boolFromJson)
  bool get success => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_order_id')
  String get razorpayOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_link')
  String get paymentLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_link_id')
  String get paymentLinkId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intFromJson)
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  PaymentRewardInfo? get reward => throw _privateConstructorUsedError;
  PaymentCustomer? get customer => throw _privateConstructorUsedError;
  PaymentSummary? get summary => throw _privateConstructorUsedError;

  /// Serializes this CreatePaymentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePaymentResponseCopyWith<CreatePaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentResponseCopyWith<$Res> {
  factory $CreatePaymentResponseCopyWith(
    CreatePaymentResponse value,
    $Res Function(CreatePaymentResponse) then,
  ) = _$CreatePaymentResponseCopyWithImpl<$Res, CreatePaymentResponse>;
  @useResult
  $Res call({
    @JsonKey(fromJson: boolFromJson) bool success,
    String key,
    @JsonKey(name: 'razorpay_order_id') String razorpayOrderId,
    @JsonKey(name: 'payment_link') String paymentLink,
    @JsonKey(name: 'payment_link_id') String paymentLinkId,
    @JsonKey(fromJson: intFromJson) int amount,
    String currency,
    String type,
    PaymentRewardInfo? reward,
    PaymentCustomer? customer,
    PaymentSummary? summary,
  });

  $PaymentRewardInfoCopyWith<$Res>? get reward;
  $PaymentCustomerCopyWith<$Res>? get customer;
  $PaymentSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$CreatePaymentResponseCopyWithImpl<
  $Res,
  $Val extends CreatePaymentResponse
>
    implements $CreatePaymentResponseCopyWith<$Res> {
  _$CreatePaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? key = null,
    Object? razorpayOrderId = null,
    Object? paymentLink = null,
    Object? paymentLinkId = null,
    Object? amount = null,
    Object? currency = null,
    Object? type = null,
    Object? reward = freezed,
    Object? customer = freezed,
    Object? summary = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String,
            razorpayOrderId: null == razorpayOrderId
                ? _value.razorpayOrderId
                : razorpayOrderId // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentLink: null == paymentLink
                ? _value.paymentLink
                : paymentLink // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentLinkId: null == paymentLinkId
                ? _value.paymentLinkId
                : paymentLinkId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            reward: freezed == reward
                ? _value.reward
                : reward // ignore: cast_nullable_to_non_nullable
                      as PaymentRewardInfo?,
            customer: freezed == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as PaymentCustomer?,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as PaymentSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRewardInfoCopyWith<$Res>? get reward {
    if (_value.reward == null) {
      return null;
    }

    return $PaymentRewardInfoCopyWith<$Res>(_value.reward!, (value) {
      return _then(_value.copyWith(reward: value) as $Val);
    });
  }

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $PaymentCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $PaymentSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePaymentResponseImplCopyWith<$Res>
    implements $CreatePaymentResponseCopyWith<$Res> {
  factory _$$CreatePaymentResponseImplCopyWith(
    _$CreatePaymentResponseImpl value,
    $Res Function(_$CreatePaymentResponseImpl) then,
  ) = __$$CreatePaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: boolFromJson) bool success,
    String key,
    @JsonKey(name: 'razorpay_order_id') String razorpayOrderId,
    @JsonKey(name: 'payment_link') String paymentLink,
    @JsonKey(name: 'payment_link_id') String paymentLinkId,
    @JsonKey(fromJson: intFromJson) int amount,
    String currency,
    String type,
    PaymentRewardInfo? reward,
    PaymentCustomer? customer,
    PaymentSummary? summary,
  });

  @override
  $PaymentRewardInfoCopyWith<$Res>? get reward;
  @override
  $PaymentCustomerCopyWith<$Res>? get customer;
  @override
  $PaymentSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$CreatePaymentResponseImplCopyWithImpl<$Res>
    extends
        _$CreatePaymentResponseCopyWithImpl<$Res, _$CreatePaymentResponseImpl>
    implements _$$CreatePaymentResponseImplCopyWith<$Res> {
  __$$CreatePaymentResponseImplCopyWithImpl(
    _$CreatePaymentResponseImpl _value,
    $Res Function(_$CreatePaymentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? key = null,
    Object? razorpayOrderId = null,
    Object? paymentLink = null,
    Object? paymentLinkId = null,
    Object? amount = null,
    Object? currency = null,
    Object? type = null,
    Object? reward = freezed,
    Object? customer = freezed,
    Object? summary = freezed,
  }) {
    return _then(
      _$CreatePaymentResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        razorpayOrderId: null == razorpayOrderId
            ? _value.razorpayOrderId
            : razorpayOrderId // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentLink: null == paymentLink
            ? _value.paymentLink
            : paymentLink // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentLinkId: null == paymentLinkId
            ? _value.paymentLinkId
            : paymentLinkId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        reward: freezed == reward
            ? _value.reward
            : reward // ignore: cast_nullable_to_non_nullable
                  as PaymentRewardInfo?,
        customer: freezed == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as PaymentCustomer?,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as PaymentSummary?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CreatePaymentResponseImpl implements _CreatePaymentResponse {
  const _$CreatePaymentResponseImpl({
    @JsonKey(fromJson: boolFromJson) this.success = false,
    this.key = '',
    @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId = '',
    @JsonKey(name: 'payment_link') this.paymentLink = '',
    @JsonKey(name: 'payment_link_id') this.paymentLinkId = '',
    @JsonKey(fromJson: intFromJson) this.amount = 0,
    this.currency = 'INR',
    this.type = '',
    this.reward,
    this.customer,
    this.summary,
  });

  factory _$CreatePaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePaymentResponseImplFromJson(json);

  @override
  @JsonKey(fromJson: boolFromJson)
  final bool success;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey(name: 'razorpay_order_id')
  final String razorpayOrderId;
  @override
  @JsonKey(name: 'payment_link')
  final String paymentLink;
  @override
  @JsonKey(name: 'payment_link_id')
  final String paymentLinkId;
  @override
  @JsonKey(fromJson: intFromJson)
  final int amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String type;
  @override
  final PaymentRewardInfo? reward;
  @override
  final PaymentCustomer? customer;
  @override
  final PaymentSummary? summary;

  @override
  String toString() {
    return 'CreatePaymentResponse(success: $success, key: $key, razorpayOrderId: $razorpayOrderId, paymentLink: $paymentLink, paymentLinkId: $paymentLinkId, amount: $amount, currency: $currency, type: $type, reward: $reward, customer: $customer, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePaymentResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink) &&
            (identical(other.paymentLinkId, paymentLinkId) ||
                other.paymentLinkId == paymentLinkId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    key,
    razorpayOrderId,
    paymentLink,
    paymentLinkId,
    amount,
    currency,
    type,
    reward,
    customer,
    summary,
  );

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePaymentResponseImplCopyWith<_$CreatePaymentResponseImpl>
  get copyWith =>
      __$$CreatePaymentResponseImplCopyWithImpl<_$CreatePaymentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePaymentResponseImplToJson(this);
  }
}

abstract class _CreatePaymentResponse implements CreatePaymentResponse {
  const factory _CreatePaymentResponse({
    @JsonKey(fromJson: boolFromJson) final bool success,
    final String key,
    @JsonKey(name: 'razorpay_order_id') final String razorpayOrderId,
    @JsonKey(name: 'payment_link') final String paymentLink,
    @JsonKey(name: 'payment_link_id') final String paymentLinkId,
    @JsonKey(fromJson: intFromJson) final int amount,
    final String currency,
    final String type,
    final PaymentRewardInfo? reward,
    final PaymentCustomer? customer,
    final PaymentSummary? summary,
  }) = _$CreatePaymentResponseImpl;

  factory _CreatePaymentResponse.fromJson(Map<String, dynamic> json) =
      _$CreatePaymentResponseImpl.fromJson;

  @override
  @JsonKey(fromJson: boolFromJson)
  bool get success;
  @override
  String get key;
  @override
  @JsonKey(name: 'razorpay_order_id')
  String get razorpayOrderId;
  @override
  @JsonKey(name: 'payment_link')
  String get paymentLink;
  @override
  @JsonKey(name: 'payment_link_id')
  String get paymentLinkId;
  @override
  @JsonKey(fromJson: intFromJson)
  int get amount;
  @override
  String get currency;
  @override
  String get type;
  @override
  PaymentRewardInfo? get reward;
  @override
  PaymentCustomer? get customer;
  @override
  PaymentSummary? get summary;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePaymentResponseImplCopyWith<_$CreatePaymentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'payment_method') String paymentMethod,
    String message,
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
    Object? paymentMethod = null,
    Object? message = null,
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
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
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
    @JsonKey(name: 'payment_method') String paymentMethod,
    String message,
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
    Object? paymentMethod = null,
    Object? message = null,
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
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PlaceOrderResponseImpl implements _PlaceOrderResponse {
  const _$PlaceOrderResponseImpl({
    @JsonKey(name: 'order_id', fromJson: stringFromJson) this.orderId = '',
    @JsonKey(name: 'order_number') this.orderNumber = '',
    this.status = '',
    @JsonKey(name: 'tracking_url') this.trackingUrl = '',
    @JsonKey(name: 'dispatch_date') this.dispatchDate = '',
    @JsonKey() this.notes = '',
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    this.deliveryCharge = 0,
    @JsonKey(fromJson: doubleFromJson) this.total = 0,
    @JsonKey(fromJson: doubleFromJson) this.discount = 0,
    @JsonKey(fromJson: dynamicListFromJson)
    final List<dynamic> discounts = const [],
    @JsonKey(name: 'loyalty_applied') this.loyaltyApplied = false,
    this.eta = '',
    @JsonKey(name: 'payment_method') this.paymentMethod = '',
    this.message = '',
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
  @JsonKey()
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
  @JsonKey()
  final String eta;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PlaceOrderResponse(orderId: $orderId, orderNumber: $orderNumber, status: $status, trackingUrl: $trackingUrl, dispatchDate: $dispatchDate, notes: $notes, deliveryCharge: $deliveryCharge, total: $total, discount: $discount, discounts: $discounts, loyaltyApplied: $loyaltyApplied, eta: $eta, paymentMethod: $paymentMethod, message: $message)';
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
            (identical(other.eta, eta) || other.eta == eta) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.message, message) || other.message == message));
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
    paymentMethod,
    message,
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
    @JsonKey(name: 'order_id', fromJson: stringFromJson) final String orderId,
    @JsonKey(name: 'order_number') final String orderNumber,
    final String status,
    @JsonKey(name: 'tracking_url') final String trackingUrl,
    @JsonKey(name: 'dispatch_date') final String dispatchDate,
    @JsonKey() final String notes,
    @JsonKey(name: 'delivery_charge', fromJson: doubleFromJson)
    final double deliveryCharge,
    @JsonKey(fromJson: doubleFromJson) final double total,
    @JsonKey(fromJson: doubleFromJson) final double discount,
    @JsonKey(fromJson: dynamicListFromJson) final List<dynamic> discounts,
    @JsonKey(name: 'loyalty_applied') final bool loyaltyApplied,
    final String eta,
    @JsonKey(name: 'payment_method') final String paymentMethod,
    final String message,
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
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  String get message;

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
