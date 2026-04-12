/// API paths (appended to [kApiBaseUrl]).
abstract final class ApiEndpoints {
  static const String sendOtp = '/api/auth/send-otp';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String verifyOtp = '/api/auth/verify-otp';

  static const String banners = '/api/banners';
  static const String categories = '/api/categories';
  static const String products = '/api/products';
  static const String filters = '/api/filters';

  static String productById(String id) => '/api/products/$id';

  static const String cart = '/api/cart';
  static const String cartAdd = '/api/cart/add';
  static String cartUpdate(String lineId) => '/api/cart/update/$lineId';
  static String cartRemove(String lineId) => '/api/cart/remove/$lineId';

  static const String favorites = '/api/favorites';
  static const String favoritesAdd = '/api/favorites/add';
  static String favoritesRemove(String productId) =>
      '/api/favorites/remove/$productId';

  static const String locationsZones = '/api/locations/zones';
  static const String locationsAreas = '/api/locations/areas';
  static const String userAddresses = '/api/user/addresses';
  static const String userDetails = '/api/user/details';

  static const String orders = '/api/orders';
  static const String ordersPlace = '/api/orders/place';

  static String orderTrack(String orderId) => '/api/orders/$orderId/track';

  static String orderCancel(String orderId) => '/api/orders/$orderId/cancel';
}
