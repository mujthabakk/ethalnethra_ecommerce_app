import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/orders/orders_models.dart';
import 'app_refresh_providers.dart';
import 'location_user_providers.dart';

/// Params for [checkoutPreviewProvider].
class CheckoutPreviewParams {
  const CheckoutPreviewParams({
    required this.addressId,
    required this.isInstantCart,
  });

  final int addressId;
  final bool isInstantCart;

  String get type => isInstantCart ? 'instant' : 'preorder';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutPreviewParams &&
          addressId == other.addressId &&
          isInstantCart == other.isInstantCart;

  @override
  int get hashCode => Object.hash(addressId, isInstantCart);
}

/// Preview totals + reward wallet from POST `/api/orders/checkout`.
final checkoutPreviewProvider = FutureProvider.autoDispose
    .family<CheckoutResponse, CheckoutPreviewParams>((ref, params) async {
  return ref.watch(ordersRepositoryProvider).checkout(
        addressId: params.addressId,
        type: params.type,
      );
});

/// One-shot place order / create payment; clears when checkout sheet closes.
final placeOrderNotifierProvider =
    AutoDisposeAsyncNotifierProvider<PlaceOrderNotifier, PlaceOrderResponse?>(
  PlaceOrderNotifier.new,
);

class PlaceOrderNotifier extends AutoDisposeAsyncNotifier<PlaceOrderResponse?> {
  @override
  Future<PlaceOrderResponse?> build() async => null;

  /// COD → place / place-preorder. ONLINE → create-payment (caller opens link).
  Future<PlaceOrderResponse?> submitCod({
    required bool isInstantCart,
    required int addressId,
    bool useRewardCoins = false,
  }) async {
    state = const AsyncValue.loading();
    try {
      final res = await ref.read(ordersRepositoryProvider).placeOrder(
            addressId: addressId,
            paymentMethod: PaymentMethod.cod,
            isInstantCart: isInstantCart,
            useRewardCoins: useRewardCoins,
          );
      refreshAfterCheckout(ref);
      state = AsyncValue.data(res);
      return res;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<CreatePaymentResponse?> createOnlinePayment({
    required bool isInstantCart,
    required int addressId,
    bool useRewardCoins = false,
  }) async {
    state = const AsyncValue.loading();
    try {
      final type = isInstantCart ? 'instant' : 'preorder';
      final payment = await ref.read(ordersRepositoryProvider).createPayment(
            addressId: addressId,
            type: type,
            useRewardCoins: useRewardCoins,
          );
      // Keep notifier idle so UI can open WebView; do not treat as placed yet.
      state = const AsyncValue.data(null);
      return payment;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  void markOnlinePaymentComplete(PlaceOrderResponse? result) {
    refreshAfterCheckout(ref);
    state = AsyncValue.data(result);
  }
}
