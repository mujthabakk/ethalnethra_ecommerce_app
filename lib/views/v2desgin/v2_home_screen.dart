import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';
import 'v2_colors.dart';

/// V2 Ethalnethra home — Figma exact (#0E5A03 / #DEFFD9).
class V2HomeScreen extends StatefulWidget {
  const V2HomeScreen({super.key});

  @override
  State<V2HomeScreen> createState() => _V2HomeScreenState();
}

class _V2HomeScreenState extends State<V2HomeScreen> {
  int _serviceIndex = 0;
  int _bannerIndex = 0;
  int _bestValuePage = 0;
  int _navIndex = 0;
  bool _showDeliveryBar = true;
  final Map<int, int> _qty = {};

  static const _categories = [
    (V2Assets.categoryVeggies, 'Veggies'),
    (V2Assets.categoryFruits, 'Fruits'),
    (V2Assets.categoryDairy, 'Dairy'),
    (V2Assets.categoryMeats, 'Meats'),
    (V2Assets.categorySnaks, 'Snaks'),
    (V2Assets.categoryDrinks, 'Drinks'),
  ];

  static const _bestValues = [
    ('up to 50% OFF', 'Dairy & Egg', V2Assets.valueCard),
    ('up to 10% OFF', 'Snacks', V2Assets.categorySnaks),
    ('up to 30% OFF', 'Fresh orange', V2Assets.categoryFruits),
    ('up to 60% OFF', 'Veggies', V2Assets.produceBasket),
  ];

  static const _todaysDeals = [
    (V2Assets.categoryFruits, 'Fresh Banana', '1 kg', 100, 200),
    (V2Assets.categoryVeggies, 'Capsicum', '500 g', 80, 120),
    (V2Assets.categoryDairy, 'Cauliflower', '1 pc', 45, 60),
    (V2Assets.categoryDrinks, 'Fresh Juice', '1 L', 90, 140),
  ];

  bool get _isMart => _serviceIndex == 0;

