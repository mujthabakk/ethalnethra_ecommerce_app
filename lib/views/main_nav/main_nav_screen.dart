import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/providers/favorites_providers.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/providers/main_nav_tab_provider.dart';
import '../home/home_screen.dart';
import '../explore/explore_screen.dart';
import '../cart/cart_screen.dart';
import '../favourite/favourite_screen.dart';
import '../account/account_screen.dart';
import 'widgets/nav_icon.dart';

class MainNavScreen extends ConsumerWidget {
  const MainNavScreen({super.key});

  /// Index 0 = Categories (initial home page).
  static const List<Widget> _screens = [
    ExploreScreen(),
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(mainNavTabIndexProvider);

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(mainNavTabIndexProvider.notifier).state = index;
              _refreshTabData(ref, index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.darkBackground,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: NavIcon(
                  svgPath: 'asstes/icons/search.svg',
                  pngFallback: 'asstes/icons/ic_search.png',
                ),
                activeIcon: NavIcon(
                  svgPath: 'asstes/icons/search(selected).svg',
                  pngFallback: 'asstes/icons/ic_search_selected.png',
                  selected: true,
                  selectedColor: AppColors.primary,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: NavIcon(
                  svgPath: 'asstes/icons/home.svg',
                  pngFallback: 'asstes/icons/ic_store_unselected.png',
                ),
                activeIcon: NavIcon(
                  svgPath: 'asstes/icons/home (selected).svg',
                  pngFallback: 'asstes/icons/ic_store_selected.png',
                  selected: true,
                  selectedColor: AppColors.primary,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: NavIcon(
                  svgPath: 'asstes/icons/cart.svg',
                  pngFallback: 'asstes/icons/ic_cart_unselected.png',
                ),
                activeIcon: NavIcon(
                  svgPath: 'asstes/icons/cart(selected).svg',
                  pngFallback: 'asstes/icons/ic_cart_selected.png',
                  selected: true,
                  selectedColor: AppColors.primary,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: NavIcon(
                  svgPath: 'asstes/icons/fav.svg',
                  pngFallback: 'asstes/icons/ic_favorite_unselected.png',
                ),
                activeIcon: NavIcon(
                  svgPath: 'asstes/icons/fav(selected).svg',
                  pngFallback: 'asstes/icons/ic_favorite_selected.png',
                  selected: true,
                  selectedColor: AppColors.primary,
                ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: NavIcon(
                  svgPath: 'asstes/icons/Account.svg',
                  pngFallback: 'asstes/icons/ic_profile_unselected.png',
                ),
                activeIcon: NavIcon(
                  svgPath: 'asstes/icons/Account(selected).svg',
                  pngFallback: 'asstes/icons/ic_profile_selected.png',
                  selected: true,
                  selectedColor: AppColors.primary,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _refreshTabData(WidgetRef ref, int index) {
    switch (index) {
      case 0: // Categories
        ref.invalidate(homeCategoriesProvider);
        ref.invalidate(homeProductsProvider);
        ref.invalidate(filtersProvider);
        break;
      case 1: // Shop
        ref.invalidate(homeBannersProvider);
        ref.invalidate(homeCategoriesProvider);
        ref.invalidate(homeProductsProvider);
        ref.invalidate(filtersProvider);
        break;
      case 2: // Cart
        ref.invalidate(cartNotifierProvider);
        break;
      case 3: // Favourite
        ref.invalidate(favoritesNotifierProvider);
        break;
      case 4: // Account
        ref.invalidate(userDetailsProvider);
        ref.invalidate(userAddressesProvider);
        break;
    }
  }
}
