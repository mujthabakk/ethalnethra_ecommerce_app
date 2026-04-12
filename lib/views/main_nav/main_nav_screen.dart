import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/providers/main_nav_tab_provider.dart';
import '../home/home_screen.dart';
import '../explore/explore_screen.dart';
import '../cart/cart_screen.dart';
import '../favourite/favourite_screen.dart';
import '../account/account_screen.dart';

class MainNavScreen extends ConsumerWidget {
  const MainNavScreen({super.key});

  static const List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
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
              color: Colors.black.withOpacity(0.05),
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
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.darkBackground,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asstes/icons/ic_store_unselected.png',
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  'asstes/icons/ic_store_selected.png',
                  width: 40,
                  height: 40,
                  color: AppColors.primary,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asstes/icons/ic_search.png',
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  'asstes/icons/ic_search_selected.png',
                  width: 40,
                  height: 40,
                  color: AppColors.primary,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asstes/icons/ic_cart_unselected.png',
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  'asstes/icons/ic_cart_selected.png',
                  width: 40,
                  height: 40,
                  color: AppColors.primary,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asstes/icons/ic_favorite_unselected.png',
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  'asstes/icons/ic_favorite_selected.png',
                  width: 40,
                  height: 40,
                  color: AppColors.primary,
                ),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'asstes/icons/ic_profile_unselected.png',
                  width: 40,
                  height: 40,
                ),
                activeIcon: Image.asset(
                  'asstes/icons/ic_profile_selected.png',
                  width: 40,
                  height: 40,
                  color: AppColors.primary,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