  void _openCategories() {
    if (!_isMart) return;
    context.push(AppRouter.v2Categories);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: V2Colors.white,
      body: Stack(
        children: [
          if (_isMart)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      V2Colors.mint.withValues(alpha: 0.55),
                      V2Colors.white,
                      V2Colors.white,
                      V2Colors.mint.withValues(alpha: 0.25),
                    ],
                    stops: const [0.0, 0.18, 0.55, 1.0],
                  ),
                ),
              ),
            ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                _buildHeader(),
                _buildServiceTabs(),
                Expanded(
                  child: _isMart
                      ? CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(child: _buildSearchBar()),
                            ContainedSliver(child: _buildPromoBanner()),
                            ContainedSliver(child: _buildAiCard()),
                            SliverToBoxAdapter(
                              child: _buildSectionTitle(
                                'Shop by categories',
                                seeAll: true,
                              ),
                            ),
                            SliverToBoxAdapter(child: _buildCategories()),
                            ContainedSliver(
                              child: _buildSectionTitle('Best Value Days'),
                            ),
                            SliverToBoxAdapter(child: _buildBestValues()),
                            SliverToBoxAdapter(child: _buildBestValueDots()),
                            SliverToBoxAdapter(
                              child: _buildSectionTitle("Today's Deals"),
                            ),
                            ContainedSliver(child: _buildTodaysDeals()),
                            SliverToBoxAdapter(
                              child: SizedBox(height: 150 + bottomPad),
                            ),
                          ],
                        )
                      // Kitchen / Services — placeholder white for now
                      : const ColoredBox(color: Colors.white),
                ),
              ],
            ),
          ),
          if (_isMart && _showDeliveryBar)
            Positioned(
              left: 16,
              right: 16,
              bottom: 86 + (bottomPad > 0 ? bottomPad * 0.35 : 4),
              child: _buildDeliveryBar(),
            ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 12 + (bottomPad > 0 ? bottomPad * 0.35 : 6),
            child: _buildFloatingNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.push(AppRouter.selectLocation),
            child: _circleIcon(Icons.location_on_outlined, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => context.push(AppRouter.selectLocation),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery to',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: V2Colors.textSecondary,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Home, New York',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: V2Colors.textPrimary,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: V2Colors.textPrimary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.push(AppRouter.v2Notifications),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _circleIcon(Icons.notifications_none_rounded),
                Positioned(
                  right: 9,
                  top: 9,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE53935),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => context.push(AppRouter.v2Cart),
            child: _circleIcon(Icons.shopping_cart_outlined, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, {double size = 22}) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: V2Colors.iconChip,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size, color: V2Colors.textPrimary),
    );
  }

  Widget _buildServiceTabs() {
    final items = [
      (V2Assets.store, 'Ethalnethra\nmart'),
      (V2Assets.fastFood, 'Ethalnethra\nkitchen'),
      (V2Assets.customerService, 'Our\nServices'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = _serviceIndex == i;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (i == 1) {
                  context.go(AppRouter.kistcherHome);
                  return;
                }
                if (i == 2) {
                  context.push(AppRouter.kistcherBlank, extra: 'Our Services');
                  return;
                }
                setState(() => _serviceIndex = i);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                decoration: BoxDecoration(
                  color: V2Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: selected
                        ? V2Colors.darkGreen
                        : const Color(0xFFE8E8E8),
                    width: selected ? 1.6 : 1,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      items[i].$1,
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(Icons.store),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      items[i].$2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: V2Colors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: V2Colors.searchBar,
          borderRadius: BorderRadius.circular(24),
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
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
      child: Column(
        children: [
          // Figma: full-width mint card (~2:1), large produce on right
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final h = (w * 0.52).clamp(176.0, 220.0);
              final imgW = w * 0.56;
              return SizedBox(
                width: w,
                height: h,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: V2Colors.mint,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          right: -w * 0.04,
                          bottom: -h * 0.08,
                          width: imgW,
                          height: h * 1.08,
                          child: Image.asset(
                            V2Assets.bannerProduce,
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomRight,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (_, __, ___) => Image.asset(
                              V2Assets.produceBasket,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            18,
                            imgW * 0.72,
                            16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Up To 50%\nDiscount',
                                style: GoogleFonts.poppins(
                                  fontSize: w < 360 ? 22 : 26,
                                  fontWeight: FontWeight.w700,
                                  color: V2Colors.textPrimary,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Shop fresh products grab\nexclusive deals',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w500,
                                  color: V2Colors.darkGreen,
                                  height: 1.35,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: V2Colors.darkGreen,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  'Shop Now',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              final active = _bannerIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _bannerIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 20 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: active
                        ? V2Colors.darkGreen
                        : const Color(0xFFD0D0D0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAiCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
      child: GestureDetector(
        onTap: () => context.push(AppRouter.v2AiChat),
        child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: V2Colors.darkGreen, width: 1.2),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: V2Colors.darkGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New  ·  AI Assistant',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: V2Colors.textSecondary,
                    ),
                  ),
                  Text(
                    'Ask Ethal AI anything',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: V2Colors.textPrimary,
                    ),
                  ),
                  Text(
                    'Just say it, find it, order it — grocery shopping made easy.',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: V2Colors.textSecondary,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: V2Colors.textPrimary,
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool seeAll = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: V2Colors.textPrimary,
              ),
            ),
          ),
          if (seeAll)
            GestureDetector(
              onTap: _openCategories,
              child: Text(
                'see all',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: V2Colors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = _categories[i];
          return GestureDetector(
            onTap: _openCategories,
            child: SizedBox(
              width: 74,
              child: Column(
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      color: V2Colors.mint,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      item.$1,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.image_outlined),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.$2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: V2Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBestValues() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _bestValues.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = _bestValues[i];
          return Container(
            width: 128,
            decoration: BoxDecoration(
              gradient: V2Colors.promoGradient,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.$1,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: V2Colors.textPrimary,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.$2,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: V2Colors.textSecondary,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Image.asset(
                    item.$3,
                    height: 88,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_outlined, size: 48),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBestValueDots() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) {
          final active = _bestValuePage == i;
          return GestureDetector(
            onTap: () => setState(() => _bestValuePage = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color:
                    active ? V2Colors.darkGreen : const Color(0xFFD0D0D0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTodaysDeals() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _todaysDeals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, i) {
          final item = _todaysDeals[i];
          final qty = _qty[i] ?? 1;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7FBE8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          item.$1,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_outlined),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: const BoxDecoration(
                            color: V2Colors.dealBadge,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            '10% OFF',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: V2Colors.darkGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.$2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: V2Colors.textPrimary,
                  ),
                ),
                Text(
                  item.$3,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: V2Colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      '₹ ${item.$4}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: V2Colors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '₹ ${item.$5}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: V2Colors.textSecondary,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _qtyBtn(
                      Icons.add,
                      () => setState(() => _qty[i] = qty + 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        '$qty',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _qtyBtn(
                      Icons.remove,
                      () {
                        if (qty > 1) setState(() => _qty[i] = qty - 1);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: V2Colors.darkGreen,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          color: V2Colors.mint,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: V2Colors.darkGreen),
      ),
    );
  }

  Widget _buildDeliveryBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            color: V2Colors.darkGreen,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: V2Colors.darkGreen.withValues(alpha: 0.35),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: V2Colors.mint,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.local_shipping,
                  color: Colors.black87,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your delivery is on the way',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Arriving in : 20-30 min',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.push(AppRouter.v2OrderTracking),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Track',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -2,
          top: -10,
          child: GestureDetector(
            onTap: () => setState(() => _showDeliveryBar = false),
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingNav() {
    // Figma Frame 7322: fill #000000 @ 24% + Glass blur
    // Active circle #0E5A03 · inactive icons #FFFFFF
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
                    // Search tab → Categories (mart only)
                    if (i == 1) {
                      _openCategories();
                      return;
                    }
                    // Cart tab
                    if (i == 2) {
                      context.push(AppRouter.v2Cart);
                      return;
                    }
                    // Wishlist / favorites
                    if (i == 3) {
                      context.push(AppRouter.v2Wishlist);
                      return;
                    }
                    // Profile
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

/// Helper so section titles can sit in a sliver list cleanly.
class ContainedSliver extends StatelessWidget {
  const ContainedSliver({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(child: child);
}
