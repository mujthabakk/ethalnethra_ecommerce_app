import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';

/// Figma Kitchen product details — dark hero, concave-top frosted sheet that
/// fades from the blurred hero into `#FAF8EA`, accent `#F2D262`.
class KistcherProductScreen extends StatefulWidget {
  const KistcherProductScreen({
    super.key,
    this.title = 'Cheese with Chicken Burger',
    this.price = 200,
  });

  final String title;
  final int price;

  @override
  State<KistcherProductScreen> createState() => _KistcherProductScreenState();
}

class _KistcherProductScreenState extends State<KistcherProductScreen> {
  static const _bg = Color(0xFFFAF8EA);
  static const _heroDark = Color(0xFF14181D);
  static const _accent = Color(0xFFF2D262);
  static const _chipOff = Color(0xFFECEADF);
  static const _cardFill = Color(0xFFF7F4D3);
  static const _cardGlow = Color(0xFFFEFBDA);
  static const _iconBtn = Color(0xFFEEECD1);
  static const _qtyFill = Color(0xFFFBF7CF);
  static const _qtyBtn = Color(0xFFF5E393);
  static const _muted = Color(0xFF5A5954);
  static const _body = Color(0xFF6F6E68);

  // Figma: hero 440×380, sheet shoulders at 80% of the hero height.
  static const _heroAspect = 380 / 440;
  static const _sheetRatio = 0.8;
  static const _hazeHeight = 150.0;
  static const _hPad = 24.0;

  int _page = 0;
  int _size = 0;
  int _qty = 1;
  bool _liked = false;
  bool _descExpanded = false;

  static const _sizes = ['Small', 'Regular', 'Medium', 'Large'];

