import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../views/splash/splash_screen.dart';
import '../../views/welcome/welcome_screen.dart';
import '../../views/signin/signin_screen.dart';
import '../../views/mobile_number/mobile_number_screen.dart';
import '../../views/otp_verification/otp_verification_screen.dart';
import '../../views/location/location_screen.dart';
import '../../views/login/login_screen.dart';
import '../../views/signup/signup_screen.dart';
import '../../views/main_nav/main_nav_screen.dart';
import '../../views/home/services_screen.dart';
import '../../views/product_detail/product_detail_screen.dart';
import '../../views/explore/category_products_screen.dart';
import '../../views/explore/filter_screen.dart';
import '../../views/cart/order_success_screen.dart';
import '../../views/cart/order_status_screen.dart';
import '../../views/cart/orders_list_screen.dart';
import '../../views/cart/order_history_screen.dart';
import '../../views/account/edit_profile_screen.dart';
import '../../views/account/delivery_address_screen.dart';
import '../../views/account/promo_code_screen.dart';
import '../../views/account/select_delivery_location_screen.dart';
import '../../views/v2desgin/v2_categories_screen.dart';
import '../../views/v2desgin/v2_cart_screen.dart';
import '../../views/v2desgin/v2_category_products_screen.dart';
import '../../views/v2desgin/v2_checkout_screen.dart';
import '../../views/v2desgin/v2_home_screen.dart';
import '../../views/v2desgin/v2_payment_success_screen.dart';
import '../../views/v2desgin/v2_product_details_screen.dart';
import '../../views/v2desgin/v2_ai_chat_screen.dart';
import '../../views/v2desgin/v2_notifications_screen.dart';
import '../../views/v2desgin/v2_order_tracking_screen.dart';
import '../../views/v2desgin/v2_profile_screen.dart';
import '../../views/v2desgin/v2_wishlist_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_cart_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_notifications_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_order_tracking_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_product_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_profile_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_restaurant_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_review_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_search_screen.dart';
import '../../views/v2desgin/kistcher/kistcher_shell.dart';
import '../../views/v2desgin/kistcher/kistcher_wishlist_screen.dart';
import '../../views/v2desgin/v2_onboarding_screen.dart';
import '../../views/v2desgin/auth/v2_login_screen.dart';
import '../../views/v2desgin/auth/v2_otp_screen.dart';
import '../../views/v2desgin/auth/v2_signup_screen.dart';
import '../../core/models/orders/orders_models.dart';
import '../../models/product_model.dart';

/// Flip to `false` to restore the previous splash → auth → main-nav flow.
const bool kUseV2DesignEntry = true;

/// GoRouter may surface `extra` map values as [List<dynamic>] even when callers
/// intended [List<ProductModel>]; avoid direct casts that throw.
List<ProductModel> _productListFromExtra(dynamic value) {
  if (value == null) return const [];
  if (value is List<ProductModel>) return value;
  if (value is List) {
    return value.whereType<ProductModel>().toList();
  }
  return const [];
}

Map<String, dynamic> _extraMap(Object? extra) {
  if (extra is Map<String, dynamic>) return extra;
  if (extra is Map) {
    return extra.map((k, v) => MapEntry(k.toString(), v));
  }
  return {};
}

