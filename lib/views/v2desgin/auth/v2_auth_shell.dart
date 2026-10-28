import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'v2_auth_colors.dart';

/// Figma glass auth shell — centered title, centered card, exact borders.
class V2AuthShell extends StatelessWidget {
  const V2AuthShell({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.showBack = false,
    this.onBack,
    this.cardPadding = const EdgeInsets.fromLTRB(18, 20, 18, 22),
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final bool showBack;
  final VoidCallback? onBack;
  final EdgeInsets cardPadding;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFDEFFD9),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const _AuthBackground(),
            Positioned.fill(
              child: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - 24,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Top row: back (optional) — keeps title truly centered
                              SizedBox(
                                height: showBack ? 44 : 8,
                                child: showBack
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: _BackButton(
                                          onTap: onBack ??
                                              () =>
                                                  Navigator.maybePop(context),
                                        ),
                                      )
                                    : null,
                              ),
                              const Spacer(flex: 1),
                              if (title != null) ...[
                                Text(
                                  title!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: showBack ? 22 : 28,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    letterSpacing: -0.3,
                                    color: V2AuthUiColors.black,
                                  ),
                                ),
                                if (subtitle != null) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    subtitle!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w400,
                                      height: 1.45,
                                      color: V2AuthUiColors.darkGreen,
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 18),
                              ],
                              _GlassCard(
                                padding: cardPadding,
                                child: child,
                              ),
                              const Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthBackground extends StatelessWidget {
  const _AuthBackground();

  static const _asset = 'asstes/v2desgin/login_page/login_bg.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _asset,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      errorBuilder: (_, __, ___) => const _LiveMeshFallback(),
    );
  }
}

class _LiveMeshFallback extends StatelessWidget {
  const _LiveMeshFallback();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.sizeOf(context);
    final w = s.width;
    final h = s.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: Color(0xFFDEFFD9)),
        Positioned(
          top: -h * 0.1,
          right: -w * 0.4,
          child: _Blob(
            size: w * 1.5,
            blur: 90,
            colors: [
              V2AuthUiColors.darkGreen.withValues(alpha: 0.55),
              V2AuthUiColors.darkGreen.withValues(alpha: 0.0),
            ],
          ),
        ),
        Positioned(
          bottom: -h * 0.12,
          left: -w * 0.45,
          child: _Blob(
            size: w * 1.4,
            blur: 90,
            colors: [
              V2AuthUiColors.darkGreen.withValues(alpha: 0.45),
              V2AuthUiColors.darkGreen.withValues(alpha: 0.0),
            ],
          ),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({
    required this.size,
    required this.blur,
    required this.colors,
  });

  final double size;
  final double blur;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: colors),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child, required this.padding});

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    const radius = 32.0;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
          child: Container(
            width: double.infinity,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.92),
                width: 1.2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.42),
                  Colors.white.withValues(alpha: 0.22),
                  Colors.white.withValues(alpha: 0.30),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: V2AuthUiColors.black,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
