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

  /// [isInstantCart] → `standard` delivery; pre-order tab → `preorder`.
  /// Returns the response on success, `null` on failure (see [state] for error).
  Future<PlaceOrderResponse?> submit({
    required bool isInstantCart,
    required int addressId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final res = await ref.read(ordersRepositoryProvider).placeOrder(
            deliveryMethod: isInstantCart ? 'standard' : 'preorder',
            paymentMethod: 'cod',
            addressId: addressId,
          );
      refreshAfterCheckout(ref);
      state = AsyncValue.data(res);
      return res;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}
