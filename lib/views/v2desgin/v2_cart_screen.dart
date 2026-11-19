import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/models/commerce/cart_dtos.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_network_image.dart';

/// Figma My Cart — Instant / Pre-order tabs + pastel item rows.
class V2CartScreen extends ConsumerStatefulWidget {
  const V2CartScreen({super.key});

  @override
  ConsumerState<V2CartScreen> createState() => _V2CartScreenState();
}

class _V2CartScreenState extends ConsumerState<V2CartScreen> {
  static const _green = Color(0xFF0E5A03);

  int _tab = 0; // 0 Instant, 1 Pre-order
  List<_CartItem> _items = const [];
  String? _cartError;
  bool _cartLoading = true;

  int get _itemTotal =>
      _items.fold(0, (sum, e) => sum + e.subtotal.round());

  List<_CartItem> _mapLines(List<CartLineDto> lines) {
    const palettes = [
      (Color(0xFFFFECEC), Color(0x2BFFA9A9), Color(0xFFFFA9A9)),
      (Color(0xFFE7FFC8), Color(0xC4E3FDC1), Color(0xFF8BC34A)),
      (Color(0xFFC8EFFF), Color(0xC4C9FAFD), Color(0xFF4DD0E1)),
      (Color(0xFFFFF48F), Color(0xFFFFF48F), Color(0xFFE6C200)),
    ];
    return [
      for (var i = 0; i < lines.length; i++)
        _CartItem(
          lineId: lines[i].id,
          name: lines[i].name,
          weight: '${lines[i].quantity}',
          price: lines[i].price,
          subtotal: lines[i].subtotal,
          image: lines[i].imageUrl,
          bg: palettes[i % palettes.length].$1,
          qtyBg: palettes[i % palettes.length].$2,
          minus: palettes[i % palettes.length].$3,
          qty: lines[i].quantity,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartNotifierProvider);
    _cartLoading = cartAsync.isLoading;
    _cartError = cartAsync.hasError ? cartAsync.error.toString() : null;
    final cart = cartAsync.value;
    final lines = cart == null
        ? const <CartLineDto>[]
        : (_tab == 0 ? cart.instant : cart.preorder);
    _items = _mapLines(lines);

    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildTabs(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 24 + bottomPad),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    if (_cartLoading)
                      const Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (_cartError != null)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _cartError!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(),
                        ),
                      )
                    else if (_items.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          'Your cart is empty',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: Colors.black54),
                        ),
                      ),
                    ...List.generate(_items.length, (i) {
                      return Column(
                        children: [
                          _buildItemRow(i),
                          if (i < _items.length - 1)
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFFEEEEEE),
                            ),
                        ],
                      );
                    }),
                    const SizedBox(height: 22),
                    _buildPromo(),
                    const SizedBox(height: 22),
                    _buildSummary(),
                    const SizedBox(height: 20),
                    _buildCheckoutBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.v2Home);
              }
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'My Cart',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 42),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            _tabChip(0, 'Instant Cart'),
            _tabChip(1, 'Pre-order cart'),
          ],
        ),
      ),
    );
  }

  Widget _tabChip(int index, String label) {
    final active = _tab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? _green : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemRow(int index) {
    final item = _items[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: item.bg,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8),
            child: AppImage(
              path: item.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ref
                          .read(cartNotifierProvider.notifier)
                          .removeLine(item.lineId),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        size: 20,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.weight,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF9E9E9E),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '₹ ${item.subtotal.round()}',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    _qtyControl(index),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyControl(int index) {
    final item = _items[index];
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: item.qtyBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _qtyBtn(
            icon: Icons.add,
            filled: false,
            color: item.minus,
            onTap: () => ref
                .read(cartNotifierProvider.notifier)
                .setLineQuantity(item.lineId, item.qty + 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.qty == item.qty.roundToDouble()
                  ? item.qty.toInt().toString()
                  : item.qty.toString(),
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _qtyBtn(
            icon: Icons.remove,
            filled: true,
            color: item.minus,
            onTap: () {
              if (item.qty > 1) {
                ref
                    .read(cartNotifierProvider.notifier)
                    .setLineQuantity(item.lineId, item.qty - 1);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn({
    required IconData icon,
    required bool filled,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: filled
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.lerp(color, Colors.white, 0.25)!,
                    color,
                  ],
                )
              : null,
          color: filled ? null : Colors.white,
          boxShadow: filled
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 3,
                  ),
                ],
        ),
        child: Icon(
          icon,
          size: 14,
          color: filled ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildPromo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Have a promo code ?',
          style: GoogleFonts.poppins(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 52,
          padding: const EdgeInsets.fromLTRB(14, 4, 4, 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              Icon(Icons.discount_outlined, size: 22, color: Colors.grey.shade800),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'DISCOUNT',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                    color: Colors.black87,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: _green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(88, 44),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Apply',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    final delivery = 0;
    final total = _itemTotal + delivery;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order summary',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _summaryRow('Item total', '₹ $_itemTotal'),
              const SizedBox(height: 10),
              _summaryRow(
                'Delivery',
                delivery == 0 ? 'FREE' : '₹ $delivery',
                valueColor: _green,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1, color: Color(0xFFE0E0E0)),
              ),
              _summaryRow(
                'Grand total',
                '₹ $total',
                bold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool bold = false,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13.5,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 13.5,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutBtn() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _items.isEmpty
            ? null
            : () => context.push(AppRouter.v2Checkout, extra: _itemTotal),
        style: ElevatedButton.styleFrom(
          backgroundColor: _green,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _CartItem {
  const _CartItem({
    required this.lineId,
    required this.name,
    required this.weight,
    required this.price,
    required this.subtotal,
    required this.image,
    required this.bg,
    required this.qtyBg,
    required this.minus,
    required this.qty,
  });

  final String lineId;
  final String name;
  final String weight;
  final double price;
  final double subtotal;
  final String image;
  final Color bg;
  final Color qtyBg;
  final Color minus;
  final double qty;
}
