import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_colors.dart';

/// Default grey shimmer wrapper for skeleton UIs.
class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.period = const Duration(milliseconds: 1200),
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration period;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? const Color(0xFFE6E6E6),
      highlightColor: highlightColor ?? const Color(0xFFF5F5F5),
      period: period,
      child: child,
    );
  }
}

/// Rounded rectangle skeleton; wrap with [AppShimmer] or place under shared parent.
class ShimmerBone extends StatelessWidget {
  const ShimmerBone({
    super.key,
    this.width,
    required this.height,
    this.borderRadius = 8,
  });

  final double? width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

/// Home banner slot (carousel area).
class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: ShimmerBone(height: 115, borderRadius: 8),
    );
  }
}

/// Exclusive-style 2-column product grid skeleton.
class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({
    super.key,
    this.rows = 2,
    this.spacing = 15,
    this.cellHeight = 272,
  });

  final int rows;
  final double spacing;
  final double cellHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        final cellW = maxW > spacing ? (maxW - spacing) / 2 : 160.0;
        return AppShimmer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBone(width: maxW * 0.42, height: 22, borderRadius: 6),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: cellW / cellHeight,
                ),
                itemCount: rows * 2,
                itemBuilder: (_, __) => ShimmerBone(
                  width: cellW,
                  height: cellHeight,
                  borderRadius: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Horizontal category cards strip.
class CategoryStripShimmer extends StatelessWidget {
  const CategoryStripShimmer({super.key, this.itemWidth = 248});

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: AppShimmer(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(width: 15),
          itemBuilder: (_, __) => ShimmerBone(
            width: itemWidth,
            height: 105,
            borderRadius: 18,
          ),
        ),
      ),
    );
  }
}

/// Explore tab category grid skeleton.
class ExploreGridShimmer extends StatelessWidget {
  const ExploreGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),
        itemCount: 6,
        itemBuilder: (_, __) => LayoutBuilder(
          builder: (context, constraints) {
            return ShimmerBone(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              borderRadius: 18,
            );
          },
        ),
      ),
    );
  }
}

/// Location screen while zones load.
class LocationZonesShimmer extends StatelessWidget {
  const LocationZonesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width - 50;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: ShimmerBone(
                width: 250,
                height: 200,
                borderRadius: 16,
              ),
            ),
            const SizedBox(height: 40),
            ShimmerBone(width: 280, height: 28, borderRadius: 8),
            const SizedBox(height: 16),
            ShimmerBone(width: w, height: 44, borderRadius: 8),
            const SizedBox(height: 60),
            const ShimmerBone(width: 120, height: 18, borderRadius: 4),
            const SizedBox(height: 12),
            ShimmerBone(width: w, height: 52, borderRadius: 8),
            const SizedBox(height: 24),
            const ShimmerBone(width: 120, height: 18, borderRadius: 4),
            const SizedBox(height: 12),
            ShimmerBone(width: w, height: 52, borderRadius: 8),
            const SizedBox(height: 24),
            ShimmerBone(width: w, height: 52, borderRadius: 8),
            const SizedBox(height: 16),
            ShimmerBone(width: w, height: 52, borderRadius: 8),
            const SizedBox(height: 32),
            ShimmerBone(width: w, height: 56, borderRadius: 19),
          ],
        ),
      ),
    );
  }
}

/// Dropdown-sized line for areas loading under zone.
class AreaDropdownShimmer extends StatelessWidget {
  const AreaDropdownShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: LayoutBuilder(
        builder: (context, c) {
          return AppShimmer(
            child: ShimmerBone(
              width: c.maxWidth,
              height: 52,
              borderRadius: 8,
            ),
          );
        },
      ),
    );
  }
}

/// Personal details screen — profile fetch.
class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerBone(width: 220, height: 32, borderRadius: 8),
            SizedBox(height: 12),
            ShimmerBone(width: 180, height: 18, borderRadius: 6),
          ],
        ),
      ),
    );
  }
}

/// Shimmer fill for primary-colored buttons (green / blue).
class ShimmerButtonFill extends StatelessWidget {
  const ShimmerButtonFill({
    super.key,
    required this.baseColor,
    required this.highlightColor,
    required this.borderRadius,
  });

  final Color baseColor;
  final Color highlightColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: const Duration(milliseconds: 900),
      child: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: baseColor.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

/// Network image placeholder shimmer.
class ImageLoadingShimmer extends StatelessWidget {
  const ImageLoadingShimmer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const AppShimmer(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
          child: SizedBox.expand(),
        ),
      ),
    );
  }
}

/// Circular FAB-sized shimmer on primary green.
class GreenFabShimmer extends StatelessWidget {
  const GreenFabShimmer({super.key, this.size = 67});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primary.withValues(alpha: 0.65),
      highlightColor: AppColors.primary,
      period: const Duration(milliseconds: 900),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
