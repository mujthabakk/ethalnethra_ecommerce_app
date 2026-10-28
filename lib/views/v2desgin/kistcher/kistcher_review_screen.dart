import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';
import 'kistcher_page_header.dart';

/// Figma Kitchen "Review" (payment) — address card, payment method chips,
/// pill input fields, Confirm / Cancel order buttons.
class KistcherReviewScreen extends StatefulWidget {
  const KistcherReviewScreen({super.key, this.savedAmount = 100});

  final int savedAmount;

  @override
  State<KistcherReviewScreen> createState() => _KistcherReviewScreenState();
}

enum _PayMethod { card, cash, upi }

class _KistcherReviewScreenState extends State<KistcherReviewScreen> {
  static const _accent = Color(0xFFF2D262);
  static const _surface = Color(0xFFFFFFFA);
  static const _chipBorder = Color(0xFFBFBFBC);

  static const _pageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFCF9AB),
      Color(0xFFFDFBBF),
      Color(0xFFFEFDD5),
      Color(0xFFFFFEEB),
      Colors.white,
    ],
    stops: [0.0, 0.18, 0.36, 0.55, 0.73],
  );

  _PayMethod _method = _PayMethod.card;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: _pageGradient),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      33,
                      media.padding.top + 13,
                      29,
                      40 + media.padding.bottom,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 8),
                          child: const KistcherPageHeader(title: 'Review'),
                        ),
                        const SizedBox(height: 50),
                        _buildAddress(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            'Payment method',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildMethods(),
                        const SizedBox(height: 43),
                        ..._buildFields(),
                        const SizedBox(height: 14),
                        _buildProtected(),
                        const Spacer(),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 6, right: 7),
                          child: _buildButtons(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      height: 73,
      padding: const EdgeInsets.only(left: 15, right: 13),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery address',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '6391 mirpur, Dhaka Banghaldesh',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF5E5E5C),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 43, color: const Color(0xFF838381)),
          GestureDetector(
            onTap: () => context.push(AppRouter.selectLocation),
            child: SizedBox(
              width: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    KistcherAssets.reviewRefresh,
                    width: 21,
                    height: 16,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.sync, size: 18, color: _accent),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Change',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF8D749),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethods() {
    Widget chip(
      _PayMethod? method,
      String label,
      Widget trailing, {
      VoidCallback? onTap,
    }) {
      final on = method != null && _method == method;
      return GestureDetector(
        onTap: onTap ?? () => setState(() => _method = method!),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 11),
          decoration: BoxDecoration(
            color: on ? _accent : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: on ? _accent : _chipBorder,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              trailing,
            ],
          ),
        ),
      );
    }

    return Container(
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFB),
        borderRadius: BorderRadius.circular(21),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            chip(
              _PayMethod.card,
              'Card',
              Image.asset(KistcherAssets.reviewCardChip, width: 15, height: 12),
            ),
            const SizedBox(width: 14),
            chip(
              _PayMethod.cash,
              'Cash',
              Image.asset(KistcherAssets.reviewCash, width: 21, height: 17),
            ),
            const SizedBox(width: 14),
            chip(
              _PayMethod.upi,
              'UPI',
              Image.asset(KistcherAssets.reviewUpi, width: 26, height: 9),
            ),
            const SizedBox(width: 14),
            chip(
              null,
              'Add',
              const Icon(Icons.add, size: 17, color: Colors.black),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFields() {
    final fields = switch (_method) {
      _PayMethod.card => const [
          (KistcherAssets.reviewPerson, 19.0, 21.0, 'Card holder name',
              TextInputType.name),
          (KistcherAssets.reviewCardField, 21.0, 17.0, 'Card Number',
              TextInputType.number),
          (KistcherAssets.reviewLock, 18.0, 21.0, 'CVV',
              TextInputType.number),
          (KistcherAssets.reviewCalendar, 22.0, 21.0, 'Expiry Date',
              TextInputType.datetime),
        ],
      _PayMethod.upi => const [
          (KistcherAssets.reviewPerson, 19.0, 21.0, 'UPI ID',
              TextInputType.emailAddress),
        ],
      _PayMethod.cash => const <(String, double, double, String, TextInputType)>[],
    };

    return [
      for (var i = 0; i < fields.length; i++) ...[
        if (i > 0) const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: _InputPill(
            icon: fields[i].$1,
            iconW: fields[i].$2,
            iconH: fields[i].$3,
            hint: fields[i].$4,
            keyboard: fields[i].$5,
            obscure: fields[i].$4 == 'CVV',
          ),
        ),
      ],
    ];
  }

  Widget _buildProtected() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(KistcherAssets.reviewShield, width: 19, height: 19),
        const SizedBox(width: 8),
        Text(
          'All Payments are protected',
          style: GoogleFonts.poppins(
            fontSize: 12.5,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF444442),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    final label = GoogleFonts.poppins(
      fontSize: 16.5,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
    return Column(
      children: [
        GestureDetector(
          onTap: () => showKistcherOrderConfirmed(
            context,
            savedAmount: widget.savedAmount,
          ),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: _accent,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Confirm Order', style: label),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward, size: 22, color: Colors.black),
              ],
            ),
          ),
        ),
        const SizedBox(height: 27),
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cancel Order', style: label),
                const SizedBox(width: 22),
                const Icon(Icons.close, size: 24, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InputPill extends StatelessWidget {
  const _InputPill({
    required this.icon,
    required this.iconW,
    required this.iconH,
    required this.hint,
    required this.keyboard,
    this.obscure = false,
  });

  final String icon;
  final double iconW;
  final double iconH;
  final String hint;
  final TextInputType keyboard;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 19, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFFFFFC),
            const Color(0xFFFFFFFC).withValues(alpha: 0.7),
          ],
          stops: const [0.7, 1.0],
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            child: Image.asset(icon, width: iconW, height: iconH),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              keyboardType: keyboard,
              obscureText: obscure,
              cursorColor: Colors.black,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF454544),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Figma "Order Confirmed !" sheet — rounded card, `#F2D264 → white`
