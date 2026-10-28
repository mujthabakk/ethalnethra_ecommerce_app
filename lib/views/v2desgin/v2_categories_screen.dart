import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';
import 'v2_colors.dart';

/// Figma Categories page — Ethalnethra mart only.
class V2CategoriesScreen extends StatefulWidget {
  const V2CategoriesScreen({super.key});

  @override
  State<V2CategoriesScreen> createState() => _V2CategoriesScreenState();
}

class _V2CategoriesScreenState extends State<V2CategoriesScreen> {
  static const _categories = [
    (V2Assets.catBakery, 'Bakery', Color(0xFFFFEFBE)),
    (V2Assets.catVegetables, 'Vegetables', Color(0xFFEAFDDD)),
    (V2Assets.catDairyEggs, 'Dairy & Eggs', Color(0xFFECEBE1)),
    (V2Assets.catMeats, 'Meats', Color(0xFFF38B7B)),
    (V2Assets.catSoftDrinks, 'Soft Drinks', Color(0xFFFFF9CC)),
    (V2Assets.catPackageFoods, 'Package Foods', Color(0xFFFFCCCC)),
  ];

  int _navIndex = 1; // search / categories active

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  _buildHeader(),
                  _buildSearchRow(),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 120 + bottomPad),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.92,
                      ),
                      itemCount: _categories.length,
                      itemBuilder: (context, i) {
                        final c = _categories[i];
                        return GestureDetector(
                          onTap: () => context.push(
                            AppRouter.v2CategoryProducts,
                            extra: c.$2,
                          ),
                          child: _CategoryCard(
                            image: c.$1,
                            title: c.$2,
                            color: c.$3,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 18,
              right: 18,
              bottom: 12 + (bottomPad > 0 ? bottomPad * 0.35 : 6),
              child: _buildFloatingNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          _circleBtn(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.v2Home);
              }
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              'Categories',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          _circleBtn(
            onTap: () {},
            child: Image.asset(
              V2Assets.catBagIcon,
              width: 18,
              height: 20,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn({required VoidCallback onTap, required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE8E8E8)),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Widget _buildSearchRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade600, size: 22),
                  const SizedBox(width: 10),
                  Text(
                    'Search Store',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              V2Assets.catFilterIcon,
              width: 22,
              height: 20,
              errorBuilder: (_, __, ___) => Icon(
                Icons.tune_rounded,
                color: Colors.grey.shade800,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNav() {
    final icons = <IconData>[
      Icons.storefront_outlined,
      Icons.manage_search_rounded,
      Icons.shopping_cart_outlined,
      Icons.favorite_border_rounded,
      Icons.person_outline_rounded,
    ];
    const radius = 34.0;

    return Container(
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.black.withValues(alpha: 0.24),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.18),
                width: 0.8,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(icons.length, (i) {
                final active = _navIndex == i;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (i == 0) {
                      context.go(AppRouter.v2Home);
                      return;
                    }
                    if (i == 2) {
                      context.push(AppRouter.v2Cart);
                      return;
                    }
                    if (i == 3) {
                      context.push(AppRouter.v2Wishlist);
                      return;
                    }
                    if (i == 4) {
                      context.push(AppRouter.v2Profile);
                      return;
                    }
                    setState(() => _navIndex = i);
                  },
                  child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: active ? 44 : 32,
                        height: active ? 44 : 32,
                        decoration: BoxDecoration(
                          color: active
                              ? V2Colors.darkGreen
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icons[i],
                          size: active ? 22 : 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.image,
    required this.title,
    required this.color,
  });

  final String image;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: 14,
            top: 14,
            right: 10,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
          Positioned(
            left: 8,
            right: -4,
            bottom: -6,
            top: 44,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              filterQuality: FilterQuality.high,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
