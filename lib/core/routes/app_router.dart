import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../views/welcome/welcome_screen.dart';
import '../../views/signin/signin_screen.dart';
import '../../views/mobile_number/mobile_number_screen.dart';
import '../../views/otp_verification/otp_verification_screen.dart';
import '../../views/location/location_screen.dart';
import '../../views/login/login_screen.dart';
import '../../views/signup/signup_screen.dart';
import '../../views/main_nav/main_nav_screen.dart';
import '../../views/product_detail/product_detail_screen.dart';
import '../../views/explore/category_products_screen.dart';
import '../../views/explore/filter_screen.dart';
import '../../views/cart/order_success_screen.dart';
import '../../views/cart/order_status_screen.dart';
import '../../views/cart/order_history_screen.dart';
import '../../views/account/edit_profile_screen.dart';
import '../../views/account/notifications_screen.dart';
import '../../views/account/delivery_address_screen.dart';
import '../../views/account/promo_code_screen.dart';
import '../../views/account/select_delivery_location_screen.dart';
import '../../models/product_model.dart';

/// App Router Configuration using GoRouter
class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // Route names
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
  static const String orderStatus = '/order-status';
  static const String orderHistory = '/order-history';
  static const String editProfile = '/edit-profile';
  static const String notifications = '/notifications';
  static const String deliveryAddress = '/delivery-address';
  static const String promoCode = '/promo-code';
  static const String selectLocation = '/select-location';

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: mainNav,
    debugLogDiagnostics: true,
    routes: [
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
          final extras = state.extra as Map<String, dynamic>;
          final products = extras['products'] as List<ProductModel>?;
          final initial = extras['initialProducts'] as List<ProductModel>?;
          return CategoryProductsScreen(
            title: extras['title'] as String,
            initialProducts: products ?? initial ?? const [],
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
        builder: (context, state) => const OrderSuccessScreen(),
      ),
      GoRoute(
        path: orderStatus,
        name: 'orderStatus',
        builder: (context, state) => const OrderStatusScreen(),
      ),
      GoRoute(
        path: orderHistory,
        name: 'orderHistory',
        builder: (context, state) => const OrderHistoryScreen(),
      ),
      GoRoute(
        path: editProfile,
        name: 'editProfile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: notifications,
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
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
