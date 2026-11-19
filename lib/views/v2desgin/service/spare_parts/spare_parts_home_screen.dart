import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../real_estate/real_estate_data.dart';
import '../real_estate/real_estate_widgets.dart';
import '../service_widgets.dart';
import 'spare_parts_data.dart';
import 'spare_parts_widgets.dart';

/// Figma "Find Your Genuine Parts" home.
class SparePartsHomeScreen extends StatefulWidget {
  const SparePartsHomeScreen({super.key});

  @override
  State<SparePartsHomeScreen> createState() => _SparePartsHomeScreenState();
}

class _SparePartsHomeScreenState extends State<SparePartsHomeScreen> {
  String _chip = 'All';

  void _open(SparePart p) =>
      context.push(AppRouter.sparePartsDetails, extra: p);

  @override
  Widget build(BuildContext context) {
    final parts = SparePartsData.byChip(_chip);
    final featured = parts.firstWhere(
      (p) => p.chip == 'Engine' && p.model.isNotEmpty,
      orElse: () => parts.isEmpty ? SparePartsData.engine : parts.first,
    );

    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: ServiceLocationHeader(
                avatar: RealEstateAssets.avatar,
                pinIcon: RealEstateAssets.pinBlue,
                padding: EdgeInsets.fromLTRB(28, 18, 26, 30),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Find Your', style: servicePoppins(size: 16)),
                    const SizedBox(height: 6),
                    Text(
                      'Genuine Parts',
                      style: servicePoppins(size: 24, weight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  itemCount: SparePartsData.chips.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (_, i) {
                    final label = SparePartsData.chips[i];
                    return _SmallChip(
                      label: label,
                      selected: label == _chip,
                      onTap: () => setState(() => _chip = label),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 24, 26, 0),
                child: _FeaturedBanner(
                  part: featured,
                  onTap: () => _open(featured),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 34, 26, 22),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Top Searching',
                        style: servicePoppins(
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push(AppRouter.sparePartsSearch),
                      child: Text(
                        'see all',
                        style: servicePoppins(
                          size: 12,
                          color: ServiceColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SparePartGrid(parts: parts, onTap: _open),
          ],
        ),
      ),
    );
  }
}

class _SmallChip extends StatelessWidget {
  const _SmallChip({
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? ServiceColors.primary : RealEstateColors.chipFill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? ServiceColors.primary
                : RealEstateColors.chipBorder,
          ),
        ),
        child: Text(
          label,
          style: servicePoppins(
            size: 12.5,
            weight: FontWeight.w500,
            color: selected ? Colors.white : ServiceColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _FeaturedBanner extends StatelessWidget {
  const _FeaturedBanner({required this.part, required this.onTap});

  final SparePart part;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 266,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xCCFFFFFF), Color(0xD90C69AA)],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 14,
              width: 176,
              height: 180,
              child: Image.asset(
                part.image,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.medium,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
            Positioned(
              left: 26,
              top: 20,
              right: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    part.chip,
                    style: servicePoppins(size: 18).copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    part.bannerTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: servicePoppins(size: 26, weight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  PartPrice(
                    price: part.priceLabel,
                    size: 19,
                    periodColor: ServiceColors.textPrimary,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const ServiceIcon(
                        SparePartsAssets.star,
                        size: 20,
                        fallback: Icons.star_rounded,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${part.rating} (${part.reviews})',
                        style: servicePoppins(size: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 26,
              bottom: 22,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                child: InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: onTap,
                  child: SizedBox(
                    width: 188,
                    height: 54,
                    child: Center(
                      child: Text(
                        'See details',
                        style: servicePoppins(size: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
