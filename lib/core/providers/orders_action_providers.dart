import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/orders/orders_models.dart';
import 'app_refresh_providers.dart';
import 'location_user_providers.dart';

/// One-shot place order; [autoDispose] clears state when checkout sheet closes.
final placeOrderNotifierProvider =
    AutoDisposeAsyncNotifierProvider<PlaceOrderNotifier, PlaceOrderResponse?>(
  PlaceOrderNotifier.new,
);

class PlaceOrderNotifier extends AutoDisposeAsyncNotifier<PlaceOrderResponse?> {
  @override
  Future<PlaceOrderResponse?> build() async => null;

  /// Instant cart → [OrdersRepository.placeInstantOrder]; pre-order tab → [placePreorderOrder].
  Future<PlaceOrderResponse?> submit({
    required bool isInstantCart,
    required int addressId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(ordersRepositoryProvider);
      final res = isInstantCart
          ? await repo.placeInstantOrder(addressId: addressId)
          : await repo.placePreorderOrder(addressId: addressId);
      refreshAfterCheckout(ref);
      state = AsyncValue.data(res);
      return res;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}
