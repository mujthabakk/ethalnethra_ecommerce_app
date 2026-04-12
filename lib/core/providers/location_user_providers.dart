import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/location/area_item.dart';
import '../models/location/zone_item.dart';
import '../models/user/user_details_models.dart';
import '../repositories/locations_repository.dart';
import '../repositories/user_profile_repository.dart';
import 'auth_providers.dart';

final locationsRepositoryProvider = Provider<LocationsRepository>((ref) {
  return LocationsRepository(ref.watch(dioProvider));
});

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return UserProfileRepository(ref.watch(dioProvider));
});

final zonesProvider = FutureProvider.autoDispose<List<ZoneItem>>((ref) async {
  return ref.watch(locationsRepositoryProvider).fetchZones();
});

final areasForZoneProvider =
    FutureProvider.autoDispose.family<List<AreaItem>, int>((ref, zoneId) async {
  return ref.watch(locationsRepositoryProvider).fetchAreas(zoneId: zoneId);
});

final userDetailsProvider =
    FutureProvider.autoDispose<UserDetails>((ref) async {
  return ref.watch(userProfileRepositoryProvider).fetchUserDetails();
});

class SaveAddressUiState {
  const SaveAddressUiState({
    this.isLoading = false,
    this.errorMessage,
  });

  final bool isLoading;
  final String? errorMessage;

  SaveAddressUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SaveAddressUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class SaveAddressNotifier extends Notifier<SaveAddressUiState> {
  @override
  SaveAddressUiState build() => const SaveAddressUiState();

  Future<bool> submit({
    required String label,
    required int zoneId,
    required int areaId,
    required String addressLine,
    required String pincode,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await ref.read(userProfileRepositoryProvider).createAddress(
            label: label,
            zoneId: zoneId,
            areaId: areaId,
            addressLine: addressLine,
            pincode: pincode,
          );
      state = const SaveAddressUiState();
      return true;
    } catch (e) {
      state = SaveAddressUiState(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final saveAddressNotifierProvider =
    NotifierProvider<SaveAddressNotifier, SaveAddressUiState>(
  SaveAddressNotifier.new,
);

class UpdateProfileUiState {
  const UpdateProfileUiState({
    this.isLoading = false,
    this.errorMessage,
  });

  final bool isLoading;
  final String? errorMessage;

  UpdateProfileUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return UpdateProfileUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class UpdateProfileNotifier extends Notifier<UpdateProfileUiState> {
  @override
  UpdateProfileUiState build() => const UpdateProfileUiState();

  Future<bool> submit({
    required String name,
    required String email,
    required String phone,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await ref.read(userProfileRepositoryProvider).updateUserDetails(
            name: name,
            email: email,
            phone: phone,
          );
      ref.invalidate(userDetailsProvider);
      state = const UpdateProfileUiState();
      return true;
    } catch (e) {
      state = UpdateProfileUiState(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }
}

final updateProfileNotifierProvider =
    NotifierProvider<UpdateProfileNotifier, UpdateProfileUiState>(
  UpdateProfileNotifier.new,
);
