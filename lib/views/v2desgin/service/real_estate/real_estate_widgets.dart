import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service_widgets.dart';
import 'real_estate_data.dart';

abstract final class RealEstateColors {
  static const Color specChip = Color(0xFFEAF3FC);
  static const Color chipBorder = Color(0xFFD5E0EA);
  static const Color chipFill = Color(0xFFF2F7FC);
  static const Color heart = Color(0xFFC94545);
  static const Color greenDot = Color(0xFF43C443);
  static const Color star = Color(0xFFF7C324);
}

/// Rounded pill filter chip (Apartments / House… and All / Buy…).
class RealEstatePillChip extends StatelessWidget {
  const RealEstatePillChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? ServiceColors.primary : RealEstateColors.chipFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? ServiceColors.primary : RealEstateColors.chipBorder,
          ),
        ),
        child: Text(
          label,
          style: servicePoppins(
            size: 15,
            color: selected ? Colors.white : ServiceColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

/// Horizontal scrolling row of pill chips.
class RealEstateChipRow extends StatelessWidget {
  const RealEstateChipRow({
    super.key,
    required this.labels,
    required this.isSelected,
    required this.onTap,
  });

  final List<String> labels;
  final bool Function(String) isSelected;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: labels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 18),
        itemBuilder: (_, i) => RealEstatePillChip(
          label: labels[i],
          selected: isSelected(labels[i]),
          onTap: () => onTap(labels[i]),
        ),
      ),
    );
  }
}

/// Section title + "see all".
class RealEstateSectionHeader extends StatelessWidget {
  const RealEstateSectionHeader({super.key, required this.title, this.onSeeAll});

  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: servicePoppins(size: 19, weight: FontWeight.w500),
            ),
          ),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'see all',
                style: servicePoppins(size: 14, color: ServiceColors.primary),
              ),
            ),
        ],
      ),
    );
  }
}

/// Small frosted heart button; toggles the shared favourites set.
class RealEstateHeart extends ConsumerWidget {
  const RealEstateHeart({super.key, required this.propertyId, this.size = 24});

  final String propertyId;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liked = ref.watch(realEstateFavoritesProvider).contains(propertyId);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final notifier = ref.read(realEstateFavoritesProvider.notifier);
        final next = {...notifier.state};
        liked ? next.remove(propertyId) : next.add(propertyId);
        notifier.state = next;
      },
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            color: Colors.white.withValues(alpha: 0.45),
            child: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              size: size * 0.6,
              color: RealEstateColors.heart,
            ),
          ),
        ),
      ),
    );
  }
}

/// Frosted tag on the listing image ("• For Rent", "Villa").
class _GlassTag extends StatelessWidget {
  const _GlassTag({required this.label, this.dot = false});

  final String label;
  final bool dot;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (dot) ...[
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: RealEstateColors.greenDot,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Text(label, style: servicePoppins(size: 10)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Light-blue spec pill (4 Beds / 3 Baths / 2,450 sqft).
class _SpecChip extends StatelessWidget {
  const _SpecChip({required this.icon, required this.label});

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: RealEstateColors.specChip,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ServiceIcon(icon, size: 15, fallback: Icons.square_outlined),
          const SizedBox(width: 7),
          Text(label, style: servicePoppins(size: 12)),
        ],
      ),
    );
  }
}

Widget realEstateImage(String path, {BoxFit fit = BoxFit.cover}) {
  return Image.asset(
    path,
    fit: fit,
    filterQuality: FilterQuality.medium,
    errorBuilder: (_, __, ___) => const ColoredBox(
      color: Color(0xFFD3E2F2),
      child: Center(
        child: Icon(Icons.home_work_outlined, color: ServiceColors.primary),
      ),
    ),
  );
}

/// White Featured Listings card (horizontal carousel + see-all list).
class FeaturedPropertyCard extends StatelessWidget {
  const FeaturedPropertyCard({
    super.key,
    required this.property,
    required this.onTap,
    this.imageHeight = 145,
  });

  final Property property;
  final VoidCallback onTap;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final p = property;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    realEstateImage(p.image),
                    Positioned(
                      left: 8,
                      top: 10,
                      child: Row(
                        children: [
                          _GlassTag(label: p.dealLabel, dot: true),
                          const SizedBox(width: 8),
                          _GlassTag(label: p.typeLabel),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 10,
                      child: RealEstateHeart(propertyId: p.id),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        p.priceLabel,
                        style: servicePoppins(
                          size: 18,
                          weight: FontWeight.w500,
                          color: ServiceColors.primary,
                        ),
                      ),
                      Text(
                        p.periodLabel,
                        style: servicePoppins(
                          size: 13,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star_rounded,
                        size: 22,
                        color: RealEstateColors.star,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${p.rating} (${p.reviews})',
                        style: servicePoppins(size: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.name,
                    style: servicePoppins(size: 15, weight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const ServiceIcon(
                        RealEstateAssets.pinGrey,
                        size: 16,
                        fallback: Icons.location_on_outlined,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          p.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: servicePoppins(
                            size: 13,
                            color: ServiceColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        _SpecChip(
                          icon: RealEstateAssets.bed,
                          label: '${p.beds} Beds',
                        ),
                        const SizedBox(width: 20),
                        _SpecChip(
                          icon: RealEstateAssets.bath,
                          label: '${p.baths} Baths',
                        ),
                        const SizedBox(width: 20),
                        _SpecChip(
                          icon: RealEstateAssets.area,
                          label: p.sqftLabel,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Nearby Properties grid tile — photo with frosted info bar.
class NearbyPropertyTile extends StatelessWidget {
  const NearbyPropertyTile({
    super.key,
    required this.property,
    required this.onTap,
  });

  final Property property;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final p = property;
    final small = servicePoppins(size: 10);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              realEstateImage(p.image),
              Positioned(
                right: 10,
                top: 10,
                child: RealEstateHeart(propertyId: p.id),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 10, 12),
                      color: Colors.white.withValues(alpha: 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: servicePoppins(
                                    size: 13,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: RealEstateColors.star,
                              ),
                              const SizedBox(width: 3),
                              Text('${p.rating} (${p.reviews})', style: small),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '₹ ${formatInr(p.price)}',
                                          style: servicePoppins(
                                            size: 13,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: p.periodLabel,
                                          style: servicePoppins(
                                            size: 12,
                                            color: const Color(0xFF555555),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const ServiceIcon(
                                RealEstateAssets.bed,
                                size: 12,
                                fallback: Icons.bed_outlined,
                              ),
                              const SizedBox(width: 3),
                              Text('${p.beds}', style: small),
                              const SizedBox(width: 6),
                              const ServiceIcon(
                                RealEstateAssets.bath,
                                size: 12,
                                fallback: Icons.bathtub_outlined,
                              ),
                              const SizedBox(width: 3),
                              Text('${p.baths}', style: small),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
