import 'package:dio/dio.dart';

/// Thrown when an API request fails; [message] is safe to show in the UI.
class ApiException implements Exception {
  ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;

  factory ApiException.fromDio(DioException e) {
    final status = e.response?.statusCode;
    if (status == 401) {
      return ApiException('Please log in to continue', statusCode: status);
    }
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) {
        final lower = msg.toLowerCase();
        if (lower.contains('unauthenticated') ||
            lower.contains('unauthorize')) {
          return ApiException('Please log in to continue', statusCode: status);
        }
        return ApiException(msg, statusCode: status);
      }
      final err = data['error'];
      if (err is String && err.isNotEmpty) {
        return ApiException(err, statusCode: status);
      }
      final fieldMsg = _firstFieldError(data);
      if (fieldMsg != null) {
        return ApiException(fieldMsg, statusCode: status);
      }
    }
    return ApiException(
      e.message ?? 'Network error',
      statusCode: status,
    );
  }

  static String? _firstFieldError(Map<String, dynamic> data) {
    final errors = data['errors'];
    if (errors is! Map) return null;
    for (final value in errors.values) {
      if (value is List && value.isNotEmpty) {
        final first = value.first;
        if (first is String && first.isNotEmpty) return first;
      }
    }
    return null;
  }
}
