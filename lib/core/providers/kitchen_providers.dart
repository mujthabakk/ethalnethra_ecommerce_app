import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/kitchen_repository.dart';
import 'auth_providers.dart';

final kitchenRepositoryProvider = Provider<KitchenRepository>((ref) {
  return KitchenRepository(ref.watch(dioProvider));
});

final servicesProvider = FutureProvider.autoDispose<List<ServiceTile>>((ref) async {
  return ref.watch(kitchenRepositoryProvider).fetchServices();
});

/// Loads kitchen home, then the dedicated category, deal, and restaurant
/// routes when the combined home payload is empty.
final kitchenHomeProvider =
    FutureProvider.autoDispose<KitchenHomeData>((ref) async {
  final repo = ref.watch(kitchenRepositoryProvider);
  try {
    await repo.fetchFilters();
  } catch (_) {}
  final home = await repo.fetchHome();
  if (home.categories.isNotEmpty ||
      home.restaurants.isNotEmpty ||
      home.deals.isNotEmpty) {
    return home;
  }
  final categories = await repo.fetchCategories();
  final deals = await repo.fetchHotDeals();
  final restaurants = await repo.fetchRestaurants();
  return KitchenHomeData(
    categories: categories,
    deals: deals,
    restaurants: restaurants,
    banners: home.banners,
  );
});

final kitchenSearchProvider = FutureProvider.autoDispose
    .family<List<KitchenRestaurant>, String>((ref, query) async {
  return ref.watch(kitchenRepositoryProvider).search(query);
});

final kitchenWishlistProvider =
    FutureProvider.autoDispose<List<KitchenMenuItem>>((ref) async {
  return ref.watch(kitchenRepositoryProvider).fetchWishlist();
});

final kitchenCartProvider = FutureProvider.autoDispose<KitchenCart>((ref) async {
  return ref.watch(kitchenRepositoryProvider).fetchCart();
});

final kitchenTrackProvider =
    FutureProvider.autoDispose.family<KitchenTrack, String>((ref, orderId) async {
  if (orderId.isEmpty) return const KitchenTrack();
  return ref.watch(kitchenRepositoryProvider).trackOrder(orderId);
});
