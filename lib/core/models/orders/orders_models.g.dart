// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListItemImpl _$$OrderListItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderListItemImpl(
      id: stringFromJson(json['id']),
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      orderType: json['order_type'] as String? ?? '',
      date: json['created_at'] as String? ?? '',
      dispatchDate: json['dispatch_date'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
      discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
      total: doubleFromJson(json['total']),
    );

Map<String, dynamic> _$$OrderListItemImplToJson(_$OrderListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'order_type': instance.orderType,
      'created_at': instance.date,
      'dispatch_date': instance.dispatchDate,
      'notes': instance.notes,
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'total': instance.total,
    };

_$OrdersListResponseImpl _$$OrdersListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrdersListResponseImpl(
  orders: (json['orders'] as List<dynamic>)
      .map((e) => OrderListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: json['total_count'] == null
      ? 0
      : intFromJson(json['total_count']),
  currentPage: json['current_page'] == null
      ? 1
      : intFromJson(json['current_page']),
  lastPage: json['last_page'] == null ? 1 : intFromJson(json['last_page']),
);

Map<String, dynamic> _$$OrdersListResponseImplToJson(
  _$OrdersListResponseImpl instance,
) => <String, dynamic>{
  'orders': instance.orders,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
};

_$RewardWalletImpl _$$RewardWalletImplFromJson(Map<String, dynamic> json) =>
    _$RewardWalletImpl(
      availableCoins: json['available_coins'] == null
          ? 0
          : intFromJson(json['available_coins']),
      minimumRequired: json['minimum_required'] == null
          ? 0
          : intFromJson(json['minimum_required']),
      canRedeem: json['can_redeem'] == null
          ? false
          : boolFromJson(json['can_redeem']),
      maximumDiscount: json['maximum_discount'] == null
          ? 0
          : doubleFromJson(json['maximum_discount']),
      coinValue: json['coin_value'] == null
          ? 1
          : doubleFromJson(json['coin_value']),
      coinsToBeEarned: json['coins_to_be_earned'] == null
          ? 0
          : intFromJson(json['coins_to_be_earned']),
      payableAfterRedeeming: json['payable_after_redeeming'] == null
          ? 0
          : doubleFromJson(json['payable_after_redeeming']),
    );

Map<String, dynamic> _$$RewardWalletImplToJson(_$RewardWalletImpl instance) =>
    <String, dynamic>{
      'available_coins': instance.availableCoins,
      'minimum_required': instance.minimumRequired,
      'can_redeem': instance.canRedeem,
      'maximum_discount': instance.maximumDiscount,
      'coin_value': instance.coinValue,
      'coins_to_be_earned': instance.coinsToBeEarned,
      'payable_after_redeeming': instance.payableAfterRedeeming,
    };

_$CheckoutAddressImpl _$$CheckoutAddressImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutAddressImpl(
  id: json['id'] == null ? 0 : intFromJson(json['id']),
  addressLine: json['address_line'] as String? ?? '',
  pincode: json['pincode'] as String? ?? '',
);

Map<String, dynamic> _$$CheckoutAddressImplToJson(
  _$CheckoutAddressImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'address_line': instance.addressLine,
  'pincode': instance.pincode,
};

_$CheckoutItemImpl _$$CheckoutItemImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutItemImpl(
      productId: json['product_id'] == null
          ? 0
          : intFromJson(json['product_id']),
      name: json['name'] as String? ?? '',
      price: json['price'] == null ? 0 : doubleFromJson(json['price']),
      quantity: json['quantity'] == null ? 0 : doubleFromJson(json['quantity']),
      subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
    );

Map<String, dynamic> _$$CheckoutItemImplToJson(_$CheckoutItemImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
    };

_$CheckoutResponseImpl _$$CheckoutResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutResponseImpl(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CheckoutItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
  deliveryCharge: json['delivery_charge'] == null
      ? 0
      : doubleFromJson(json['delivery_charge']),
  discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
  total: json['total'] == null ? 0 : doubleFromJson(json['total']),
  rewardWallet: json['reward_wallet'] == null
      ? null
      : RewardWallet.fromJson(json['reward_wallet'] as Map<String, dynamic>),
  address: json['address'] == null
      ? null
      : CheckoutAddress.fromJson(json['address'] as Map<String, dynamic>),
  type: json['type'] as String? ?? '',
  eta: json['eta'] as String? ?? '',
);

Map<String, dynamic> _$$CheckoutResponseImplToJson(
  _$CheckoutResponseImpl instance,
) => <String, dynamic>{
  'items': instance.items,
  'subtotal': instance.subtotal,
  'delivery_charge': instance.deliveryCharge,
  'discount': instance.discount,
  'total': instance.total,
  'reward_wallet': instance.rewardWallet,
  'address': instance.address,
  'type': instance.type,
  'eta': instance.eta,
};

_$PaymentRewardInfoImpl _$$PaymentRewardInfoImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentRewardInfoImpl(
  used: json['used'] == null ? false : boolFromJson(json['used']),
  availableCoins: json['available_coins'] == null
      ? 0
      : intFromJson(json['available_coins']),
  canRedeem: json['can_redeem'] == null
      ? false
      : boolFromJson(json['can_redeem']),
  rewardDiscount: json['reward_discount'] == null
      ? 0
      : doubleFromJson(json['reward_discount']),
  rewardCoinsRedeemed: json['reward_coins_redeemed'] == null
      ? 0
      : intFromJson(json['reward_coins_redeemed']),
  rewardCoinsEarned: json['reward_coins_earned'] == null
      ? 0
      : intFromJson(json['reward_coins_earned']),
  payableAmount: json['payable_amount'] == null
      ? 0
      : doubleFromJson(json['payable_amount']),
);

Map<String, dynamic> _$$PaymentRewardInfoImplToJson(
  _$PaymentRewardInfoImpl instance,
) => <String, dynamic>{
  'used': instance.used,
  'available_coins': instance.availableCoins,
  'can_redeem': instance.canRedeem,
  'reward_discount': instance.rewardDiscount,
  'reward_coins_redeemed': instance.rewardCoinsRedeemed,
  'reward_coins_earned': instance.rewardCoinsEarned,
  'payable_amount': instance.payableAmount,
};

_$PaymentCustomerImpl _$$PaymentCustomerImplFromJson(
  Map<String, dynamic> json,
) => _$PaymentCustomerImpl(
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  contact: json['contact'] as String? ?? '',
);

Map<String, dynamic> _$$PaymentCustomerImplToJson(
  _$PaymentCustomerImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'contact': instance.contact,
};

_$PaymentSummaryImpl _$$PaymentSummaryImplFromJson(Map<String, dynamic> json) =>
    _$PaymentSummaryImpl(
      subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
      deliveryCharge: json['delivery_charge'] == null
          ? 0
          : doubleFromJson(json['delivery_charge']),
      rewardDiscount: json['reward_discount'] == null
          ? 0
          : doubleFromJson(json['reward_discount']),
      total: json['total'] == null ? 0 : doubleFromJson(json['total']),
    );

Map<String, dynamic> _$$PaymentSummaryImplToJson(
  _$PaymentSummaryImpl instance,
) => <String, dynamic>{
  'subtotal': instance.subtotal,
  'delivery_charge': instance.deliveryCharge,
  'reward_discount': instance.rewardDiscount,
  'total': instance.total,
};

_$CreatePaymentResponseImpl _$$CreatePaymentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreatePaymentResponseImpl(
  success: json['success'] == null ? false : boolFromJson(json['success']),
  key: json['key'] as String? ?? '',
  razorpayOrderId: json['razorpay_order_id'] as String? ?? '',
  paymentLink: json['payment_link'] as String? ?? '',
  paymentLinkId: json['payment_link_id'] as String? ?? '',
  amount: json['amount'] == null ? 0 : intFromJson(json['amount']),
  currency: json['currency'] as String? ?? 'INR',
  type: json['type'] as String? ?? '',
  reward: json['reward'] == null
      ? null
      : PaymentRewardInfo.fromJson(json['reward'] as Map<String, dynamic>),
  customer: json['customer'] == null
      ? null
      : PaymentCustomer.fromJson(json['customer'] as Map<String, dynamic>),
  summary: json['summary'] == null
      ? null
      : PaymentSummary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CreatePaymentResponseImplToJson(
  _$CreatePaymentResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'key': instance.key,
  'razorpay_order_id': instance.razorpayOrderId,
  'payment_link': instance.paymentLink,
  'payment_link_id': instance.paymentLinkId,
  'amount': instance.amount,
  'currency': instance.currency,
  'type': instance.type,
  'reward': instance.reward,
  'customer': instance.customer,
  'summary': instance.summary,
};

_$PlaceOrderResponseImpl _$$PlaceOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceOrderResponseImpl(
  orderId: json['order_id'] == null ? '' : stringFromJson(json['order_id']),
  orderNumber: json['order_number'] as String? ?? '',
  status: json['status'] as String? ?? '',
  trackingUrl: json['tracking_url'] as String? ?? '',
  dispatchDate: json['dispatch_date'] as String? ?? '',
  notes: json['notes'] as String? ?? '',
  deliveryCharge: json['delivery_charge'] == null
      ? 0
      : doubleFromJson(json['delivery_charge']),
  total: json['total'] == null ? 0 : doubleFromJson(json['total']),
  discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
  discounts: json['discounts'] == null
      ? const []
      : dynamicListFromJson(json['discounts']),
  loyaltyApplied: json['loyalty_applied'] as bool? ?? false,
  eta: json['eta'] as String? ?? '',
  paymentMethod: json['payment_method'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$$PlaceOrderResponseImplToJson(
  _$PlaceOrderResponseImpl instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'tracking_url': instance.trackingUrl,
  'dispatch_date': instance.dispatchDate,
  'notes': instance.notes,
  'delivery_charge': instance.deliveryCharge,
  'total': instance.total,
  'discount': instance.discount,
  'discounts': instance.discounts,
  'loyalty_applied': instance.loyaltyApplied,
  'eta': instance.eta,
  'payment_method': instance.paymentMethod,
  'message': instance.message,
};

_$OrderTrackResponseImpl _$$OrderTrackResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderTrackResponseImpl(
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  eta: json['eta'] as String? ?? '',
);

Map<String, dynamic> _$$OrderTrackResponseImplToJson(
  _$OrderTrackResponseImpl instance,
) => <String, dynamic>{
  'order_number': instance.orderNumber,
  'status': instance.status,
  'eta': instance.eta,
};

_$CancelOrderResponseImpl _$$CancelOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CancelOrderResponseImpl(message: json['message'] as String);

Map<String, dynamic> _$$CancelOrderResponseImplToJson(
  _$CancelOrderResponseImpl instance,
) => <String, dynamic>{'message': instance.message};

_$OrderDetailItemImpl _$$OrderDetailItemImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailItemImpl(
  productId: json['product_id'] == null
      ? ''
      : stringFromJson(json['product_id']),
  nameMl: json['name_ml'] as String? ?? '',
  name: json['name'] as String? ?? '',
  quantity: json['quantity'] == null ? 1 : doubleFromJson(json['quantity']),
  unit: json['unit'] as String? ?? '',
  price: json['price'] == null ? 0 : doubleFromJson(json['price']),
  subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
  imageUrl: json['image_url'] == null ? '' : stringFromJson(json['image_url']),
  isPreorder: json['is_preorder'] == null
      ? false
      : boolFromJson(json['is_preorder']),
);

Map<String, dynamic> _$$OrderDetailItemImplToJson(
  _$OrderDetailItemImpl instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'name_ml': instance.nameMl,
  'name': instance.name,
  'quantity': instance.quantity,
  'unit': instance.unit,
  'price': instance.price,
  'subtotal': instance.subtotal,
  'image_url': instance.imageUrl,
  'is_preorder': instance.isPreorder,
};

_$OrderDetailResponseImpl _$$OrderDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailResponseImpl(
  id: stringFromJson(json['id']),
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  orderType: json['order_type'] as String? ?? '',
  date: json['created_at'] as String? ?? '',
  subtotal: json['subtotal'] == null ? 0 : doubleFromJson(json['subtotal']),
  discount: json['discount'] == null ? 0 : doubleFromJson(json['discount']),
  total: doubleFromJson(json['total']),
  deliveryCharge: json['delivery_charge'] == null
      ? 0
      : doubleFromJson(json['delivery_charge']),
  notes: json['notes'] as String? ?? '',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderDetailItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  historyItems:
      (json['order_history'] as List<dynamic>?)
          ?.map((e) => OrderDetailItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OrderDetailResponseImplToJson(
  _$OrderDetailResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'order_type': instance.orderType,
  'created_at': instance.date,
  'subtotal': instance.subtotal,
  'discount': instance.discount,
  'total': instance.total,
  'delivery_charge': instance.deliveryCharge,
  'notes': instance.notes,
  'items': instance.items,
  'order_history': instance.historyItems,
};
