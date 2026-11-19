import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../api/api_exception.dart';

class ServiceTile {
  const ServiceTile({
    required this.code,
    required this.title,
    required this.imageUrl,
    required this.status,
  });

  final String code;
  final String title;
  final String imageUrl;
  final String status;
}

class KitchenCategory {
  const KitchenCategory({required this.id, required this.name, required this.icon});

  final String id;
  final String name;
  final String icon;
}

class KitchenRestaurant {
  const KitchenRestaurant({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.etaMins,
    required this.deliveryFee,
    required this.imageUrl,
    this.cuisines = const [],
    this.isVeg = false,
  });

  final String id;
  final String name;
  final String subtitle;
  final String rating;
  final String etaMins;
  final String deliveryFee;
  final String imageUrl;
  final List<String> cuisines;
  final bool isVeg;
}

class KitchenDeal {
  const KitchenDeal({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final String subtitle;
  final int price;
  final int oldPrice;
  final int discount;
  final String imageUrl;
}

class KitchenMenuItem {
  const KitchenMenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.restaurantId = '',
    this.restaurantName = '',
    this.isVeg = false,
    this.rating = '',
    this.description = '',
  });

  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String restaurantId;
  final String restaurantName;
  final bool isVeg;
  final String rating;
  final String description;
}

class KitchenOffer {
  const KitchenOffer({required this.title, required this.detail});

  final String title;
  final String detail;
}

class KitchenMenuSection {
  const KitchenMenuSection({required this.name, required this.items});

  final String name;
  final List<KitchenMenuItem> items;
}

class KitchenCartLine {
  const KitchenCartLine({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.qty,
    required this.imageUrl,
    this.size = '',
    this.restaurantName = '',
  });

  final String id;
  final String menuItemId;
  final String name;
  final int price;
  final int qty;
  final String imageUrl;
  final String size;
  final String restaurantName;
}

class KitchenCart {
  const KitchenCart({
    this.restaurantId = '',
    this.restaurantName = '',
    this.items = const [],
    this.subtotal = 0,
    this.deliveryCharge = 0,
    this.discount = 0,
    this.total = 0,
  });

  final String restaurantId;
  final String restaurantName;
  final List<KitchenCartLine> items;
  final int subtotal;
  final int deliveryCharge;
  final int discount;
  final int total;
}

class KitchenHomeData {
  const KitchenHomeData({
    this.categories = const [],
    this.restaurants = const [],
    this.deals = const [],
    this.banners = const [],
  });

  final List<KitchenCategory> categories;
  final List<KitchenRestaurant> restaurants;
  final List<KitchenDeal> deals;
  final List<String> banners;
}

class KitchenTrack {
  const KitchenTrack({
    this.orderNumber = '',
    this.status = '',
    this.activeStep = 0,
    this.etaMins = '',
    this.driverName = '',
    this.driverPhone = '',
  });

  final String orderNumber;
  final String status;
  final int activeStep;
  final String etaMins;
  final String driverName;
  final String driverPhone;
}

/// Every kitchen, services, and shop-deal call from the mobile API PDF.
class KitchenRepository {
  KitchenRepository(this._dio);

  final Dio _dio;

  Future<List<ServiceTile>> fetchServices() async {
    final data = await _get(ApiEndpoints.services);
    return _maps(data).map((item) {
      return ServiceTile(
        code: _s(item['service_code'] ?? item['id']),
        title: _s(item['title'] ?? item['name']),
        imageUrl: _s(item['image_url'] ?? item['image']),
        status: _s(item['status']),
      );
    }).where((item) => item.title.isNotEmpty).toList();
  }

  Future<KitchenHomeData> fetchHome() async {
    final data = await _get(ApiEndpoints.kitchenHome);
    if (data is! Map) {
      return const KitchenHomeData();
    }
    final map = Map<String, dynamic>.from(data);
    return KitchenHomeData(
      categories: _categories(map['categories']),
      restaurants: _restaurants(map['restaurants'] ?? map['top_restaurants']),
      deals: _deals(map['hot_deals'] ?? map['deals']),
      banners: _maps(map['banners'])
          .map((item) => _s(item['image_url'] ?? item['title']))
          .where((item) => item.isNotEmpty)
          .toList(),
    );
  }

  Future<List<KitchenCategory>> fetchCategories() async {
    final data = await _get(ApiEndpoints.kitchenCategories);
    if (data is Map && data['categories'] != null) {
      return _categories(data['categories']);
    }
    return _categories(data);
  }

  Future<List<KitchenDeal>> fetchHotDeals() async {
    final data = await _get(ApiEndpoints.kitchenHotDeals);
    if (data is Map) {
      return _deals(data['deals'] ?? data['data'] ?? data['items']);
    }
    return _deals(data);
  }

  Future<List<KitchenRestaurant>> fetchRestaurants() async {
    final data = await _get(ApiEndpoints.kitchenRestaurants);
    if (data is Map) {
      return _restaurants(data['restaurants'] ?? data['data']);
    }
    return _restaurants(data);
  }

