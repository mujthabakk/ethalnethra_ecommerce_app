import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/auth/send_otp_response.dart';
import '../models/auth/verify_otp_response.dart';
import '../storage/auth_storage.dart';

class AuthApiException implements Exception {
  AuthApiException(this.message, {this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class AuthRepository {
  AuthRepository(this._dio, this._storage);

  final Dio _dio;
  final AuthStorage _storage;

  Future<SendOtpResponse> sendOtp(String phone) async {
    return _postOtpMessage(ApiEndpoints.sendOtp, phone);
  }

  Future<SendOtpResponse> resendOtp(String phone) async {
    return _postOtpMessage(ApiEndpoints.resendOtp, phone);
  }

  Future<SendOtpResponse> _postOtpMessage(String path, String phone) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: {'phone': phone},
      );
      final data = response.data;
      if (data == null) {
        throw AuthApiException('Empty response');
      }
      final parsed = SendOtpResponse.fromJson(data);
      if (!parsed.status) {
        throw AuthApiException(parsed.message);
      }
      return parsed;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<VerifyOtpResponse> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.verifyOtp,
        data: {'phone': phone, 'otp': otp},
      );
      final data = response.data;
      if (data == null) {
        throw AuthApiException('Empty response');
      }
      final parsed = VerifyOtpResponse.fromJson(data);
      if (!parsed.status) {
        throw AuthApiException(parsed.message);
      }
      final token = parsed.token;
      final user = parsed.user;
      if (token == null || token.isEmpty || user == null) {
        throw AuthApiException('Invalid login response');
      }
      await _storage.saveSession(token: token, user: user);
      return parsed;
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  AuthApiException _mapDio(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) {
        return AuthApiException(msg, statusCode: status);
      }
    }
    return AuthApiException(
      e.message ?? 'Network error',
      statusCode: status,
    );
  }
}
