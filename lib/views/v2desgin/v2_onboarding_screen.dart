import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';

class _OnboardPage {
  const _OnboardPage({
    required this.image,
    required this.dotsAsset,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
  });

  final String image;
  final String dotsAsset;
  final String title;
  final String subtitle;
  final String buttonLabel;
}

/// V2 auth / onboarding — 3 screens, same template, unique image + copy.
class V2OnboardingScreen extends StatefulWidget {
  const V2OnboardingScreen({super.key});

  @override
  State<V2OnboardingScreen> createState() => _V2OnboardingScreenState();
}

class _V2OnboardingScreenState extends State<V2OnboardingScreen> {
  final _pageController = PageController();
  var _page = 0;

  static const _pages = [
    _OnboardPage(
      image: V2Assets.authHero1,
      dotsAsset: V2Assets.authDots1,
      title: 'Fresh Picks.\nRight on Time.',
      subtitle:
          'Your everyday groceries, handpicked fresh and delivered when you need them.',
      buttonLabel: 'Next',
    ),
    _OnboardPage(
      image: V2Assets.authHero2,
      dotsAsset: V2Assets.authDots2,
      title: 'Eat Your Way.\nAnytime.',
      subtitle:
          'Shop your favorites, discover fresh essentials, and get them delivered with ease.',
      buttonLabel: 'Next',
    ),
    _OnboardPage(
      image: V2Assets.authHero3,
      dotsAsset: V2Assets.authDots3,
      title: 'Freshness at\nYour Doorstep.',
      subtitle:
          'From daily essentials to fresh produce, enjoy easy grocery shopping on your schedule.',
      buttonLabel: 'Start',
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goLogin() => context.go(AppRouter.v2Login);

  void _onNext() {
    if (_page >= _pages.length - 1) {
      _goLogin();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: V2AuthColors.baseGreen,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (i) => setState(() => _page = i),
        itemBuilder: (context, i) {
          return _OnboardingPageView(
            page: _pages[i],
            activeIndex: i,
            pageCount: _pages.length,
            onSkip: _goLogin,
            onNext: _onNext,
          );
        },
      ),
    );
  }
}

/// Shared template for every onboarding slide (image + gradient + copy + CTA).
class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView({
    required this.page,
    required this.activeIndex,
    required this.pageCount,
    required this.onSkip,
    required this.onNext,
  });

  final _OnboardPage page;
  final int activeIndex;
  final int pageCount;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: V2AuthColors.baseGreen),

        // Full-bleed hero
        Positioned.fill(
          child: Image.asset(
            page.image,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (_, __, ___) =>
                const ColoredBox(color: V2AuthColors.baseGreen),
          ),
        ),

        // Bottom gradient #0E5A03 → #211B14 (design)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: size.height * 0.52,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x000E5A03),
                  Color(0xCC0E5A03),
                  V2AuthColors.gradientGreen,
                  V2AuthColors.gradientDark,
                ],
                stops: [0.0, 0.28, 0.62, 1.0],
              ),
            ),
          ),
        ),

        // Top vignette for skip
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 110,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.28),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onSkip,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    'skip',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          color: Color(0x88000000),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _PageDots(
                    count: pageCount,
                    index: activeIndex,
                    assetPath: page.dotsAsset,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  page.title,
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  page.subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                    color: Colors.white.withValues(alpha: 0.90),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 18 + bottom),
                child: _GlassNextButton(
                  label: page.buttonLabel,
                  onTap: onNext,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

abstract final class V2AuthColors {
  static const Color baseGreen = Color(0xFF15490A);
  static const Color gradientGreen = Color(0xFF0E5A03);
  static const Color gradientDark = Color(0xFF211B14);
  static const Color mintDot = Color(0xFFDEFFB4);
}

class _PageDots extends StatelessWidget {
  const _PageDots({
    required this.count,
    required this.index,
    required this.assetPath,
  });

  final int count;
  final int index;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    // Prefer design Frame asset; fall back to live dots if load fails.
    return Image.asset(
      assetPath,
      height: 28,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => _fallbackDots(),
    );
  }

  Widget _fallbackDots() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(count, (i) {
              final active = i == index;
              return Padding(
                padding: EdgeInsets.only(right: i == count - 1 ? 0 : 8),
                child: Container(
                  width: active ? 12 : 8,
                  height: active ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active ? Colors.transparent : Colors.white,
                    border: active
                        ? Border.all(color: V2AuthColors.mintDot, width: 2)
                        : null,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _GlassNextButton extends StatelessWidget {
  const _GlassNextButton({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(28, 0, 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.32),
                width: 1.2,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.20),
                  Colors.white.withValues(alpha: 0.07),
                ],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: V2AuthColors.gradientDark,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
