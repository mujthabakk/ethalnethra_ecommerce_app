import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import '../v2_assets.dart';
import 'kistcher_assets.dart';
import 'kistcher_curved_categories.dart';
import 'kistcher_glass.dart';

/// Figma Ethalnethra Kitchen home — dark hero, glass cards, curved categories.
class KistcherHomeScreen extends StatefulWidget {
  const KistcherHomeScreen({super.key});

  @override
  State<KistcherHomeScreen> createState() => _KistcherHomeScreenState();
}

class _KistcherHomeScreenState extends State<KistcherHomeScreen> {
  static const _bg = Color(0xFFFFFFFF);
  static const _yellow = Color(0xFFFFD600);
  static const _vegGreen = Color(0xFF2E7D32);

  bool _vegOnly = true;
  int _serviceIndex = 1; // kitchen selected

  static const _categories = [
    KistcherCategory(image: KistcherAssets.catPizza, label: 'Pizza'),
    KistcherCategory(image: KistcherAssets.catBurger, label: 'Burger'),
    KistcherCategory(image: KistcherAssets.catShawarma, label: 'Shawarma'),
    KistcherCategory(image: KistcherAssets.catBiriyani, label: 'Biriyani'),
    KistcherCategory(
      image: KistcherAssets.catLoadedFries,
      label: 'Loaded Fries',
    ),
  ];

  static const _hotDeals = [
    _HotDeal(
      image: KistcherAssets.hotNoodles,
      title: 'Noodles Twist',
      subtitle: 'with spicy sauce',
      price: 150,
      oldPrice: 250,
      discount: 25,
    ),
    _HotDeal(
      image: KistcherAssets.hotPizza,
      title: 'Pizza Slice',
      subtitle: 'with spicy sauce',
      price: 150,
      oldPrice: 250,
      discount: 25,
    ),
  ];

  static const _restaurants = [
    _RestCard(
      image: KistcherAssets.restBiryani,
      title: 'Sultan Kochi Biryani',
      rating: '4.5',
      range: '250-500',
      off: '25% OFF',
      mins: '22 mins',
    ),
    _RestCard(
      image: KistcherAssets.restBurger,
      title: 'Burger Combo | Burger House',
      rating: '4.5',
      range: '250-500',
      off: '25% OFF',
      mins: '18 mins',
    ),
    _RestCard(
      image: KistcherAssets.restDosa,
      title: 'Masala Dosa | Indian Coffe house',
      rating: '4.5',
      range: '250-500',
      off: '25% OFF',
      mins: '22 mins',
    ),
    _RestCard(
      image: KistcherAssets.restClub,
      title: 'Club Sandwich | Burger House',
      rating: '4.5',
      range: '250-500',
      off: '25% OFF',
      mins: '20 mins',
    ),
  ];

  void _onServiceTap(int i) {
    if (i == 0) {
      context.go(AppRouter.v2Home);
      return;
    }
    if (i == 2) {
      // Our Services — white for now
      context.push(AppRouter.kistcherBlank, extra: 'Our Services');
      return;
    }
    setState(() => _serviceIndex = i);
  }

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ColoredBox(
        color: _bg,
        child: Column(
          children: [
            // Banner stays pinned; only the content below scrolls.
            _buildDarkHeader(topPad),
            Expanded(child: _buildScrollBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollBody() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildServiceTabs()),
          SliverToBoxAdapter(
            child: KistcherCurvedCategories(
              categories: _categories,
              initialIndex: 2,
            ),
          ),
          ContainedSliver(child: _buildHotDeals()),
          ContainedSliver(child: _buildFlashBanner()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                child: _RestaurantCard(card: _restaurants[i]),
              ),
              childCount: _restaurants.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 110)),
        ],
      ),
    );
  }

  /// Figma: full-width dark hero (burger plate bg + promo + search).
  Widget _buildDarkHeader(double topPad) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
      child: SizedBox(
        height: topPad + 268,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Textured stone + burger plate (Figma Rectangle 323)
            Image.asset(
              KistcherAssets.bannerBg,
              fit: BoxFit.cover,
              alignment: const Alignment(0.55, 0),
              errorBuilder: (_, __, ___) =>
                  const ColoredBox(color: Color(0xFF121212)),
            ),
            // Left readability fade
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.78),
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.42, 0.78],
                ),
              ),
            ),
            // Soft top fade for status area
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.28],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, topPad + 6, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar · location · bell
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          KistcherAssets.avatar,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 40,
                            height: 40,
                            color: Colors.grey.shade700,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Delivery location',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFBDBDBD),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  KistcherAssets.locationPin,
                                  width: 13,
                                  height: 13,
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.location_on,
                                    size: 13,
                                    color: _yellow,
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Flexible(
                                  child: Text(
                                    'Mirpur, Dhaka Bangladesh',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 18,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.push(AppRouter.kistcherNotifications),
                        child: KistcherGlassCircle(
                          size: 40,
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // 15 % Extra DISCOUNT
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '15 % ',
                          style: GoogleFonts.poppins(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: _yellow,
                            height: 1.05,
                          ),
                        ),
                        TextSpan(
                          text: 'Extra\n',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.05,
                          ),
                        ),
                        TextSpan(
                          text: 'DISCOUNT',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enjoy your first order with a\nspecial discount !',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  const Spacer(),
                  // Search + VEG (light grey pills on dark hero)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.push(AppRouter.kistcherSearch),
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8E8E8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Search by name & restaurant',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _VegToggle(
                        value: _vegOnly,
                        onChanged: (v) => setState(() => _vegOnly = v),
                        green: _vegGreen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTabs() {
    final items = [
      (V2Assets.store, 'Ethalnethra\nmart'),
      (V2Assets.fastFood, 'Ethalnethra\nkitchen'),
      (V2Assets.customerService, 'Our\nServices'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = _serviceIndex == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => _onServiceTap(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selected ? _yellow : const Color(0xFFE8E8E8),
                    width: selected ? 1.8 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      items[i].$1,
                      height: 42,
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
                        color: Colors.black87,
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

  Widget _buildHotDeals() {
    // Title + cards as one block so floating food sits under "Hot deals" like Figma
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 0),
          child: Text(
            'Hot deals',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 292,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: const EdgeInsets.fromLTRB(18, 28, 18, 6),
            physics: const BouncingScrollPhysics(),
            itemCount: _hotDeals.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, i) => _HotDealCard(deal: _hotDeals[i]),
          ),
        ),
      ],
    );
  }

  Widget _buildFlashBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.alarm_rounded, color: Color(0xFFF9A825), size: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Save 30%',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Flash deals : Limited time offer',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            _TimerBlock(text: '05'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                ':',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            _TimerBlock(text: '12'),
          ],
        ),
      ),
    );
  }
}

