import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';
import 'kistcher_page_header.dart';

/// Figma Kitchen "My Cart" — yellow → white page gradient, glass item cards,
/// pill promo field, dashed bill summary, `#F8D148` pay button.
class KistcherCartScreen extends StatefulWidget {
  const KistcherCartScreen({super.key, this.onBack, this.bottomInset = 0});

  /// Overrides the back button (used when shown as a shell tab).
  final VoidCallback? onBack;

  /// Extra scroll padding for an overlaid nav bar.
  final double bottomInset;

  @override
  State<KistcherCartScreen> createState() => _KistcherCartScreenState();
}

class _KistcherCartScreenState extends State<KistcherCartScreen> {
  static const _accent = Color(0xFFF2D262);
  static const _payBtn = Color(0xFFF8D148);
  static const _hPad = 25.0;
  static const _innerPad = 33.0;
  static const _delivery = 100;
  static const _discount = 100;

  final _items = <_CartItem>[
    _CartItem('Cheese with Chicken Burger', 'Burger House', 250,
        KistcherAssets.cartBurger, 1),
    _CartItem('Club Sandwich', 'Burger House', 550,
        KistcherAssets.cartSandwich, 2),
    _CartItem('Rameshwaram Idli', 'Arya Bhavan', 250,
        KistcherAssets.cartIdli, 1),
  ];

  int get _subtotal =>
      _items.fold(0, (sum, item) => sum + item.price * item.qty);

  int get _total => _items.isEmpty ? 0 : _subtotal + _delivery - _discount;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: kistcherPageGradient),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              0,
              media.padding.top + 23,
              0,
              30 + media.padding.bottom + widget.bottomInset,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: KistcherPageHeader(
                    title: 'My Cart',
                    onBack: widget.onBack,
                  ),
                ),
                const SizedBox(height: 34),
                for (var i = 0; i < _items.length; i++) ...[
                  if (i > 0) const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: _hPad),
                    child: _CartCard(
                      item: _items[i],
                      onAdd: () => setState(() => _items[i].qty++),
                      onRemove: () => setState(() {
                        if (_items[i].qty > 1) _items[i].qty--;
                      }),
                      onDelete: () => setState(() => _items.removeAt(i)),
                    ),
                  ),
                ],
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _innerPad),
                  child: _buildPromo(),
                ),
                const SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.only(left: _innerPad, right: 40),
                  child: _buildSummary(),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: _innerPad),
                  child: GestureDetector(
                    onTap: () => context.push(AppRouter.kistcherReview),
                    child: Container(
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _payBtn,
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Text(
                        'Make Payment',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromo() {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFEE9),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black, width: 1.2),
      ),
      child: Row(
        children: [
          Image.asset(
            KistcherAssets.cartPromo,
            width: 25,
            height: 25,
            errorBuilder: (_, __, ___) => const Icon(Icons.discount_outlined),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: 'Promo Code',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: 94,
              height: 29,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _accent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Apply',
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    Widget row(String label, int value, {bool bold = false}) {
      final style = GoogleFonts.poppins(
        fontSize: bold ? 14.5 : 13.5,
        fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        color: bold ? Colors.black : const Color(0xFF545451),
      );
      return SizedBox(
        height: 38,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Text(label, style: style),
              const Spacer(),
              Text('₹ $value', style: style),
            ],
          ),
        ),
      );
    }

    const dash = Padding(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      child: KistcherDashedLine(color: Color(0xFF81817D)),
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          row('Subtotal', _subtotal),
          dash,
          row('Delivery', _items.isEmpty ? 0 : _delivery),
          dash,
          row('Discount', _items.isEmpty ? 0 : _discount),
          dash,
          const SizedBox(height: 6),
          row('Total', _total, bold: true),
        ],
      ),
    );
  }
}

/// Page background shared by the Kitchen sub-pages (sampled from Figma).
const kistcherPageGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFF7F59E),
    Color(0xFFFBF7AE),
    Color(0xFFFDFBC9),
    Color(0xFFFEFDE2),
    Color(0xFFFFFEF4),
    Colors.white,
  ],
  stops: [0.0, 0.08, 0.2, 0.33, 0.42, 0.55],
);

class KistcherDashedLine extends StatelessWidget {
  const KistcherDashedLine({
    super.key,
    required this.color,
    this.dash = 7,
    this.gap = 5,
  });

  final Color color;
  final double dash;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 1),
      painter: _DashPainter(color: color, dash: dash, gap: gap),
    );
  }
}

class _DashPainter extends CustomPainter {
  const _DashPainter({
    required this.color,
    required this.dash,
    required this.gap,
  });

  final Color color;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += dash + gap) {
      canvas.drawLine(
        Offset(x, 0.5),
        Offset((x + dash).clamp(0, size.width), 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashPainter old) =>
      old.color != color || old.dash != dash || old.gap != gap;
}

class _CartItem {
  _CartItem(this.name, this.shop, this.price, this.image, this.qty);
  final String name;
  final String shop;
  final int price;
  final String image;
  int qty;
}

/// Frosted yellow glass card with inset photo and qty pill.
class _CartCard extends StatelessWidget {
  const _CartCard({
    required this.item,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  final _CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      padding: const EdgeInsets.fromLTRB(11, 11, 13, 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFFF3F1B8), Color(0xFFFDFBC5), Color(0xFFFFFDC3)],
          stops: [0.0, 0.35, 1.0],
        ),
        border: Border.all(color: const Color(0xFFFEFDE0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEDE5AE).withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const ColoredBox(
                color: Color(0xFFEDE5AE),
                child: SizedBox(width: 90, height: 90),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEFDE0),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          KistcherAssets.cartTrash,
                          width: 11,
                          height: 13,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.delete_outline, size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  item.shop,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF5B5A45),
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '₹ ${item.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),
                    ),
                    _QtyPill(qty: item.qty, onAdd: onAdd, onRemove: onRemove),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyPill extends StatelessWidget {
  const _QtyPill({
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    Widget btn(IconData icon, Color color, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(icon, size: 17, color: Colors.black),
        ),
      );
    }

    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFC8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          btn(Icons.add, const Color(0xFFFFF8B1), onAdd),
          SizedBox(
            width: 32,
            child: Text(
              '$qty',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          btn(Icons.remove, const Color(0xFFFBE38F), onRemove),
        ],
      ),
    );
  }
}
