/// Loose JSON parsers for all API models — tolerate missing keys and type mismatches.
library;

import 'auth/auth_user.dart';
import 'auth/msg91_info.dart';
import 'auth/send_otp_response.dart';
import 'auth/verify_otp_response.dart';
import 'catalog/banner_item.dart';
import 'catalog/category_item.dart';
import 'catalog/json_converters.dart';
import 'commerce/cart_dtos.dart';
import 'commerce/favorites_dtos.dart';
import 'location/area_item.dart';
import 'location/zone_item.dart';
import 'orders/orders_models.dart';
import 'user/user_address_models.dart';
import 'user/user_details_models.dart';

// ─── Catalog ─────────────────────────────────────────────────────────────────

BannerItem bannerItemFromJsonLoose(Map<String, dynamic> json) => BannerItem(
      id: stringFromJson(json['id']),
      title: stringFromJson(json['title']),
      imageUrl: stringFromJson(json['image_url'] ?? json['imageUrl']),
      description: json['description']?.toString(),
    );

BannerListResponse bannerListResponseFromJsonLoose(Map<String, dynamic> json) =>
    BannerListResponse(
      banners: parseListLoose(
        json,
        listKey: 'banners',
        parse: bannerItemFromJsonLoose,
        keep: (b) => b.id.isNotEmpty,
      ),
    );

CategoryItem categoryItemFromJsonLoose(Map<String, dynamic> json) => CategoryItem(
      id: stringFromJson(json['id']),
      nameMl: stringFromJson(json['name_ml'] ?? json['nameMl']),
      name: stringFromJson(json['name']),
      imageUrl: json['image_url']?.toString() ?? json['imageUrl']?.toString(),
    );

CategoryListResponse categoryListResponseFromJsonLoose(
  Map<String, dynamic> json,
) =>
    CategoryListResponse(
      categories: parseListLoose(
        json,
        listKey: 'categories',
        parse: categoryItemFromJsonLoose,
        keep: (c) => c.id.isNotEmpty,
      ),
    );

// ─── Location ────────────────────────────────────────────────────────────────

ZoneItem zoneItemFromJsonLoose(Map<String, dynamic> json) => ZoneItem(
      id: stringFromJson(json['id']),
      name: stringFromJson(json['name']),
    );

AreaItem areaItemFromJsonLoose(Map<String, dynamic> json) => AreaItem(
      id: stringFromJson(json['id']),
      name: stringFromJson(json['name']),
    );

List<ZoneItem> zonesFromJsonLoose(Map<String, dynamic> json) => parseListLoose(
      json,
      listKey: 'zones',
      parse: zoneItemFromJsonLoose,
      keep: (z) => z.id.isNotEmpty,
    );

List<AreaItem> areasFromJsonLoose(Map<String, dynamic> json) => parseListLoose(
      json,
      listKey: 'areas',
      parse: areaItemFromJsonLoose,
      keep: (a) => a.id.isNotEmpty,
    );

// ─── Commerce ─────────────────────────────────────────────────────────────────

FavoriteProductDto favoriteProductFromJsonLoose(Map<String, dynamic> json) =>
    FavoriteProductDto(
      id: stringFromJson(json['id']),
      nameMl: stringFromJson(json['name_ml'] ?? json['nameMl']),
      name: stringFromJson(json['name']),
      price: doubleFromJson(json['price']),
      imageUrl: stringFromJson(json['image_url'] ?? json['imageUrl']),
    );

FavoritesListResponse favoritesListResponseFromJsonLoose(
  Map<String, dynamic> json,
) =>
    FavoritesListResponse(
      products: parseListLoose(
        json['products'] ?? json['favorites'] ?? json['data'],
        parse: favoriteProductFromJsonLoose,
        keep: (p) => p.id.isNotEmpty,
      ),
    );

CartAddResponse cartAddResponseFromJsonLoose(Map<String, dynamic> json) =>
    CartAddResponse(
      message: stringFromJson(json['message']),
      cartTotal: doubleFromJson(json['cart_total'] ?? json['cartTotal']),
    );

// ─── User ─────────────────────────────────────────────────────────────────────

UserDetails userDetailsFromJsonLoose(Map<String, dynamic> json) => UserDetails(
      id: stringFromJson(json['id']).isEmpty ? null : stringFromJson(json['id']),
      name: json['name']?.toString(),
      username: json['username']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      gender: json['gender']?.toString(),
      rewardCoins: intFromJson(json['reward_coins'] ?? json['rewardCoins']),
    );

