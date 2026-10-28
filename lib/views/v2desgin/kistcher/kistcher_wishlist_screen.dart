import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';
import 'kistcher_page_header.dart';

/// Figma Kitchen "My wishlist" — search + filter, category chips,
/// 2-column white cards with in-stock badge, Add to cart and Remove.
class KistcherWishlistScreen extends StatefulWidget {
  const KistcherWishlistScreen({super.key, this.onBack, this.bottomInset = 0});

  /// Overrides the back button (used when shown as a shell tab).
  final VoidCallback? onBack;

  /// Extra scroll padding for an overlaid nav bar.
  final double bottomInset;

  @override
  State<KistcherWishlistScreen> createState() => _KistcherWishlistScreenState();
}

class _KistcherWishlistScreenState extends State<KistcherWishlistScreen> {
  static const _ink = Color(0xFF181724);
  static const _accent = Color(0xFFF2D262);
  static const _addBtn = Color(0xFFE6BD42);
  static const _green = Color(0xFF3C8023);

  static const _pageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFDC0),
      Color(0xFFFFFDCB),
      Color(0xFFFFFED7),
      Color(0xFFFFFEE4),
      Color(0xFFFFFFEF),
      Color(0xFFFFFFFB),
    ],
    stops: [0.0, 0.19, 0.38, 0.57, 0.76, 0.95],
  );

  static const _chips = ['All items', 'Fruits', 'Vegetables', 'Dairy'];

  final _items = <(String, int, String)>[
    ('Podi Idli', 100, KistcherAssets.wishPodiIdli),
    ('Burger Combo', 100, KistcherAssets.wishBurgerCombo),
    ('Masala Dosa', 100, KistcherAssets.wishMasalaDosa),
    ('Chicken biriyani', 100, KistcherAssets.wishBiriyani),
  ];

  int _chip = 0;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final visible = _items
        .where((e) => e.$1.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: _pageGradient),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(29, media.padding.top + 20, 29, 0),
                sliver: SliverList.list(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 27),
                    _buildSearch(),
                    const SizedBox(height: 29),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: _buildChips()),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  42,
                  29,
                  41,
                  30 + media.padding.bottom + widget.bottomInset,
                ),
                sliver: SliverGrid.builder(
                  itemCount: visible.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 42,
                    mainAxisSpacing: 28,
                    mainAxisExtent: 320,
                  ),
                  itemBuilder: (context, i) {
                    final item = visible[i];
                    return _WishCard(
                      name: item.$1,
                      price: item.$2,
                      image: item.$3,
                      onAdd: () => context.push(AppRouter.kistcherCart),
                      onRemove: () => setState(() => _items.remove(item)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'My wishlist',
            style: GoogleFonts.poppins(
              fontSize: 16.5,
              fontWeight: FontWeight.w500,
              color: _ink,
            ),
          ),
          Positioned(
            left: 0,
            child: KistcherBackCircle(
              size: 44,
              onTap: widget.onBack ?? () => context.pop(),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () => context.push(AppRouter.kistcherCart),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.35),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE8E4A6).withValues(alpha: 0.6),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  KistcherAssets.wishCartSvg,
                  width: 24,
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            padding: const EdgeInsets.only(left: 18, right: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 22, color: Colors.black),
                const SizedBox(width: 9),
                Expanded(
                  child: TextField(
                    onChanged: (v) => setState(() => _query = v),
                    cursorColor: Colors.black,
                    style: GoogleFonts.poppins(fontSize: 13, color: _ink),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Search your wishlist',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 11),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(KistcherAssets.wishFilter, width: 20, height: 19),
        ),
      ],
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 37),
        itemCount: _chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, i) {
          final on = _chip == i;
          return GestureDetector(
            onTap: () => setState(() => _chip = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: on ? _accent : const Color(0xFFFEF9BA),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: on ? _accent : const Color(0xFFD7D39E),
                ),
              ),
              child: Text(
                _chips[i],
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: on ? Colors.black : const Color(0xFF454332),
                  height: 1.2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WishCard extends StatelessWidget {
  const _WishCard({
    required this.name,
    required this.price,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  });

  final String name;
  final int price;
  final String image;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 98,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 14,
                  right: 9,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_vert,
                      size: 11,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: _KistcherWishlistScreenState._ink,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '₹ $price',
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: _KistcherWishlistScreenState._ink,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 15,
                color: _KistcherWishlistScreenState._green,
              ),
              const SizedBox(width: 9),
              Text(
                'In stock',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: _KistcherWishlistScreenState._green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _KistcherWishlistScreenState._addBtn,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Text(
                'Add to cart',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onRemove,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(KistcherAssets.wishRemove, width: 16, height: 12),
                const SizedBox(width: 2),
                Text(
                  'Remove',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF575757),
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
