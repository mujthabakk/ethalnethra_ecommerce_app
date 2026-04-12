import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../api/dio_client.dart';
import '../repositories/auth_repository.dart';
import '../storage/auth_storage.dart';

final authStorageProvider = Provider<AuthStorage>((ref) {
  return AuthStorage();
});

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(authStorageProvider);
  return createDio(storage);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(dioProvider),
    ref.watch(authStorageProvider),
  );
});

/// UI state for send-OTP on the mobile number screen.
class SendOtpUiState {
  const SendOtpUiState({
    this.isLoading = false,
    this.errorMessage,
  });

  final bool isLoading;
  final String? errorMessage;

  SendOtpUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SendOtpUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class SendOtpNotifier extends Notifier<SendOtpUiState> {
  @override
  SendOtpUiState build() => const SendOtpUiState();

  /// Returns `true` when OTP was sent successfully.
  Future<bool> send(String phone) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await ref.read(authRepositoryProvider).sendOtp(phone);
      state = const SendOtpUiState();
      return true;
    } catch (e) {
      state = SendOtpUiState(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final sendOtpNotifierProvider =
    NotifierProvider<SendOtpNotifier, SendOtpUiState>(SendOtpNotifier.new);

/// UI state for resend OTP on the verification screen.
class ResendOtpUiState {
  const ResendOtpUiState({
    this.isLoading = false,
    this.errorMessage,
  });

  final bool isLoading;
  final String? errorMessage;

  ResendOtpUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ResendOtpUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class ResendOtpNotifier extends Notifier<ResendOtpUiState> {
  @override
  ResendOtpUiState build() => const ResendOtpUiState();

  /// Returns `true` when OTP was resent successfully.
  Future<bool> resend(String phone) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await ref.read(authRepositoryProvider).resendOtp(phone);
      state = const ResendOtpUiState();
      return true;
    } catch (e) {
      state = ResendOtpUiState(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final resendOtpNotifierProvider =
    NotifierProvider<ResendOtpNotifier, ResendOtpUiState>(
  ResendOtpNotifier.new,
);

/// UI state for verify OTP.
class VerifyOtpUiState {
  const VerifyOtpUiState({
    this.isLoading = false,
    this.errorMessage,
  });

  final bool isLoading;
  final String? errorMessage;

  VerifyOtpUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return VerifyOtpUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class VerifyOtpNotifier extends Notifier<VerifyOtpUiState> {
  @override
  VerifyOtpUiState build() => const VerifyOtpUiState();

  /// Returns `true` when login succeeded and session was saved.
  Future<bool> verify({
    required String phone,
    required String otp,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await ref.read(authRepositoryProvider).verifyOtp(phone: phone, otp: otp);
      state = const VerifyOtpUiState();
      return true;
    } catch (e) {
      state = VerifyOtpUiState(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final verifyOtpNotifierProvider =
    NotifierProvider<VerifyOtpNotifier, VerifyOtpUiState>(
  VerifyOtpNotifier.new,
);
