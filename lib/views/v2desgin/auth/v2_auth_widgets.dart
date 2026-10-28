import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'v2_auth_colors.dart';

class V2AuthTabSwitch extends StatelessWidget {
  const V2AuthTabSwitch({
    super.key,
    required this.isEmail,
    required this.onChanged,
  });

  final bool isEmail;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: V2AuthUiColors.darkGreen,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            child: _tab(
              label: 'E mail',
              selected: isEmail,
              onTap: () => onChanged(true),
            ),
          ),
          Expanded(
            child: _tab(
              label: 'Phone number',
              selected: !isEmail,
              onTap: () => onChanged(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? V2AuthUiColors.mint : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? V2AuthUiColors.black : V2AuthUiColors.white,
          ),
        ),
      ),
    );
  }
}

class V2GlassField extends StatelessWidget {
  const V2GlassField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: V2AuthUiColors.black,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withValues(alpha: 0.28),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.85),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  if (prefix != null) ...[
                    prefix!,
                    const SizedBox(width: 4),
                  ] else if (prefixIcon != null) ...[
                    Icon(
                      prefixIcon,
                      size: 20,
                      color: V2AuthUiColors.darkGreen.withValues(alpha: 0.85),
                    ),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: TextField(
                      controller: controller,
                      obscureText: obscure,
                      keyboardType: keyboardType,
                      cursorColor: V2AuthUiColors.darkGreen,
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: V2AuthUiColors.black,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: V2AuthUiColors.hint,
                        ),
                      ),
                    ),
                  ),
                  if (suffix != null) suffix!,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class V2GradientCtaButton extends StatelessWidget {
  const V2GradientCtaButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        padding: const EdgeInsets.fromLTRB(24, 0, 4, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: V2AuthUiColors.ctaGradient,
          boxShadow: [
            BoxShadow(
              color: V2AuthUiColors.darkGreen.withValues(alpha: 0.28),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: V2AuthUiColors.darkGreen,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class V2SocialRow extends StatelessWidget {
  const V2SocialRow({super.key, this.onGoogle, this.onApple});

  final VoidCallback? onGoogle;
  final VoidCallback? onApple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or continue with',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: V2AuthUiColors.darkGreen,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _bubble(onTap: onGoogle, child: const _GoogleMark()),
            const SizedBox(width: 16),
            _bubble(
              onTap: onApple,
              child: const Icon(Icons.apple, size: 26, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bubble({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(22, 22),
      painter: _GoogleGPainter(),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const stroke = 2.8;
    final rect = Rect.fromCircle(center: center, radius: radius - stroke / 2);

    void arc(Color color, double start, double sweep) {
      final p = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.butt;
      canvas.drawArc(rect, start, sweep, false, p);
    }

    arc(const Color(0xFFEA4335), -2.2, 1.4);
    arc(const Color(0xFFFBBC05), -0.8, 1.1);
    arc(const Color(0xFF34A853), 0.3, 1.2);
    arc(const Color(0xFF4285F4), 1.5, 2.0);

    final bar = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromLTRBR(
        center.dx - 1,
        center.dy - stroke / 2,
        size.width - 1,
        center.dy + stroke / 2,
        const Radius.circular(1),
      ),
      bar,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class V2AuthFooterLink extends StatelessWidget {
  const V2AuthFooterLink({
    super.key,
    required this.prefix,
    required this.action,
    required this.onTap,
  });

  final String prefix;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
              color: V2AuthUiColors.darkGreen,
            ),
            children: [
              TextSpan(text: prefix),
              TextSpan(
                text: action,
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: V2AuthUiColors.darkGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class V2RememberRow extends StatelessWidget {
  const V2RememberRow({
    super.key,
    required this.value,
    required this.onChanged,
    this.onForgot,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onForgot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: V2AuthUiColors.darkGreen,
                width: 1.4,
              ),
              color: value ? V2AuthUiColors.darkGreen : Colors.transparent,
            ),
            child: value
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Text(
            'Remember me',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: V2AuthUiColors.darkGreen,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onForgot,
          child: Text(
            'forget password ?',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: V2AuthUiColors.darkGreen,
            ),
          ),
        ),
      ],
    );
  }
}