  Future<List<KitchenRestaurant>> search(String query) async {
    final data = await _get(
      ApiEndpoints.kitchenSearch,
      query: {'q': query},
    );
    if (data is Map) {
      final restaurants = _restaurants(
        data['restaurants'] ?? data['results'] ?? data['data'],
      );
      if (restaurants.isNotEmpty) return restaurants;
    }
    return _restaurants(data);
  }

  Future<Map<String, dynamic>> fetchFilters() async {
    final data = await _get(ApiEndpoints.kitchenFilters);
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    return const {};
  }

  Future<KitchenRestaurant?> fetchRestaurant(String id) async {
    final data = await _get(ApiEndpoints.kitchenRestaurant(id));
    if (data is! Map) return null;
    final map = Map<String, dynamic>.from(data);
    if (map['name'] == null && map['restaurant'] is Map) {
      return _restaurant(Map<String, dynamic>.from(map['restaurant'] as Map));
    }
    if (map['status'] == true && map['name'] == null) return null;
    return _restaurant(map);
  }

  Future<List<KitchenOffer>> fetchOffers(String restaurantId) async {
    final data = await _get(ApiEndpoints.kitchenRestaurantOffers(restaurantId));
    final raw = data is Map
        ? (data['offers'] ?? data['coupons'] ?? data['data'])
        : data;
    return _maps(raw).map((item) {
      return KitchenOffer(
        title: _s(item['title'] ?? item['code'] ?? item['discount']),
        detail: _s(item['description'] ?? item['detail'] ?? item['min_order']),
      );
    }).where((item) => item.title.isNotEmpty).toList();
  }

