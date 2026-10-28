import 'dart:ui';

import 'package:flutter/material.dart';

/// Figma "Glass" effect approx:
/// - Fill `#000000` @ 20%
/// - Stroke `#000000` @ 10%, inside 1px
/// - Frost ≈ 4 → soft blur
/// - Light -45° @ 80% → subtle top-left highlight
class KistcherGlass extends StatelessWidget {
  const KistcherGlass({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.padding,
    this.width,
    this.height,
    this.frost = 4,
    this.fillOpacity = 0.20,
    this.strokeOpacity = 0.10,
    this.clip = true,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  /// Figma Frost (default 4). Maps to blur sigma.
  final double frost;

  /// Figma fill black opacity (default 20%).
  final double fillOpacity;

  /// Figma stroke black opacity (default 10%).
  final double strokeOpacity;

  final bool clip;

  /// Map Figma frost (0–100-ish scale around 4) → ImageFilter sigma.
  double get _sigma => (frost * 2.8).clamp(6.0, 22.0);

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    // Layer: blur → black@20% fill → -45° light highlight → stroke → child
    final content = Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black.withValues(alpha: fillOpacity),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              // Light -45° @ ~80% strength
              gradient: LinearGradient(
                begin: const Alignment(-0.95, -0.95),
                end: const Alignment(0.75, 0.85),
                colors: [
                  Colors.white.withValues(alpha: 0.22),
                  Colors.white.withValues(alpha: 0.06),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.08),
                ],
                stops: const [0.0, 0.2, 0.55, 1.0],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(
                color: Colors.black.withValues(alpha: strokeOpacity),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ],
    );

    final sized = (width != null || height != null)
        ? SizedBox(width: width, height: height, child: content)
        : content;

    final blurred = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma),
      child: sized,
    );

    if (!clip) return blurred;

    return ClipRRect(
      borderRadius: radius,
      child: blurred,
    );
  }
}

/// Circular glass chip (favorites, nav accents).
class KistcherGlassCircle extends StatelessWidget {
  const KistcherGlassCircle({
    super.key,
    required this.child,
    this.size = 36,
    this.frost = 4,
  });

  final Widget child;
  final double size;
  final double frost;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: KistcherGlass(
        borderRadius: size / 2,
        width: size,
        height: size,
        frost: frost,
        clip: false,
        child: Center(child: child),
      ),
    );
  }
}

/// Pill glass badge (time "22 mins").
class KistcherGlassPill extends StatelessWidget {
  const KistcherGlassPill({
    super.key,
    required this.child,
    this.padding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.frost = 4,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double frost;

  @override
  Widget build(BuildContext context) {
    return KistcherGlass(
      borderRadius: 20,
      padding: padding,
      frost: frost,
      child: child,
    );
  }
}
