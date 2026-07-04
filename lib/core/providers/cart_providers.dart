import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/commerce/cart_dtos.dart';
import '../repositories/cart_repository.dart';
import 'app_refresh_providers.dart';
import 'auth_providers.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(ref.watch(dioProvider));
});

final cartNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CartNotifier, CartResponse>(
  CartNotifier.new,
);

class CartNotifier extends AutoDisposeAsyncNotifier<CartResponse> {
  @override
  Future<CartResponse> build() {
    final repo = ref.watch(cartRepositoryProvider);
    return repo.fetchCart();
  }

  CartRepository get _repo => ref.read(cartRepositoryProvider);

  Future<void> addToCart(
    String productId, {
    num quantity = 1,
    bool preorder = false,
  }) async {
    await _repo.addToCart(
      productId: int.parse(productId),
      quantity: quantity,
      isPreorder: preorder,
    );
    await _reloadCartAndRefreshApp();
  }

  Future<void> setLineQuantity(String lineId, num newQuantity) async {
    // Only treat a non-positive quantity as removal. Minimums (1 kg for kg-wise,
    // 50 g for gram-wise) are enforced by the caller via CustomOrderQuantity, so
    // gram-wise lines below 1 kg (e.g. 0.55 kg) must NOT be auto-removed here.
    if (newQuantity <= 0) {
      await removeLine(lineId);
      return;
    }
    await _repo.updateLineQuantity(lineId, quantity: newQuantity);
    await _reloadCartOnly();
  }

  Future<void> removeLine(String lineId) async {
    await _repo.removeLine(lineId);
    await _reloadCartOnly();
  }

  /// Reloads only the cart (no catalog/banner/favorites refresh) — used for the
  /// high-frequency quantity +/- and remove actions so a single cart API call
  /// runs instead of a burst of unrelated requests.
  Future<void> _reloadCartOnly() async {
    final cart = await _repo.fetchCart();
    state = AsyncValue.data(cart);
  }

  Future<void> _reloadCartAndRefreshApp() async {
    final cart = await _repo.fetchCart();
    state = AsyncValue.data(cart);
    refreshAfterCartChange(ref, invalidateCart: false);
  }
}
