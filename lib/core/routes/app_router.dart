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
import '../../views/v2desgin/service/buy_sell/buy_sell_data.dart';
import '../../views/v2desgin/service/buy_sell/buy_sell_details_screen.dart';
import '../../views/v2desgin/service/buy_sell/buy_sell_home_screen.dart';
import '../../views/v2desgin/service/buy_sell/buy_sell_results_screen.dart';
import '../../views/v2desgin/service/buy_sell/buy_sell_search_screen.dart';
import '../../views/v2desgin/service/real_estate/real_estate_data.dart';
import '../../views/v2desgin/service/real_estate/real_estate_details_screen.dart';
import '../../views/v2desgin/service/real_estate/real_estate_featured_screen.dart';
import '../../views/v2desgin/service/real_estate/real_estate_home_screen.dart';
import '../../views/v2desgin/service/service_data.dart';
import '../../views/v2desgin/service/spare_parts/spare_parts_data.dart';
import '../../views/v2desgin/service/spare_parts/spare_parts_details_screen.dart';
import '../../views/v2desgin/service/spare_parts/spare_parts_home_screen.dart';
import '../../views/v2desgin/service/spare_parts/spare_parts_search_screen.dart';
import '../../views/v2desgin/service/service_home_screen.dart';
import '../../views/v2desgin/service/service_providers_screen.dart';
import '../../views/v2desgin/service/service_schedule_screen.dart';
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
  static const String serviceHome = '/our-services';
  static const String serviceProviders = '/our-services/providers';
  static const String serviceSchedule = '/our-services/schedule';
  static const String realEstateHome = '/our-services/real-estate';
  static const String realEstateFeatured = '/our-services/real-estate/featured';
  static const String realEstateDetails = '/our-services/real-estate/details';
  static const String sparePartsHome = '/our-services/spare-parts';
  static const String sparePartsSearch = '/our-services/spare-parts/search';
  static const String sparePartsDetails = '/our-services/spare-parts/details';
  static const String buySellHome = '/our-services/buy-sell';
  static const String buySellSearch = '/our-services/buy-sell/search';
  static const String buySellResults = '/our-services/buy-sell/results';
  static const String buySellDetails = '/our-services/buy-sell/details';
  static const String buySellLocation = '/our-services/buy-sell/location';
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
          final phone = state.extra is String ? state.extra as String : '';
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
          final extra = state.extra;
          if (extra is Map) {
            return V2CategoryProductsScreen(
              initialCategory: (extra['category'] as String?) ?? '',
              search: (extra['search'] as String?) ?? '',
            );
          }
          final cat = extra is String ? extra : '';
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
              productId: extra['id']?.toString(),
              title: (extra['title'] as String?) ?? '',
              image: extra['image'] as String?,
              price: (extra['price'] as int?) ?? 0,
              oldPrice: (extra['oldPrice'] as int?) ?? 0,
              weight: (extra['weight'] as String?) ?? '',
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
        path: serviceHome,
        name: 'serviceHome',
        builder: (context, state) => const ServiceHomeScreen(),
      ),
      GoRoute(
        path: serviceProviders,
        name: 'serviceProviders',
        builder: (context, state) {
          final category = state.extra is String ? state.extra as String : '';
          return ServiceProvidersScreen(
            category: category.isEmpty ? 'Services' : category,
          );
        },
      ),
      GoRoute(
        path: serviceSchedule,
        name: 'serviceSchedule',
        builder: (context, state) {
          final extra = state.extra;
          return ServiceScheduleScreen(
            provider: extra is ServiceProvider
                ? extra
                : ServiceData.providers.first,
          );
        },
      ),
      GoRoute(
        path: realEstateHome,
        name: 'realEstateHome',
        builder: (context, state) => const RealEstateHomeScreen(),
      ),
      GoRoute(
        path: realEstateFeatured,
        name: 'realEstateFeatured',
        builder: (context, state) => const RealEstateFeaturedScreen(),
      ),
      GoRoute(
        path: realEstateDetails,
        name: 'realEstateDetails',
        builder: (context, state) {
          final extra = state.extra;
          return RealEstateDetailsScreen(
            property: extra is Property ? extra : RealEstateData.nearby[1],
          );
        },
      ),
      GoRoute(
        path: sparePartsHome,
        name: 'sparePartsHome',
        builder: (context, state) => const SparePartsHomeScreen(),
      ),
      GoRoute(
        path: sparePartsSearch,
        name: 'sparePartsSearch',
        builder: (context, state) => const SparePartsSearchScreen(),
      ),
      GoRoute(
        path: sparePartsDetails,
        name: 'sparePartsDetails',
        builder: (context, state) {
          final extra = state.extra;
          return SparePartsDetailsScreen(
            part: extra is SparePart ? extra : SparePartsData.engine,
          );
        },
      ),
      GoRoute(
        path: buySellHome,
        name: 'buySellHome',
        builder: (context, state) => const BuySellHomeScreen(),
      ),
      GoRoute(
        path: buySellSearch,
        name: 'buySellSearch',
        builder: (context, state) => const BuySellSearchScreen(),
      ),
      GoRoute(
        path: buySellResults,
        name: 'buySellResults',
        builder: (context, state) {
          final extra = state.extra;
          final map = extra is Map ? extra : const {};
          return BuySellResultsScreen(
            query: map['query'] as String? ?? '',
            category: map['category'] as String?,
            title: map['title'] as String?,
          );
        },
      ),
      GoRoute(
        path: buySellDetails,
        name: 'buySellDetails',
        builder: (context, state) {
          final extra = state.extra;
          return BuySellDetailsScreen(
            listing: extra is BuySellListing ? extra : BuySellData.iphone15,
          );
        },
      ),
      GoRoute(
        path: buySellLocation,
        name: 'buySellLocation',
        builder: (context, state) => const SelectDeliveryLocationScreen(
          accent: Color(0xFF2E67AE),
          compact: true,
          subtitle: 'Select your area to find deals near you',
        ),
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
          final q = state.extra is String ? state.extra as String : '';
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
              restaurantId: extra['id']?.toString() ?? '',
              name: extra['name'] as String? ?? '',
              subtitle: extra['subtitle'] as String? ?? '',
              image: extra['image'] as String? ?? '',
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
              menuItemId: extra['id']?.toString() ?? '',
              restaurantId: extra['restaurantId']?.toString() ?? '',
              title: extra['title'] as String? ?? '',
              price: extra['price'] as int? ?? 0,
              image: extra['image'] as String? ?? '',
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
        builder: (context, state) {
          final id = state.extra is String ? state.extra as String : '';
          return KistcherOrderTrackingScreen(orderId: id);
        },
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
