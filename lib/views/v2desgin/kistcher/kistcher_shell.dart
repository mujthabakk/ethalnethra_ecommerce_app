import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'kistcher_assets.dart';
import 'kistcher_cart_screen.dart';
import 'kistcher_glass.dart';
import 'kistcher_home_screen.dart';
import 'kistcher_profile_screen.dart';
import 'kistcher_restaurant_screen.dart';
import 'kistcher_wishlist_screen.dart';

/// Kitchen shell — Home, Restaurant, Wishlist, Cart and Profile tabs.
class KistcherShell extends StatefulWidget {
  const KistcherShell({super.key});

  @override
  State<KistcherShell> createState() => _KistcherShellState();
}

class _KistcherShellState extends State<KistcherShell> {
  int _navIndex = 0;

  /// Scroll padding so tab content clears the floating nav bar.
  static const _navClearance = 84.0;

  void _goHome() => setState(() => _navIndex = 0);

  static const _tabs = [
    (KistcherAssets.navHome, 'Home'),
    (KistcherAssets.navCutlery, 'Kitchen'),
    (KistcherAssets.navHeart, 'Wishlist'),
    (KistcherAssets.navCart, 'Cart'),
    (KistcherAssets.navProfile, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _navIndex <= 1
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: _navIndex,
                children: [
                  const KistcherHomeScreen(),
                  KistcherRestaurantScreen(
                    onBack: _goHome,
                    bottomInset: _navClearance,
                  ),
                  KistcherWishlistScreen(
                    onBack: _goHome,
                    bottomInset: _navClearance,
                  ),
                  KistcherCartScreen(
                    onBack: _goHome,
                    bottomInset: _navClearance,
                  ),
                  KistcherProfileScreen(
                    onBack: _goHome,
                    bottomInset: _navClearance,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 10 + (bottomPad > 0 ? bottomPad * 0.35 : 4),
              child: _buildNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNav() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.22),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: KistcherGlass(
        borderRadius: 22,
        fillOpacity: 0.55,
        strokeOpacity: 0.12,
        frost: 6,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_tabs.length, (i) {
              final active = _navIndex == i;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _navIndex = i),
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: active ? 44 : 34,
                      height: active ? 44 : 34,
                      decoration: BoxDecoration(
                        color: active
                            ? Colors.white.withValues(alpha: 0.14)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(active ? 12 : 17),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(
                        _tabs[i].$1,
                        width: active ? 24 : 22,
                        height: active ? 24 : 22,
                        color: Colors.white,
                        colorBlendMode: BlendMode.srcIn,
                        errorBuilder: (_, __, ___) => Icon(
                          [
                            Icons.home_outlined,
                            Icons.restaurant_outlined,
                            Icons.favorite_border,
                            Icons.shopping_cart_outlined,
                            Icons.person_outline,
                          ][i],
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// Standalone white page (e.g. Our Services from kitchen home).
class KistcherBlankScreen extends StatelessWidget {
  const KistcherBlankScreen({super.key, this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(title),
      ),
      body: const SizedBox.expand(child: ColoredBox(color: Colors.white)),
    );
  }
}
