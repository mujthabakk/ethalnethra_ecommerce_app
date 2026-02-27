import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../home/home_screen.dart';
import '../explore/explore_screen.dart';
import '../cart/cart_screen.dart';
import '../favourite/favourite_screen.dart';
import '../account/account_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
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
