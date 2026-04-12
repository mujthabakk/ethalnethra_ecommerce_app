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
import '../../views/cart/orders_list_screen.dart';
import '../../views/cart/order_history_screen.dart';
import '../../views/account/edit_profile_screen.dart';
import '../../views/account/notifications_screen.dart';
import '../../views/account/delivery_address_screen.dart';
import '../../views/account/promo_code_screen.dart';
import '../../views/account/select_delivery_location_screen.dart';
import '../../core/models/orders/orders_models.dart';
import '../../models/product_model.dart';

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