class ContainedSliver extends StatelessWidget {
  const ContainedSliver({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(child: child);
}

class _VegToggle extends StatelessWidget {
  const _VegToggle({
    required this.value,
    required this.onChanged,
    required this.green,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color green;

  @override
  Widget build(BuildContext context) {
    // Figma: light grey pill, dark "VEG", green switch
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VEG',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                height: 1,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 34,
              height: 18,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: value ? green : Colors.grey.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimerBlock extends StatelessWidget {
  const _TimerBlock({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _HotDeal {
  const _HotDeal({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  final String image;
  final String title;
  final String subtitle;
  final int price;
  final int oldPrice;
  final int discount;
}

class _HotDealCard extends StatelessWidget {
  const _HotDealCard({required this.deal});
  final _HotDeal deal;

  // Tuned to Figma card proportions
  static const double _cardW = 168;
  static const double _bodyH = 200;
  static const double _imgH = 128;
  static const double _imgOverhang = 44;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _cardW,
      height: _imgOverhang + _bodyH,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: _imgOverhang,
            height: _bodyH,
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 12, 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  SizedBox(height: _imgH - _imgOverhang + 2),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '-${deal.discount} %',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    deal.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    deal.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9E9E9E),
                      height: 1.25,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '₹ ${deal.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '₹ ${deal.oldPrice}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9E9E9E),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: const Color(0xFF9E9E9E),
                          height: 1,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: -4,
            right: -4,
            height: _imgH,
            child: Image.asset(
              deal.image,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
              filterQuality: FilterQuality.high,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.fastfood, size: 72),
            ),
          ),
        ],
      ),
    );
  }
}

class _RestCard {
  const _RestCard({
    required this.image,
    required this.title,
    required this.rating,
    required this.range,
    required this.off,
    required this.mins,
  });

  final String image;
  final String title;
  final String rating;
  final String range;
  final String off;
  final String mins;
}

class _RestaurantCard extends StatefulWidget {
  const _RestaurantCard({required this.card});
  final _RestCard card;

  @override
  State<_RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<_RestaurantCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.card;
    return GestureDetector(
      onTap: () => context.push(
        AppRouter.kistcherRestaurant,
        extra: {
          'name': c.title.split('|').first.trim(),
          'subtitle': c.title.contains('|')
              ? c.title.split('|').last.trim()
              : 'Restaurant',
        },
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: SizedBox(
          height: 196,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                c.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const ColoredBox(color: Color(0xFF333333)),
              ),
              Positioned(
                left: 12,
                top: 12,
                child: KistcherGlassPill(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.schedule, size: 14, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        c.mins,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: GestureDetector(
                  onTap: () => setState(() => _liked = !_liked),
                  child: KistcherGlassCircle(
                    size: 36,
                    child: Icon(
                      _liked ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: _liked ? Colors.redAccent : Colors.white,
                    ),
                  ),
                ),
              ),
              // Figma Glass bar — black@20% + frost 4
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: KistcherGlass(
                  borderRadius: 20,
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                                children: [
                                  const WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.star_rounded,
                                      size: 13,
                                      color: Color(0xFFFFD600),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${c.rating}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  |  Price range ${c.range}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  |  ${c.off.replaceAll('%', ' %')}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFFF6B4A),
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.55),
                            width: 1.2,
                          ),
                        ),
                        child: const Icon(
                          Icons.north_east_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