/// GET `/api/user/details` may return a flat user or `{ user: {...} }`.
UserDetails userDetailsFromApi(dynamic data) {
  if (data == null) return const UserDetails();
  if (data is Map<String, dynamic>) {
    if (data['user'] is Map) {
      final u = data['user'];
      return userDetailsFromJsonLoose(
        u is Map<String, dynamic> ? u : Map<String, dynamic>.from(u as Map),
      );
    }
    return userDetailsFromJsonLoose(data);
  }
  if (data is Map) return userDetailsFromJsonLoose(Map<String, dynamic>.from(data));
  return const UserDetails();
}

UpdateUserDetailsResponse updateUserDetailsResponseFromJsonLoose(
  Map<String, dynamic> json,
) {
  final userRaw = json['user'] ?? json['data'] ?? json;
  final userMap = userRaw is Map<String, dynamic>
      ? userRaw
      : userRaw is Map
          ? Map<String, dynamic>.from(userRaw)
          : <String, dynamic>{};
  return UpdateUserDetailsResponse(
    message: stringFromJson(json['message']),
    user: userDetailsFromJsonLoose(userMap),
  );
}

CreateAddressResponse createAddressResponseFromJsonLoose(
  Map<String, dynamic> json,
) =>
    CreateAddressResponse(
      id: stringFromJson(json['id'] ?? json['address_id']),
    );

// ─── Auth ─────────────────────────────────────────────────────────────────────

Msg91Info msg91InfoFromJsonLoose(Map<String, dynamic> json) => Msg91Info(
      requestId: stringFromJson(json['request_id'] ?? json['requestId']),
      type: stringFromJson(json['type']),
    );

Msg91Info? msg91InfoFromJsonLooseNullable(dynamic json) {
  if (json is! Map) return null;
  return msg91InfoFromJsonLoose(mapFromJson(json));
}

SendOtpResponse sendOtpResponseFromJsonLoose(Map<String, dynamic> json) =>
    SendOtpResponse(
      status: boolFromJson(json['status']),
      message: stringFromJson(json['message']),
      msg91: msg91InfoFromJsonLooseNullable(json['msg91'] ?? json['msg_91']),
    );

AuthUser authUserFromJsonLoose(Map<String, dynamic> json) => AuthUser(
      id: intFromJson(json['id']),
      phone: stringFromJson(json['phone']),
      name: stringFromJson(json['name']),
      email: stringFromJson(json['email']),
      createdAt: stringFromJson(json['created_at'] ?? json['createdAt']),
      updatedAt: stringFromJson(json['updated_at'] ?? json['updatedAt']),
    );

VerifyOtpResponse verifyOtpResponseFromJsonLoose(Map<String, dynamic> json) {
  AuthUser? user;
  final userRaw = json['user'];
  if (userRaw is Map<String, dynamic>) {
    user = authUserFromJsonLoose(userRaw);
  } else if (userRaw is Map) {
    user = authUserFromJsonLoose(Map<String, dynamic>.from(userRaw));
  }
  return VerifyOtpResponse(
    status: boolFromJson(json['status']),
    message: stringFromJson(json['message']),
    token: json['token']?.toString(),
    user: user,
  );
}

// ─── Orders ───────────────────────────────────────────────────────────────────

OrderListItem orderListItemFromJsonLoose(Map<String, dynamic> json) =>
    OrderListItem(
      id: stringFromJson(json['id']),
      orderNumber: stringFromJson(json['order_number'] ?? json['orderNumber']),
      status: stringFromJson(json['status']),
      orderType: stringFromJson(json['order_type'] ?? json['orderType']),
      date: stringFromJson(
        json['created_at'] ?? json['createdAt'] ?? json['date'],
      ),
      dispatchDate: stringFromJson(json['dispatch_date'] ?? json['dispatchDate']),
      notes: stringFromJson(json['notes']),
      subtotal: doubleFromJson(json['subtotal']),
      discount: doubleFromJson(json['discount'] ?? 0),
      total: doubleFromJson(json['total']),
    );

