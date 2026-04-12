import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/commerce/cart_dtos.dart';
import '../repositories/cart_repository.dart';
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
    int quantity = 1,
    bool preorder = false,
  }) async {
    await _repo.addToCart(
      productId: int.parse(productId),
      quantity: quantity,
      isPreorder: preorder,
    );
    state = AsyncValue.data(await _repo.fetchCart());
  }

  Future<void> setLineQuantity(String lineId, int newQuantity) async {
    if (newQuantity < 1) {
      await removeLine(lineId);
      return;
    }
    await _repo.updateLineQuantity(lineId, quantity: newQuantity);
    state = AsyncValue.data(await _repo.fetchCart());
  }

  Future<void> removeLine(String lineId) async {
    await _repo.removeLine(lineId);
    state = AsyncValue.data(await _repo.fetchCart());
  }
}
