/// API paths (appended to [kApiBaseUrl]).
abstract final class ApiEndpoints {
  static const String sendOtp = '/api/auth/send-otp';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String verifyOtp = '/api/auth/verify-otp';

  static const String banners = '/api/banners';
  static const String categories = '/api/categories';
  static const String products = '/api/products';
  static const String filters = '/api/filters';

  static const String locationsZones = '/api/locations/zones';
  static const String locationsAreas = '/api/locations/areas';
  static const String userAddresses = '/api/user/addresses';
  static const String userDetails = '/api/user/details';
}