OrdersListResponse ordersListResponseFromJsonLoose(Map<String, dynamic> json) {
  var orders = parseListLoose(
    json,
    listKey: 'data',
    parse: orderListItemFromJsonLoose,
    keep: (o) => o.id.isNotEmpty,
  );
  if (orders.isEmpty) {
    orders = parseListLoose(
      json,
      listKey: 'orders',
      parse: orderListItemFromJsonLoose,
      keep: (o) => o.id.isNotEmpty,
    );
  }
  return OrdersListResponse(
    orders: orders,
    totalCount: intFromJson(json['total']),
    currentPage: intFromJson(json['current_page'] ?? json['currentPage'] ?? 1),
    lastPage: intFromJson(json['last_page'] ?? json['lastPage'] ?? 1),
  );
}

RewardWallet rewardWalletFromJsonLoose(Map<String, dynamic> json) =>
    RewardWallet(
      availableCoins:
          intFromJson(json['available_coins'] ?? json['availableCoins']),
      minimumRequired:
          intFromJson(json['minimum_required'] ?? json['minimumRequired']),
      canRedeem: boolFromJson(json['can_redeem'] ?? json['canRedeem']),
      maximumDiscount:
          doubleFromJson(json['maximum_discount'] ?? json['maximumDiscount']),
      coinValue: doubleFromJson(json['coin_value'] ?? json['coinValue'] ?? 1),
      coinsToBeEarned:
          intFromJson(json['coins_to_be_earned'] ?? json['coinsToBeEarned']),
      payableAfterRedeeming: doubleFromJson(
        json['payable_after_redeeming'] ?? json['payableAfterRedeeming'],
      ),
    );

CheckoutAddress checkoutAddressFromJsonLoose(Map<String, dynamic> json) =>
    CheckoutAddress(
      id: intFromJson(json['id']),
      addressLine: stringFromJson(json['address_line'] ?? json['addressLine']),
      pincode: stringFromJson(json['pincode']),
    );

CheckoutItem checkoutItemFromJsonLoose(Map<String, dynamic> json) =>
    CheckoutItem(
      productId: intFromJson(json['product_id'] ?? json['productId']),
      name: stringFromJson(json['name']),
      price: doubleFromJson(json['price']),
      quantity: doubleFromJson(json['quantity']),
      subtotal: doubleFromJson(json['subtotal']),
    );

CheckoutResponse checkoutResponseFromJsonLoose(Map<String, dynamic> json) {
  final walletRaw = json['reward_wallet'] ?? json['rewardWallet'];
  RewardWallet? wallet;
  if (walletRaw is Map<String, dynamic>) {
    wallet = rewardWalletFromJsonLoose(walletRaw);
  } else if (walletRaw is Map) {
    wallet = rewardWalletFromJsonLoose(Map<String, dynamic>.from(walletRaw));
  }

  final addressRaw = json['address'];
  CheckoutAddress? address;
  if (addressRaw is Map<String, dynamic>) {
    address = checkoutAddressFromJsonLoose(addressRaw);
  } else if (addressRaw is Map) {
    address = checkoutAddressFromJsonLoose(Map<String, dynamic>.from(addressRaw));
  }

  return CheckoutResponse(
    items: parseListLoose(
      json,
      listKey: 'items',
      parse: checkoutItemFromJsonLoose,
      keep: (i) => i.productId > 0 || i.name.isNotEmpty,
    ),
    subtotal: doubleFromJson(json['subtotal']),
    deliveryCharge:
        doubleFromJson(json['delivery_charge'] ?? json['deliveryCharge']),
    discount: doubleFromJson(json['discount']),
    total: doubleFromJson(json['total']),
    rewardWallet: wallet,
    address: address,
    type: stringFromJson(json['type']),
    eta: stringFromJson(json['eta']),
  );
}

PaymentRewardInfo paymentRewardInfoFromJsonLoose(Map<String, dynamic> json) =>
    PaymentRewardInfo(
      used: boolFromJson(json['used']),
      availableCoins:
          intFromJson(json['available_coins'] ?? json['availableCoins']),
      canRedeem: boolFromJson(json['can_redeem'] ?? json['canRedeem']),
      rewardDiscount:
          doubleFromJson(json['reward_discount'] ?? json['rewardDiscount']),
      rewardCoinsRedeemed: intFromJson(
        json['reward_coins_redeemed'] ?? json['rewardCoinsRedeemed'],
      ),
      rewardCoinsEarned: intFromJson(
        json['reward_coins_earned'] ?? json['rewardCoinsEarned'],
      ),
      payableAmount:
          doubleFromJson(json['payable_amount'] ?? json['payableAmount']),
    );