/// gradient, concentric badge, Track Order / Back to home.
Future<void> showKistcherOrderConfirmed(
  BuildContext context, {
  int savedAmount = 100,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    builder: (_) => _OrderConfirmedSheet(savedAmount: savedAmount),
  );
}

class _OrderConfirmedSheet extends StatelessWidget {
  const _OrderConfirmedSheet({required this.savedAmount});

  final int savedAmount;

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;
    final title = GoogleFonts.poppins(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      height: 1.2,
    );

    return Container(
      margin: EdgeInsets.only(bottom: bottomPad > 0 ? 6 : 0),
      padding: EdgeInsets.fromLTRB(23, 70, 23, 40 + bottomPad * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF2D264),
            Color(0xFFF9EBB6),
            Color(0xFFFCF5DB),
            Color(0xFFFFFFFD),
          ],
          stops: [0.0, 0.47, 0.66, 0.85],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            KistcherAssets.reviewConfirmedBadge,
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              style: title,
              children: [
                const TextSpan(text: 'Order '),
                TextSpan(
                  text: 'Confirmed !',
                  style: title.copyWith(color: const Color(0xFFE0C342)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Text.rich(
            TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 13.5,
                fontWeight: FontWeight.w300,
                color: const Color(0xFF434136),
              ),
              children: [
                const TextSpan(text: 'you saved '),
                TextSpan(
                  text: '₹$savedAmount',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const TextSpan(text: ' with this order'),
              ],
            ),
          ),
          const SizedBox(height: 62),
          _SheetButton(
            label: 'Track Order',
            filled: true,
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRouter.kistcherOrderTracking);
            },
          ),
          const SizedBox(height: 18),
          _SheetButton(
            label: 'Back to home',
            filled: false,
            onTap: () {
              Navigator.of(context).pop();
              context.go(AppRouter.kistcherHome);
            },
          ),
        ],
      ),
    );
  }
}

class _SheetButton extends StatelessWidget {
  const _SheetButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? const Color(0xFFF2D262) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: filled ? null : Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
