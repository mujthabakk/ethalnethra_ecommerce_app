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
      date: stringFromJson(json['date'] ?? json['created_at'] ?? json['createdAt']),
      total: doubleFromJson(json['total']),
      status: stringFromJson(json['status']),
      itemsCount: intFromJson(json['items_count'] ?? json['itemsCount']),
    );

OrdersListResponse ordersListResponseFromJsonLoose(Map<String, dynamic> json) =>
    OrdersListResponse(
      orders: parseListLoose(
        json,
        listKey: 'orders',
        parse: orderListItemFromJsonLoose,
        keep: (o) => o.id.isNotEmpty,
      ),
      total: doubleFromJson(json['total']),
      pages: doubleFromJson(json['pages']),
    );

PlaceOrderResponse placeOrderResponseFromJsonLoose(Map<String, dynamic> json) =>
    PlaceOrderResponse(
      orderId: stringFromJson(json['order_id'] ?? json['orderId']),
      orderNumber: stringFromJson(json['order_number'] ?? json['orderNumber']),
      status: stringFromJson(json['status']),
      trackingUrl: stringFromJson(json['tracking_url'] ?? json['trackingUrl']),
      total: doubleFromJson(json['total']),
      discount: doubleFromJson(json['discount']),
      discounts: dynamicListFromJson(json['discounts']),
      loyaltyApplied: boolFromJson(json['loyalty_applied'] ?? json['loyaltyApplied']),
      eta: stringFromJson(json['eta']),
    );

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