PaymentCustomer paymentCustomerFromJsonLoose(Map<String, dynamic> json) =>
    PaymentCustomer(
      name: stringFromJson(json['name']),
      email: stringFromJson(json['email']),
      contact: stringFromJson(json['contact']),
    );

PaymentSummary paymentSummaryFromJsonLoose(Map<String, dynamic> json) =>
    PaymentSummary(
      subtotal: doubleFromJson(json['subtotal']),
      deliveryCharge:
          doubleFromJson(json['delivery_charge'] ?? json['deliveryCharge']),
      rewardDiscount:
          doubleFromJson(json['reward_discount'] ?? json['rewardDiscount']),
      total: doubleFromJson(json['total']),
    );

CreatePaymentResponse createPaymentResponseFromJsonLoose(
  Map<String, dynamic> json,
) {
  final rewardRaw = json['reward'];
  PaymentRewardInfo? reward;
  if (rewardRaw is Map<String, dynamic>) {
    reward = paymentRewardInfoFromJsonLoose(rewardRaw);
  } else if (rewardRaw is Map) {
    reward = paymentRewardInfoFromJsonLoose(Map<String, dynamic>.from(rewardRaw));
  }

  final customerRaw = json['customer'];
  PaymentCustomer? customer;
  if (customerRaw is Map<String, dynamic>) {
    customer = paymentCustomerFromJsonLoose(customerRaw);
  } else if (customerRaw is Map) {
    customer =
        paymentCustomerFromJsonLoose(Map<String, dynamic>.from(customerRaw));
  }

  final summaryRaw = json['summary'];
  PaymentSummary? summary;
  if (summaryRaw is Map<String, dynamic>) {
    summary = paymentSummaryFromJsonLoose(summaryRaw);
  } else if (summaryRaw is Map) {
    summary = paymentSummaryFromJsonLoose(Map<String, dynamic>.from(summaryRaw));
  }

  return CreatePaymentResponse(
    success: boolFromJson(json['success'] ?? true),
    key: stringFromJson(json['key']),
    razorpayOrderId:
        stringFromJson(json['razorpay_order_id'] ?? json['razorpayOrderId']),
    paymentLink: stringFromJson(json['payment_link'] ?? json['paymentLink']),
    paymentLinkId:
        stringFromJson(json['payment_link_id'] ?? json['paymentLinkId']),
    amount: intFromJson(json['amount']),
    currency: stringFromJson(json['currency']).isEmpty
        ? 'INR'
        : stringFromJson(json['currency']),
    type: stringFromJson(json['type']),
    reward: reward,
    customer: customer,
    summary: summary,
  );
}

PlaceOrderResponse placeOrderResponseFromJsonLoose(Map<String, dynamic> json) {
  final summary = json['summary'];
  final summaryMap = summary is Map<String, dynamic>
      ? summary
      : summary is Map
          ? Map<String, dynamic>.from(summary)
          : null;
  final reward = json['reward'];
  final rewardMap = reward is Map<String, dynamic>
      ? reward
      : reward is Map
          ? Map<String, dynamic>.from(reward)
          : null;

  return PlaceOrderResponse(
    orderId: stringFromJson(
      json['order_id'] ??
          json['orderId'] ??
          json['id'] ??
          json['razorpay_order_id'],
    ),
    orderNumber: stringFromJson(
      json['order_number'] ?? json['orderNumber'] ?? json['razorpay_order_id'],
    ),
    status: stringFromJson(json['status'] ?? (json['success'] == true ? 'success' : '')),
    trackingUrl: stringFromJson(json['tracking_url'] ?? json['trackingUrl']),
    total: doubleFromJson(
      json['total'] ??
          summaryMap?['total'] ??
          rewardMap?['payable_amount'] ??
          ((json['amount'] is num) ? (json['amount'] as num) / 100 : null),
    ),
    discount: doubleFromJson(
      json['discount'] ??
          summaryMap?['reward_discount'] ??
          rewardMap?['reward_discount'] ??
          0,
    ),
    discounts: dynamicListFromJson(json['discounts']),
    loyaltyApplied: boolFromJson(
      json['loyalty_applied'] ??
          json['loyaltyApplied'] ??
          rewardMap?['used'],
    ),
    eta: stringFromJson(json['eta']),
    dispatchDate: stringFromJson(json['dispatch_date'] ?? json['dispatchDate']),
    notes: stringFromJson(json['notes']),
    deliveryCharge: doubleFromJson(
      json['delivery_charge'] ??
          json['deliveryCharge'] ??
          summaryMap?['delivery_charge'] ??
          0,
    ),
    paymentMethod: stringFromJson(json['payment_method'] ?? json['paymentMethod']),
    message: stringFromJson(json['message']),
  );
}

