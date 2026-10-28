import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';

/// Figma Kitchen restaurant menu — rounded yellow sheet over the hero,
/// sheet gradient `#FFFDB5 → #FFFFF7`, accent `#F2D262`, cart `#F8D749`.
class KistcherRestaurantScreen extends StatefulWidget {
  const KistcherRestaurantScreen({
    super.key,
    this.name = 'KFC',
    this.subtitle = 'Kentucky fried chicken',
    this.onBack,
    this.bottomInset = 0,
  });

  final String name;
  final String subtitle;

  /// Overrides the back button (used when shown as a shell tab).
  final VoidCallback? onBack;

  /// Extra scroll padding for an overlaid nav bar.
  final double bottomInset;

  @override
  State<KistcherRestaurantScreen> createState() =>
      _KistcherRestaurantScreenState();
}

class _KistcherRestaurantScreenState extends State<KistcherRestaurantScreen> {
  static const _sheetTop = Color(0xFFFFFDB5);
  static const _sheetMid = Color(0xFFFFFDCC);
  static const _sheetLow = Color(0xFFFFFEE0);
  static const _sheetEnd = Color(0xFFFFFFF7);
  static const _accent = Color(0xFFF2D262);
  static const _chipFill = Color(0xFFFFFDC2);
  static const _chipBorder = Color(0xFFF8E996);
  static const _chipText = Color(0xFF5B5B48);
  static const _tagText = Color(0xFF4C4C37);

  // Figma: sheet starts at 83% of hero height, logo pokes 32 above it.
  static const _heroAspect = 251 / 440;
  static const _sheetRatio = 0.83;
  static const _sheetRadius = 36.0;
  static const _logoSize = 114.0;
  static const _logoLift = 32.0;
  static const _hPad = 24.0;

  int _catIndex = 0;
  bool _liked = false;

  static const _categories = [
    'Popular',
    'Chicken buckets',
    'Burgers',
    'Sides',
    'Beverages',
  ];

  static const _offers = [
    ('50% OFF', 'Minimum order ₹200.Valid for all items. Auto applied.'),
    ('30% OFF', 'Minimum order ₹200.Valid for all items. Auto applied.'),
  ];

  static const _menu = [
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
    _MenuItem(
      name: 'Big Mac Burger',
      price: 250,
      image: KistcherAssets.restMenuBurger,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final heroH = width * _heroAspect;
    final sheetY = heroH * _sheetRatio;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _sheetEnd,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              // Hero (painted first so the sheet sits over it)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: heroH,
                child: Image.asset(
                  KistcherAssets.restHero,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (_, __, ___) =>
                      const ColoredBox(color: Color(0xFF881A11)),
                ),
              ),

              // Rounded yellow sheet
              Padding(
                padding: EdgeInsets.only(top: sheetY),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: media.size.height - sheetY,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(_sheetRadius),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [_sheetTop, _sheetMid, _sheetLow, _sheetEnd],
                      stops: [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIdentity(),
                      const SizedBox(height: 28),
                      _buildDeliveryBar(),
                      const SizedBox(height: 22),
                      _buildPromoRow(),
                      const SizedBox(height: 20),
                      _buildCategories(),
                      const SizedBox(height: 31),
                      _buildMenuGrid(),
                      SizedBox(
                        height: 24 + media.padding.bottom + widget.bottomInset,
                      ),
                    ],
                  ),
                ),
              ),

              // Logo overlapping hero + sheet
              Positioned(
                top: sheetY - _logoLift,
                left: 20,
                child: _buildLogo(),
              ),

              // Top actions
              Positioned(
                top: media.padding.top + 4,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    _FrostedCircleBtn(
                      onTap: widget.onBack ?? () => context.pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    _FrostedCircleBtn(
                      onTap: () => setState(() => _liked = !_liked),
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: _liked ? const Color(0xFFE53935) : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    _FrostedCircleBtn(
                      onTap: () {},
                      child: const Icon(
                        Icons.share_outlined,
                        size: 18,
                        color: Colors.white,
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
  }

  Widget _buildLogo() {
    return Container(
      width: _logoSize,
      height: _logoSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.2),
      ),
      padding: const EdgeInsets.all(14),
      child: Image.asset(
        KistcherAssets.restLogo,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            widget.name,
            style: GoogleFonts.poppins(
              color: const Color(0xFFE4002B),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIdentity() {
    return Padding(
      // Text column starts right of the logo (20 + 114 + 9).
      padding: const EdgeInsets.fromLTRB(143, 14, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      KistcherAssets.restVerified,
                      width: 16,
                      height: 16,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.verified,
                        size: 16,
                        color: Color(0xFF4A90D9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Chicken • Fast food • Burgers',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: _tagText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFFEDE6A8), Color(0xFFF7F1B4)],
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  KistcherAssets.restStar,
                  width: 14,
                  height: 14,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: Color(0xFFF8D749),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '4.3 (120)',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _hPad),
      child: Container(
        height: 69,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                color: _accent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                KistcherAssets.restDelivery,
                width: 24,
                height: 24,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.delivery_dining, size: 24),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Time: 10 - 20 min',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Free delivery within 3 km',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoRow() {
    return SizedBox(
      height: 76,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: _hPad),
        itemCount: _offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (_, i) =>
            _PromoCard(title: _offers[i].$1, body: _offers[i].$2),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 33,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: _hPad),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, i) {
          final active = _catIndex == i;
          return GestureDetector(
            onTap: () => setState(() => _catIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? _accent : _chipFill,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: active ? _accent : _chipBorder,
                  width: 1,
                ),
              ),
              child: Text(
                _categories[i],
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: active ? Colors.black : _chipText,
                  height: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _hPad),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _menu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 22,
          crossAxisSpacing: 14,
          mainAxisExtent: 191,
        ),
        itemBuilder: (context, i) => _MenuCard(item: _menu[i]),
      ),
    );
  }
}

/// Frosted white circle over the red hero (back / like / share).
class _FrostedCircleBtn extends StatelessWidget {
  const _FrostedCircleBtn({required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.3),
              border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Ticket-shaped offer card; the notched outline + watermark come from the
/// Figma export `Frame 7757`.
class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 206,
      height: 76,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              KistcherAssets.restPromoTicket,
              fit: BoxFit.fill,
              errorBuilder: (_, __, ___) => DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFECB),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFF8E996)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 14, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      KistcherAssets.restPercentBadge,
                      width: 20,
                      height: 20,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.discount, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Text(
                    body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF666551),
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem({
    required this.name,
    required this.price,
    required this.image,
  });
  final String name;
  final int price;
  final String image;
}

/// White card, inset image (name tab flush left), cream price row.
class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.item});
  final _MenuItem item;

  static const _priceRow = Color(0xFFFEF9E0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRouter.kistcherProduct,
        extra: {'title': item.name, 'price': item.price},
      ),
      child: Container(
        padding: const EdgeInsets.all(5.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const ColoredBox(color: Color(0xFFE0E0E0)),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 15,
                      child: Container(
                        height: 25,
                        constraints: const BoxConstraints(maxWidth: 130),
                        padding: const EdgeInsets.only(left: 7, right: 10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 31,
              padding: const EdgeInsets.only(left: 6, right: 4),
              decoration: BoxDecoration(
                color: _priceRow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    '₹ ${item.price}',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    KistcherAssets.restCartBtn,
                    width: 27,
                    height: 27,
                    errorBuilder: (_, __, ___) => Container(
                      width: 27,
                      height: 27,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8D749),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined, size: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
