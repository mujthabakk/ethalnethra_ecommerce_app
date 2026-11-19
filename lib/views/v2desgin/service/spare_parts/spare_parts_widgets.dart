import 'dart:ui';

import 'package:flutter/material.dart';

import '../service_widgets.dart';
import 'spare_parts_data.dart';

abstract final class SparePartsColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF0C69AA);
  static const Color star = Color(0xFFF7C324);
  static const Color barTrack = Color(0xFFB9C4BE);
  static const Color barFill = Color(0xFFF4D03F);

  /// Figma card fill: linear FFFFFF → 0C69AA (bottom-left → top-right),
  /// layered over the light page so it reads as a soft blue glass.
  static LinearGradient card({double alpha = 0.8}) => LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          white.withValues(alpha: alpha * 0.55),
          blue.withValues(alpha: alpha),
        ],
      );
}

/// "₹ 500/per day" with the period in a lighter weight.
class PartPrice extends StatelessWidget {
  const PartPrice({
    super.key,
    required this.price,
    this.size = 13,
    this.periodColor = const Color(0xFF4A4A4A),
    this.color = ServiceColors.textPrimary,
  });

  final String price;
  final double size;
  final Color color;
  final Color periodColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: price,
            style: servicePoppins(
              size: size,
              weight: FontWeight.w500,
              color: color,
            ),
          ),
          TextSpan(
            text: '/per day',
            style: servicePoppins(
              size: size * 0.78,
              weight: FontWeight.w300,
              color: periodColor,
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          color: Colors.white.withValues(alpha: 0.28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ServiceIcon(
                SparePartsAssets.star,
                size: 13,
                fallback: Icons.star_rounded,
              ),
              const SizedBox(height: 3),
              Text(
                rating,
                style: servicePoppins(size: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// White circle with ↗ arrow.
class PartArrowButton extends StatelessWidget {
  const PartArrowButton({super.key, this.size = 30});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.north_east, size: size * 0.6, color: Colors.black),
    );
  }
}

/// Blue gradient grid tile (Top Searching / Recommended for you).
class SparePartTile extends StatelessWidget {
  const SparePartTile({super.key, required this.part, required this.onTap});

  final SparePart part;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: SparePartsColors.card(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 14,
              right: 14,
              top: 14,
              bottom: 64,
              child: Image.asset(
                part.image,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.medium,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.build_circle_outlined,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 10,
              child: _RatingBadge(rating: part.rating),
            ),
            Positioned(
              left: 11,
              right: 10,
              bottom: 14,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          part.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: servicePoppins(size: 12.5),
                        ),
                        const SizedBox(height: 3),
                        PartPrice(price: part.priceLabel, size: 12.5),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  const PartArrowButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 2-column sliver grid of [SparePartTile]s.
class SparePartGrid extends StatelessWidget {
  const SparePartGrid({
    super.key,
    required this.parts,
    required this.onTap,
    this.padding = const EdgeInsets.fromLTRB(28, 0, 26, 24),
  });

  final List<SparePart> parts;
  final ValueChanged<SparePart> onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (parts.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Text(
              'No parts found',
              style: servicePoppins(color: ServiceColors.textSecondary),
            ),
          ),
        ),
      );
    }
    return SliverPadding(
      padding: padding.copyWith(
        bottom: padding.bottom + MediaQuery.paddingOf(context).bottom,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 165 / 180,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, i) => SparePartTile(part: parts[i], onTap: () => onTap(parts[i])),
          childCount: parts.length,
        ),
      ),
    );
  }
}
