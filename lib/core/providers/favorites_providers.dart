import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/commerce/favorites_dtos.dart';
import '../repositories/favorites_repository.dart';
import 'auth_providers.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(ref.watch(dioProvider));
});

final favoritesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FavoritesNotifier, List<FavoriteProductDto>>(
  FavoritesNotifier.new,
);

class FavoritesNotifier
    extends AutoDisposeAsyncNotifier<List<FavoriteProductDto>> {
  @override
  Future<List<FavoriteProductDto>> build() {
    final repo = ref.watch(favoritesRepositoryProvider);
    return repo.fetchFavorites();
  }

  FavoritesRepository get _repo => ref.read(favoritesRepositoryProvider);

  Future<void> toggleFavorite(String productId) async {
    final current =
        state.asData?.value ?? await _repo.fetchFavorites();
    final exists = current.any((e) => e.id == productId);
    if (exists) {
      await _repo.removeFavorite(productId);
    } else {
      await _repo.addFavorite(int.parse(productId));
    }
    state = AsyncValue.data(await _repo.fetchFavorites());
  }
}

bool favoriteIdsContain(List<FavoriteProductDto> list, String productId) {
  return list.any((e) => e.id == productId);
}
