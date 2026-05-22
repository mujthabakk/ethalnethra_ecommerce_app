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
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) {
        return ApiException(msg, statusCode: status);
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