  Future<List<KitchenMenuSection>> fetchMenu(String restaurantId) async {
    final data = await _get(ApiEndpoints.kitchenRestaurantMenu(restaurantId));
    final raw = data is Map ? (data['categories'] ?? data['menu'] ?? data['data']) : data;
    if (raw is! List) return const [];
    final sections = <KitchenMenuSection>[];
    for (final item in raw) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final name = _s(map['category_name'] ?? map['name']);
      final items = _menuItems(map['items'] ?? map['dishes']);
      if (name.isEmpty && items.isEmpty) continue;
      sections.add(KitchenMenuSection(name: name, items: items));
    }
    return sections;
  }

  Future<KitchenMenuItem?> fetchMenuItem(String id) async {
    final data = await _get(ApiEndpoints.kitchenMenuItem(id));
    if (data is! Map) return null;
    final map = Map<String, dynamic>.from(data);
    if (map['name'] == null) return null;
    return _menuItem(map);
  }

  Future<List<KitchenMenuItem>> fetchOftenOrdered(String id) async {
    final data = await _get(ApiEndpoints.kitchenOftenOrdered(id));
    if (data is Map) {
      return _menuItems(data['items'] ?? data['products'] ?? data['data']);
    }
    return _menuItems(data);
  }

  Future<KitchenCart> fetchCart() async {
    final data = await _get(ApiEndpoints.kitchenCart);
    return _cart(data);
  }

  Future<void> addToCart({
    required String restaurantId,
    required String menuItemId,
    int quantity = 1,
    String size = 'Regular',
  }) async {
    await _send(
      () => _dio.post(
        ApiEndpoints.kitchenCartAdd,
        data: {
          'restaurant_id': int.tryParse(restaurantId) ?? restaurantId,
          'menu_item_id': int.tryParse(menuItemId) ?? menuItemId,
          'quantity': quantity,
          'size': size,
          'customizations': const [],
        },
      ),
    );
  }

  Future<void> updateCartItem(String lineId, {required int quantity}) async {
    await _send(
      () => _dio.put(
        ApiEndpoints.kitchenCartUpdate(lineId),
        data: {'quantity': quantity},
      ),
    );
  }

  Future<void> removeCartItem(String lineId) async {
    await _send(() => _dio.delete(ApiEndpoints.kitchenCartRemove(lineId)));
  }

  Future<void> applyPromo(String code) async {
    await _send(
      () => _dio.post(ApiEndpoints.kitchenPromo, data: {'code': code}),
    );
  }

  Future<Map<String, dynamic>> checkout({required int addressId}) async {
    final response = await _send(
      () => _dio.post(
        ApiEndpoints.kitchenCheckout,
        data: {'address_id': addressId},
      ),
    );
    final data = response.data;
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    return const {};
  }

  Future<Map<String, dynamic>> placeOrder({
    required int addressId,
    required String paymentMethod,
    String? promoCode,
  }) async {
    final response = await _send(
      () => _dio.post(
        ApiEndpoints.kitchenPlaceOrder,
        data: {
          'address_id': addressId,
          'payment_method': paymentMethod,
          if (promoCode != null && promoCode.isNotEmpty) 'promo_code': promoCode,
        },
      ),
    );
    final data = response.data;
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    return const {};
  }

  Future<KitchenTrack> trackOrder(String orderId) async {
    final data = await _get(ApiEndpoints.kitchenOrderTrack(orderId));
    if (data is! Map) return const KitchenTrack();
    final map = Map<String, dynamic>.from(data);
    final driver = map['driver'];
    return KitchenTrack(
      orderNumber: _s(map['order_number']),
      status: _s(map['status']),
      activeStep: int.tryParse(_s(map['active_step'])) ?? 0,
      etaMins: _s(map['eta_mins']),
      driverName: driver is Map ? _s(driver['name']) : '',
      driverPhone: driver is Map ? _s(driver['phone']) : '',
    );
  }

  Future<List<KitchenMenuItem>> fetchWishlist() async {
    final data = await _get(ApiEndpoints.kitchenWishlist);
    if (data is Map) return _menuItems(data['items'] ?? data['data']);
    return _menuItems(data);
  }

  Future<void> addWishlist(String menuItemId) async {
    await _send(
      () => _dio.post(
        ApiEndpoints.kitchenWishlistAdd,
        data: {'menu_item_id': int.tryParse(menuItemId) ?? menuItemId},
      ),
    );
  }

  Future<void> removeWishlist(String menuItemId) async {
    await _send(
      () => _dio.delete(ApiEndpoints.kitchenWishlistRemove(menuItemId)),
    );
  }

  Future<dynamic> _get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get<dynamic>(path, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw ApiException.fromDio(e);
    }
  }

  Future<Response<dynamic>> _send(Future<Response<dynamic>> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  List<Map<String, dynamic>> _maps(dynamic raw) {
    if (raw is! List) return const [];
    return raw.whereType<Map>().map((item) => Map<String, dynamic>.from(item)).toList();
  }

  String _s(dynamic value) => value == null ? '' : value.toString();

  int _i(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.round();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  List<KitchenCategory> _categories(dynamic raw) {
    return _maps(raw).map((item) {
      return KitchenCategory(
        id: _s(item['id']),
        name: _s(item['name'] ?? item['title']),
        icon: _s(item['icon'] ?? item['icon_url'] ?? item['image_url']),
      );
    }).where((item) => item.name.isNotEmpty).toList();
  }

  List<KitchenRestaurant> _restaurants(dynamic raw) {
    return _maps(raw).map(_restaurant).where((item) => item.name.isNotEmpty).toList();
  }

  KitchenRestaurant _restaurant(Map<String, dynamic> item) {
    final cuisines = item['cuisines'];
    return KitchenRestaurant(
      id: _s(item['id']),
      name: _s(item['name'] ?? item['title']),
      subtitle: _s(item['subtitle'] ?? item['address']),
      rating: _s(item['rating']),
      etaMins: _s(item['eta_mins'] ?? item['mins']),
      deliveryFee: _s(item['delivery_fee']),
      imageUrl: _s(item['image_url'] ?? item['image']),
      cuisines: cuisines is List ? cuisines.map((e) => e.toString()).toList() : const [],
      isVeg: item['is_veg'] == true,
    );
  }

  List<KitchenDeal> _deals(dynamic raw) {
    return _maps(raw).map((item) {
      return KitchenDeal(
        id: _s(item['id']),
        title: _s(item['title'] ?? item['name']),
        subtitle: _s(item['subtitle'] ?? item['badge']),
        price: _i(item['price']),
        oldPrice: _i(item['old_price'] ?? item['price']),
        discount: _i(item['discount_percentage'] ?? item['discount']),
        imageUrl: _s(item['image_url'] ?? item['image']),
      );
    }).where((item) => item.title.isNotEmpty).toList();
  }

  List<KitchenMenuItem> _menuItems(dynamic raw) {
    return _maps(raw).map(_menuItem).where((item) => item.name.isNotEmpty).toList();
  }

  KitchenMenuItem _menuItem(Map<String, dynamic> item) {
    return KitchenMenuItem(
      id: _s(item['id'] ?? item['menu_item_id']),
      name: _s(item['name'] ?? item['title']),
      price: _i(item['price']),
      imageUrl: _s(item['image_url'] ?? item['image']),
      restaurantId: _s(item['restaurant_id']),
      restaurantName: _s(item['restaurant_name']),
      isVeg: item['is_veg'] == true,
      rating: _s(item['rating']),
      description: _s(item['description']),
    );
  }

  KitchenCart _cart(dynamic data) {
    if (data is! Map) return const KitchenCart();
    final map = Map<String, dynamic>.from(data);
    final restaurant = map['restaurant'];
    final lines = _maps(map['items']).map((item) {
      return KitchenCartLine(
        id: _s(item['id']),
        menuItemId: _s(item['menu_item_id']),
        name: _s(item['name']),
        price: _i(item['price']),
        qty: _i(item['qty'] ?? item['quantity']),
        imageUrl: _s(item['image_url']),
        size: _s(item['size']),
        restaurantName: restaurant is Map ? _s(restaurant['name']) : '',
      );
    }).toList();
    return KitchenCart(
      restaurantId: restaurant is Map ? _s(restaurant['id']) : '',
      restaurantName: restaurant is Map ? _s(restaurant['name']) : '',
      items: lines,
      subtotal: _i(map['subtotal']),
      deliveryCharge: _i(map['delivery_charge']),
      discount: _i(map['discount']),
      total: _i(map['total']),
    );
  }
}