/// App Router Configuration using GoRouter
class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // Route names
  static const String splash = '/splash';
  static const String welcome = '/';
  static const String signin = '/signin';
  static const String mobileNumber = '/mobile-number';
  static const String otpVerification = '/otp-verification';
  static const String location = '/location';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String mainNav = '/main-nav';
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String categoryProducts = '/category-products';
  static const String filter = '/filter';
  static const String orderSuccess = '/order-success';
  static const String ordersList = '/orders';
  static const String orderStatus = '/order-status';
  static String orderStatusPath(String orderId) => '$orderStatus/$orderId';
  static const String orderHistory = '/order-history';
  static String orderHistoryPath(String orderId) => '$orderHistory/$orderId';
  static const String editProfile = '/edit-profile';
  static const String deliveryAddress = '/delivery-address';
  static const String promoCode = '/promo-code';
  static const String selectLocation = '/select-location';
  static const String services = '/services';
  /// V2 design home (temporary app-open entry; old flow kept intact).
  static const String v2Home = '/v2-home';
  static const String v2Categories = '/v2-categories';
  static const String v2CategoryProducts = '/v2-category-products';
  static const String v2ProductDetails = '/v2-product-details';
  static const String v2Cart = '/v2-cart';
  static const String v2Checkout = '/v2-checkout';
  static const String v2PaymentSuccess = '/v2-payment-success';
  static const String v2Wishlist = '/v2-wishlist';
  static const String v2Profile = '/v2-profile';
  static const String v2OrderTracking = '/v2-order-tracking';
  static const String v2AiChat = '/v2-ai-chat';
  static const String v2Notifications = '/v2-notifications';
  static const String kistcherHome = '/kistcher';
  static const String kistcherBlank = '/kistcher-blank';
  static const String kistcherSearch = '/kistcher-search';
  static const String kistcherRestaurant = '/kistcher-restaurant';
  static const String kistcherProduct = '/kistcher-product';
  static const String kistcherCart = '/kistcher-cart';
  static const String kistcherReview = '/kistcher-review';
  static const String kistcherProfile = '/kistcher-profile';
  static const String kistcherWishlist = '/kistcher-wishlist';
  static const String kistcherNotifications = '/kistcher-notifications';
  static const String kistcherOrderTracking = '/kistcher-order-tracking';
  /// V2 auth / onboarding (app open when [kUseV2DesignEntry] is true).
  static const String v2Onboarding = '/v2-onboarding';
  static const String v2Login = '/v2-login';
  static const String v2Signup = '/v2-signup';
  static const String v2Otp = '/v2-otp';

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // Old entry (`splash`) is hidden while V2 design preview is active.
    initialLocation: kUseV2DesignEntry ? v2Onboarding : splash,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: v2Onboarding,
        name: 'v2Onboarding',
        builder: (context, state) => const V2OnboardingScreen(),
      ),
      GoRoute(
        path: v2Login,
        name: 'v2Login',
        builder: (context, state) => const V2LoginScreen(),
      ),
      GoRoute(
        path: v2Signup,
        name: 'v2Signup',
        builder: (context, state) => const V2SignupScreen(),
      ),
      GoRoute(
        path: v2Otp,
        name: 'v2Otp',
        builder: (context, state) {
          final phone = state.extra is String
              ? state.extra as String
              : '+91 8398 737 880';
          return V2OtpScreen(phoneDisplay: phone);
        },
      ),
      GoRoute(
        path: v2Home,
        name: 'v2Home',
        builder: (context, state) => const V2HomeScreen(),
      ),
      GoRoute(
        path: v2Categories,
        name: 'v2Categories',
        builder: (context, state) => const V2CategoriesScreen(),
      ),
      GoRoute(
        path: v2CategoryProducts,
        name: 'v2CategoryProducts',
        builder: (context, state) {
          final cat = state.extra is String
              ? state.extra as String
              : 'Vegetables';
          return V2CategoryProductsScreen(initialCategory: cat);
        },
      ),
      GoRoute(
        path: v2ProductDetails,
        name: 'v2ProductDetails',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is Map) {
            return V2ProductDetailsScreen(
              title: (extra['title'] as String?) ?? 'Indian Tomato Fresh',
              image: extra['image'] as String?,
              price: (extra['price'] as int?) ?? 20,
              oldPrice: (extra['oldPrice'] as int?) ?? 25,
              weight: (extra['weight'] as String?) ?? '500 gm',
            );
          }
          return const V2ProductDetailsScreen();
        },
      ),
      GoRoute(
        path: v2Cart,
        name: 'v2Cart',
        builder: (context, state) => const V2CartScreen(),
      ),
      GoRoute(
        path: v2Checkout,
        name: 'v2Checkout',
        builder: (context, state) {
          final total = state.extra is int ? state.extra as int : 200;
          return V2CheckoutScreen(total: total);
        },
      ),
      GoRoute(
        path: v2PaymentSuccess,
        name: 'v2PaymentSuccess',
        builder: (context, state) {
          final id = state.extra is String
              ? state.extra as String
              : 'IT-ORD-23984XQ7';
          return V2PaymentSuccessScreen(orderId: id);
        },
      ),
      GoRoute(
        path: v2Wishlist,
        name: 'v2Wishlist',
        builder: (context, state) => const V2WishlistScreen(),
      ),
      GoRoute(
        path: v2Profile,
        name: 'v2Profile',
        builder: (context, state) => const V2ProfileScreen(),
      ),
      GoRoute(
        path: v2OrderTracking,
        name: 'v2OrderTracking',
        builder: (context, state) => const V2OrderTrackingScreen(),
      ),
      GoRoute(
        path: v2AiChat,
        name: 'v2AiChat',
        builder: (context, state) => const V2AiChatScreen(),
      ),
      GoRoute(
        path: v2Notifications,
        name: 'v2Notifications',
        builder: (context, state) => const V2NotificationsScreen(),
      ),
      GoRoute(
        path: kistcherHome,
        name: 'kistcherHome',
        builder: (context, state) => const KistcherShell(),
      ),
      GoRoute(
        path: kistcherBlank,
        name: 'kistcherBlank',
        builder: (context, state) {
          final title = state.extra is String ? state.extra as String : '';
          return KistcherBlankScreen(title: title);
        },
      ),
      GoRoute(
        path: kistcherSearch,
        name: 'kistcherSearch',
        builder: (context, state) {
          final q = state.extra is String ? state.extra as String : 'burger';
          return KistcherSearchScreen(initialQuery: q);
        },
      ),
      GoRoute(
        path: kistcherRestaurant,
        name: 'kistcherRestaurant',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is Map) {
            return KistcherRestaurantScreen(
              name: extra['name'] as String? ?? 'KFC',
              subtitle: extra['subtitle'] as String? ?? 'Kentucky fried chicken',
            );
          }
          return const KistcherRestaurantScreen();
        },
      ),
      GoRoute(
        path: kistcherProduct,
        name: 'kistcherProduct',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is Map) {
            return KistcherProductScreen(
              title: extra['title'] as String? ?? 'Cheese with Chicken Burger',
              price: extra['price'] as int? ?? 200,
            );
          }
          return const KistcherProductScreen();
        },
      ),
      GoRoute(
        path: kistcherCart,
        name: 'kistcherCart',
        builder: (context, state) => const KistcherCartScreen(),
      ),
      GoRoute(
        path: kistcherReview,
        name: 'kistcherReview',
        builder: (context, state) => const KistcherReviewScreen(),
      ),
      GoRoute(
        path: kistcherProfile,
        name: 'kistcherProfile',
        builder: (context, state) => const KistcherProfileScreen(),
      ),
      GoRoute(
        path: kistcherWishlist,
        name: 'kistcherWishlist',
        builder: (context, state) => const KistcherWishlistScreen(),
      ),
      GoRoute(
        path: kistcherNotifications,
        name: 'kistcherNotifications',
        builder: (context, state) => const KistcherNotificationsScreen(),
      ),
      GoRoute(
        path: kistcherOrderTracking,
        name: 'kistcherOrderTracking',
        builder: (context, state) => const KistcherOrderTrackingScreen(),
      ),
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: signin,
        name: 'signin',
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: mobileNumber,
        name: 'mobileNumber',
        builder: (context, state) {
          final initialPhone = state.extra as String? ?? '';
          return MobileNumberScreen(initialPhone: initialPhone);
        },
      ),
      GoRoute(
        path: otpVerification,
        name: 'otpVerification',
        builder: (context, state) {
          final phoneNumber = state.extra as String? ?? '';
          return OtpVerificationScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: location,
        name: 'location',
        builder: (context, state) => const LocationScreen(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signup,
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: mainNav,
        name: 'mainNav',
        builder: (context, state) => const MainNavScreen(),
      ),
      GoRoute(
        path: services,
        name: 'services',
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
        path: productDetail,
        name: 'productDetail',
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: categoryProducts,
        name: 'categoryProducts',
        builder: (context, state) {
          final extras = _extraMap(state.extra);
          final fromProducts = _productListFromExtra(extras['products']);
          final fromInitial = _productListFromExtra(extras['initialProducts']);
          final initialProducts =
              fromProducts.isNotEmpty ? fromProducts : fromInitial;
          final title = extras['title'] is String
              ? extras['title'] as String
              : 'Products';
          return CategoryProductsScreen(
            title: title,
            initialProducts: initialProducts,
            apiCategory: extras['apiCategory'] as String?,
            apiSearch: extras['apiSearch'] as String?,
            productType: extras['productType'] as String?,
            fetchAll: extras['fetchAll'] == true,
          );
        },
      ),
      GoRoute(
        path: filter,
        name: 'filter',
        builder: (context, state) => const FilterScreen(),
      ),
      GoRoute(
        path: orderSuccess,
        name: 'orderSuccess',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is PlaceOrderResponse) {
            return OrderSuccessScreen(result: extra);
          }
          return const OrderSuccessScreen();
        },
      ),
      GoRoute(
        path: ordersList,
        name: 'ordersList',
        builder: (context, state) => const OrdersListScreen(),
      ),
      GoRoute(
        path: '$orderStatus/:orderId',
        name: 'orderStatus',
        builder: (context, state) {
          final id = state.pathParameters['orderId'] ?? '';
          return OrderStatusScreen(orderId: id);
        },
      ),
      GoRoute(
        path: '$orderHistory/:orderId',
        name: 'orderHistory',
        builder: (context, state) {
          final id = state.pathParameters['orderId'] ?? '';
          return OrderHistoryScreen(orderId: id);
        },
      ),
      GoRoute(
        path: editProfile,
        name: 'editProfile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: deliveryAddress,
        name: 'deliveryAddress',
        builder: (context, state) => const DeliveryAddressScreen(),
      ),
      GoRoute(
        path: promoCode,
        name: 'promoCode',
        builder: (context, state) => const PromoCodeScreen(),
      ),
      GoRoute(
        path: selectLocation,
        name: 'selectLocation',
        builder: (context, state) => const SelectDeliveryLocationScreen(),
      ),
    ],
  );
}
