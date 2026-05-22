import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_providers.dart';
import 'catalog_providers.dart';
import 'favorites_providers.dart';
import 'location_user_providers.dart';

/// Matches [WidgetRef.invalidate] / [Ref.invalidate] in flutter_riverpod 2.x.
typedef _Invalidate = void Function(ProviderOrFamily provider);

void _refreshAfterCartChange(
  _Invalidate invalidate, {
  bool invalidateCart = true,
}) {
  if (invalidateCart) {
    invalidate(cartNotifierProvider);
  }
  invalidate(homeProductsProvider);
  invalidate(homeBannersProvider);
  invalidate(homeCategoriesProvider);
  invalidate(filtersProvider);
  invalidate(favoritesNotifierProvider);
}

void _refreshAfterCheckout(_Invalidate invalidate) {
  _refreshAfterCartChange(invalidate);
  invalidate(ordersListProvider);
  invalidate(userAddressesProvider);
  invalidate(userDetailsProvider);
}

/// Refreshes catalog + cart data (e.g. after add to cart or quantity change).
void refreshAfterCartChange(
  dynamic ref, {
  bool invalidateCart = true,
}) {
  _refreshAfterCartChange(ref.invalidate, invalidateCart: invalidateCart);
}

/// Refreshes all commerce-related APIs (e.g. after checkout / place order).
void refreshAfterCheckout(dynamic ref) {
  _refreshAfterCheckout(ref.invalidate);
}

/// Reloads cart from API and keeps [cartNotifierProvider] in sync.
Future<void> reloadCart(dynamic ref) async {
  ref.invalidate(cartNotifierProvider);
  await ref.read(cartNotifierProvider.future);
}

/// Full refresh used when opening checkout so address list is current.
Future<void> refreshCheckoutSheetData(dynamic ref) async {
  ref.invalidate(userAddressesProvider);
  await ref.read(userAddressesProvider.future);
}
