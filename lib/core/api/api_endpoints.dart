/// API paths (appended to [kApiBaseUrl]).
abstract final class ApiEndpoints {
  static const String sendOtp = '/api/auth/send-otp';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String verifyOtp = '/api/auth/verify-otp';

  static const String banners = '/api/banners';
  static const String categories = '/api/categories';
  static const String products = '/api/products';
  static const String filters = '/api/filters';
  static const String shopBestValue = '/api/shop/best-value';
  static const String shopTodaysDeals = '/api/shop/todays-deals';

  static String productById(String id) => '/api/products/$id';

  static const String cart = '/api/cart';
  static const String cartAdd = '/api/cart/add';
  static String cartUpdate(String lineId) => '/api/cart/update/$lineId';
  static String cartRemove(String lineId) => '/api/cart/remove/$lineId';

  static const String favorites = '/api/favorites';
  static const String favoritesAdd = '/api/favorites/add';
  static const String favoritesAddToCart = '/api/favorites/add-to-cart';
  static const String favoritesMoveToCart = '/api/favorites/move-to-cart';
  static String favoritesRemove(String productId) =>
      '/api/favorites/remove/$productId';

  static const String locationsZones = '/api/locations/zones';
  static const String locationsAreas = '/api/locations/areas';
  static const String locationsPincodes = '/api/locations/pincodes';
  static const String userAddresses = '/api/user/addresses';
  static String userAddressById(int id) => '/api/user/addresses/$id';
  static String userAddressDefault(int id) => '/api/user/addresses/$id/default';
  static const String userDetails = '/api/user/details';

  static const String orders = '/api/orders';
  static String orderById(String id) => '/api/orders/$id';
  static const String ordersCheckout = '/api/orders/checkout';
  static const String ordersCreatePayment = '/api/orders/create-payment';
  static const String ordersPlace = '/api/orders/place';
  static const String ordersPlacePreorder = '/api/orders/place-preorder';
  static String orderTrack(String id) => '/api/orders/$id/track';
  static String orderCancel(String id) => '/api/orders/$id/cancel';

  static const String notifications = '/api/notifications';
  static const String aiSuggestions = '/api/ai/suggestions';
  static const String aiChat = '/api/ai/chat';
  static const String services = '/api/services';

  static const String kitchenHome = '/api/kitchen/home';
  static const String kitchenCategories = '/api/kitchen/categories';
  static const String kitchenHotDeals = '/api/kitchen/hot-deals';
  static const String kitchenRestaurants = '/api/kitchen/restaurants';
  static String kitchenRestaurant(String id) => '/api/kitchen/restaurants/$id';
  static String kitchenRestaurantOffers(String id) =>
      '/api/kitchen/restaurants/$id/offers';
  static String kitchenRestaurantMenu(String id) =>
      '/api/kitchen/restaurants/$id/menu';
  static const String kitchenSearch = '/api/kitchen/search';
  static const String kitchenFilters = '/api/kitchen/filters';
  static String kitchenMenuItem(String id) => '/api/kitchen/menu-items/$id';
  static String kitchenOftenOrdered(String id) =>
      '/api/kitchen/menu-items/$id/often-ordered';

  static const String kitchenCart = '/api/kitchen/cart';
  static const String kitchenCartAdd = '/api/kitchen/cart/add';
  static String kitchenCartUpdate(String id) => '/api/kitchen/cart/update/$id';
  static String kitchenCartRemove(String id) => '/api/kitchen/cart/remove/$id';
  static const String kitchenPromo = '/api/kitchen/promo/apply';
  static const String kitchenCheckout = '/api/kitchen/orders/checkout';
  static const String kitchenPlaceOrder = '/api/kitchen/orders/place';
  static String kitchenOrderTrack(String id) =>
      '/api/kitchen/orders/$id/track';

  static const String kitchenWishlist = '/api/kitchen/wishlist';
  static const String kitchenWishlistAdd = '/api/kitchen/wishlist/add';
  static String kitchenWishlistRemove(String id) =>
      '/api/kitchen/wishlist/remove/$id';
}