OrderTrackResponse orderTrackResponseFromJsonLoose(Map<String, dynamic> json) =>
    OrderTrackResponse(
      orderNumber: stringFromJson(json['order_number'] ?? json['orderNumber']),
      status: stringFromJson(json['status']),
      eta: stringFromJson(json['eta']),
    );

CancelOrderResponse cancelOrderResponseFromJsonLoose(
  Map<String, dynamic> json,
) =>
    CancelOrderResponse(message: stringFromJson(json['message']));

OrderDetailItem orderDetailItemFromJsonLoose(Map<String, dynamic> json) =>
    OrderDetailItem(
      productId: stringFromJson(json['product_id'] ?? json['productId']),
      nameMl: stringFromJson(json['name_ml'] ?? json['nameMl']),
      name: stringFromJson(json['name'] ?? json['product_name'] ?? json['productName']),
      quantity: doubleFromJson(json['quantity'] ?? 1),
      unit: stringFromJson(json['unit'] ?? json['weight'] ?? ''),
      price: doubleFromJson(json['price']),
      subtotal: doubleFromJson(json['subtotal'] ?? json['line_total'] ?? json['lineTotal']),
      imageUrl: stringFromJson(json['image_url'] ?? json['imageUrl']),
      isPreorder: boolFromJson(json['is_preorder'] ?? json['isPreorder']),
    );

List<OrderDetailItem> _orderDetailItemsFromJson(Map<String, dynamic> json) {
  for (final key in const [
    'items',
    'line_items',
    'order_items',
    'products',
  ]) {
    final list = parseListLoose(
      json,
      listKey: key,
      parse: orderDetailItemFromJsonLoose,
      keep: (i) => i.name.isNotEmpty || i.productId.isNotEmpty,
    );
    if (list.isNotEmpty) return list;
  }
  return const [];
}

OrderDetailResponse orderDetailResponseFromJsonLoose(Map<String, dynamic> json) {
  final root = json['order'] is Map
      ? mapFromJson(json['order'])
      : json['data'] is Map && (json['data'] as Map).containsKey('id')
          ? mapFromJson(json['data'])
          : json;

  var historyItems = parseListLoose(
    json,
    listKey: 'order_history',
    parse: orderDetailItemFromJsonLoose,
    keep: (i) => i.name.isNotEmpty || i.productId.isNotEmpty,
  );
  if (historyItems.isEmpty) {
    historyItems = parseListLoose(
      json,
      listKey: 'history',
      parse: orderDetailItemFromJsonLoose,
      keep: (i) => i.name.isNotEmpty || i.productId.isNotEmpty,
    );
  }

  return OrderDetailResponse(
    id: stringFromJson(root['id']),
    orderNumber: stringFromJson(root['order_number'] ?? root['orderNumber']),
    status: stringFromJson(root['status']),
    orderType: stringFromJson(root['order_type'] ?? root['orderType']),
    date: stringFromJson(
      root['created_at'] ?? root['createdAt'] ?? root['date'],
    ),
    subtotal: doubleFromJson(root['subtotal']),
    discount: doubleFromJson(root['discount'] ?? 0),
    total: doubleFromJson(root['total']),
    deliveryCharge: doubleFromJson(
      root['delivery_charge'] ?? root['deliveryCharge'] ?? 0,
    ),
    notes: stringFromJson(root['notes']),
    items: _orderDetailItemsFromJson(root),
    historyItems: historyItems,
  );
}

/// Safe parse: returns [fallback] if [parse] throws.
T parseSafely<T>(
  dynamic data,
  T Function(Map<String, dynamic>) parse,
  T fallback,
) {
  final map = mapFromJson(data);
  if (map.isEmpty && data is! Map) return fallback;
  try {
    return parse(map);
  } catch (_) {
    return fallback;
  }
}