  static const _often = [
    _OftenItem('Shawarma Combo', 150, KistcherAssets.prodOften1),
    _OftenItem('Loaded Fries', 250, KistcherAssets.prodOften2),
    _OftenItem('Pizza', 250, KistcherAssets.prodOften3),
    _OftenItem('Loaded Fries', 250, KistcherAssets.prodOften2),
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final topPad = media.padding.top;
    final bottomPad = media.padding.bottom;
    final imageH = width * _heroAspect;
    final sheetY = imageH * _sheetRatio;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _bg,
        body: Stack(
          children: [
            // Hero — dark plate runs past the image so the sheet's blur
            // picks up the same smoky haze as Figma.
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: sheetY + _hazeHeight,
              child: ColoredBox(
                color: _heroDark,
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (_, __) => Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      KistcherAssets.prodHero,
                      width: width,
                      height: imageH,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ),

            // Page dots sit on the sheet's shoulder line
            Positioned(
              top: sheetY - 4,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  final on = _page == i;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    width: on ? 27 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: on
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),

            // Frosted concave sheet
            Positioned.fill(
              top: sheetY,
              child: ClipPath(
                clipper: const _ConcaveTopClipper(),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                        child: const SizedBox.expand(),
                      ),
                    ),
                    // Alpha ramp sampled from Figma: haze → solid cream.
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              _bg.withValues(alpha: 0.50),
                              _bg.withValues(alpha: 0.54),
                              _bg.withValues(alpha: 0.60),
                              _bg.withValues(alpha: 0.72),
                              _bg.withValues(alpha: 0.865),
                              _bg.withValues(alpha: 0.965),
                              _bg,
                              _bg,
                            ],
                            stops: _hazeStops(media.size.height - sheetY),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(
                          _hPad,
                          42,
                          _hPad,
                          96 + bottomPad,
                        ),
                        child: _buildContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top actions
            Positioned(
              top: topPad + 27,
              left: 28,
              right: 28,
              child: Row(
                children: [
                  _GlassCircleBtn(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  _GlassCircleBtn(
                    onTap: () => setState(() => _liked = !_liked),
                    child: Image.asset(
                      KistcherAssets.prodHeart,
                      width: 15,
                      height: 15,
                      color: _liked ? const Color(0xFFE53935) : Colors.white,
                      colorBlendMode: BlendMode.srcIn,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.favorite,
                        size: 15,
                        color: _liked ? const Color(0xFFE53935) : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: _bg,
                padding: EdgeInsets.fromLTRB(
                  _hPad - 4,
                  12,
                  _hPad,
                  16 + bottomPad,
                ),
                child: _buildBottomBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Maps the 150px Figma haze ramp onto the sheet's actual height.
  List<double> _hazeStops(double sheetH) {
    final h = sheetH <= 0 ? _hazeHeight : sheetH;
    double s(double px) => (px / h).clamp(0.0, 1.0);
    return [0, s(22), s(46), s(70), s(94), s(118), s(_hazeHeight), 1];
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              KistcherAssets.prodStar,
              width: 20,
              height: 19,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.star_rounded,
                size: 20,
                color: _accent,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '4.5',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 1.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '₹ ${widget.price}',
          style: GoogleFonts.poppins(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 26),
        _buildMetaRow(),
        const SizedBox(height: 26),
        _sectionTitle('Try these quick choices'),
        const SizedBox(height: 16),
        _buildSizes(),
        const SizedBox(height: 29),
        _buildDeliveryBoy(),
        const SizedBox(height: 24),
        _sectionTitle('Description'),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => _descExpanded = !_descExpanded),
          child: Text.rich(
            TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _body,
                height: 1.45,
              ),
              children: [
                TextSpan(
                  text: _descExpanded
                      ? 'Premium chicken burger topped with melted cheddar cheese, crispy bacon, fresh lettuce, and signature house sauce on a toasted brioche bun. Served hot and fresh every time you order. '
                      : 'Premium chicken burger topped with melted cheddar cheese, crispy bacon, fresh lettuce, and signature house sauce on a toasted brioche bun. ',
                ),
                TextSpan(
                  text: _descExpanded ? 'Less' : 'More...',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 19),
        Row(
          children: [
            _sectionTitle('Often Order with'),
            const Spacer(),
            Text(
              'See all',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 128,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: _often.length,
            separatorBuilder: (_, __) => const SizedBox(width: 13),
            itemBuilder: (_, i) => _OftenCard(item: _often[i]),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 13.5,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: 1.3,
      ),
    );
  }

  Widget _buildMetaRow() {
    Widget item(String asset, double size, String label, IconData fallback) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            width: size,
            height: size,
            errorBuilder: (_, __, ___) =>
                Icon(fallback, size: size, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            maxLines: 1,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.2,
            ),
          ),
        ],
      );
    }

    Widget divider() =>
        Container(width: 1, height: 26, color: Colors.black);

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - _hPad * 2 - 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              item(KistcherAssets.prodDelivery, 22, 'Free Delivery',
                  Icons.delivery_dining),
              divider(),
              item(KistcherAssets.prodClock, 19, '25 - 30 min',
                  Icons.schedule),
              divider(),
              item(KistcherAssets.prodFoodIcon, 19, '295 kcal',
                  Icons.local_fire_department),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizes() {
    return SizedBox(
      height: 27,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _sizes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 13),
        itemBuilder: (context, i) {
          final on = _size == i;
          return GestureDetector(
            onTap: () => setState(() => _size = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: on ? _accent : _chipOff,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                _sizes[i],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDeliveryBoy() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: _cardFill,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: _cardGlow, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.2),
            ),
            child: ClipOval(
              child: Image.asset(
                KistcherAssets.prodAvatar,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const ColoredBox(
                  color: _accent,
                  child: Icon(Icons.person, size: 22),
                ),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alan John',
                  style: GoogleFonts.poppins(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Delivery boy',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF5A594D),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          _IconCircle(
            child: Image.asset(
              KistcherAssets.prodChat,
              width: 18,
              height: 17,
              errorBuilder: (_, __, ___) => const Icon(Icons.sms, size: 17),
            ),
          ),
          const SizedBox(width: 15),
          _IconCircle(
            child: Image.asset(
              KistcherAssets.prodPhone,
              width: 12,
              height: 17,
              errorBuilder: (_, __, ___) => const Icon(Icons.phone, size: 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Row(
      children: [
        Container(
          width: 132,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: _qtyFill,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _QtyBtn(
                icon: Icons.add,
                onTap: () => setState(() => _qty++),
              ),
              Text(
                '$_qty',
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1,
                ),
              ),
              _QtyBtn(
                icon: Icons.remove,
                onTap: () {
                  if (_qty > 1) setState(() => _qty--);
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () => context.push(AppRouter.kistcherCart),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: _accent,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 23),
                  Text(
                    'Add to cart',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Figma sheet top: rounded shoulders with a shallow concave dip between.
class _ConcaveTopClipper extends CustomClipper<Path> {
  const _ConcaveTopClipper();

  static const _corner = 30.0;
  static const _edgeDrop = 24.0;
  static const _dip = 13.0;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    return Path()
      ..moveTo(0, _edgeDrop)
      ..cubicTo(0, 8, 10, 0, _corner, 0)
      // Quadratic control at 2×dip puts the midpoint exactly `_dip` lower.
      ..quadraticBezierTo(w / 2, _dip * 2, w - _corner, 0)
      ..cubicTo(w - 10, 0, w, 8, w, _edgeDrop)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Dark smoked-glass circle on the hero (back / like).
class _GlassCircleBtn extends StatelessWidget {
  const _GlassCircleBtn({required this.child, required this.onTap});
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
              color: Colors.white.withValues(alpha: 0.18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        color: _KistcherProductScreenState._iconBtn,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _QtyBtn extends StatelessWidget {
  const _QtyBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          color: _KistcherProductScreenState._qtyBtn,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }
}

class _OftenItem {
  const _OftenItem(this.name, this.price, this.image);
  final String name;
  final int price;
  final String image;
}

class _OftenCard extends StatelessWidget {
  const _OftenCard({required this.item});
  final _OftenItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 104,
              height: 88,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const ColoredBox(color: Color(0xFFFFF6A7)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '₹ ${item.price}',
            style: GoogleFonts.poppins(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
