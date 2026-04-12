import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../models/auth/auth_user.dart';

/// Keys used by [GetStorage] for persisted auth.
abstract final class AuthStorageKeys {
  static const String token = 'auth_token';
  static const String userJson = 'auth_user_json';
}

/// Persists auth token and user after successful OTP verification.
class AuthStorage {
  AuthStorage([GetStorage? box]) : _box = box ?? GetStorage();

  final GetStorage _box;

  String? get token => _box.read<String>(AuthStorageKeys.token);

  AuthUser? get user {
    final raw = _box.read<String>(AuthStorageKeys.userJson);
    if (raw == null || raw.isEmpty) return null;
    try {
      return AuthUser.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveSession({
    required String token,
    required AuthUser user,
  }) async {
    await _box.write(AuthStorageKeys.token, token);
    await _box.write(
      AuthStorageKeys.userJson,
      jsonEncode(user.toJson()),
    );
  }

  Future<void> clear() async {
    await _box.remove(AuthStorageKeys.token);
    await _box.remove(AuthStorageKeys.userJson);
  }
}
