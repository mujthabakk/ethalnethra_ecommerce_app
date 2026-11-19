import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'buy_sell_data.dart';

abstract final class BuySellColors {
  static const Color featured = Color(0xFFEBC93F);
  static const Color promoBg = Color(0xFFC6E0F8);
  static const Color clearAll = Color(0xFFE53935);
  static const Color chipBg = Color(0xFFCFE4F8);
  static const Color optionGrey = Color(0xFFB5B5B5);
}

/// Opens the blue map picker and stores the chosen area.
Future<void> pickBuySellLocation(BuildContext context, WidgetRef ref) async {
  final result = await context.push<Object?>(AppRouter.buySellLocation);
  if (result is Map) {
    final subtitle = (result['subtitle'] as String? ?? '').trim();
    final title = (result['title'] as String? ?? '').trim();
    final parts = subtitle
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty && !RegExp(r'^\d+$').hasMatch(e))
        .toList();
    final label = parts.isNotEmpty
        ? parts.take(2).join(', ')
        : title.replaceAll(RegExp(r',$'), '');
    if (label.isNotEmpty) {
      ref.read(buySellLocationProvider.notifier).state = label;
    }
  }
}

/// Small white pill ("New" / "Used" / rating).
class _WhitePill extends StatelessWidget {
  const _WhitePill({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}

class BuySellHeart extends ConsumerWidget {
  const BuySellHeart({super.key, required this.id, this.size = 26});

  final String id;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liked = ref.watch(buySellFavoritesProvider).contains(id);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final n = ref.read(buySellFavoritesProvider.notifier);
        final next = {...n.state};
        liked ? next.remove(id) : next.add(id);
        n.state = next;
      },
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            color: Colors.black.withValues(alpha: 0.22),
            child: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              size: size * 0.6,
              color: liked ? const Color(0xFFE53935) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// Photo listing card with frosted dark info bar.
class BuySellCard extends StatelessWidget {
  const BuySellCard({
    super.key,
    required this.listing,
    required this.onTap,
    this.showFeatured = true,
    this.heartLeft = false,
  });

  final BuySellListing listing;
  final VoidCallback onTap;
  final bool showFeatured;
  final bool heartLeft;

  @override
  Widget build(BuildContext context) {
    final l = listing;
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              l.image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
              errorBuilder: (_, __, ___) => const ColoredBox(
                color: Color(0xFFB9CDE0),
                child: Icon(Icons.image_outlined, color: Colors.white),
              ),
            ),
            if (showFeatured && l.featured)
              Positioned(
                left: 12,
                top: 14,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: BuySellColors.featured,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text('Featured', style: servicePoppins(size: 10.5)),
                ),
              ),
            Positioned(
              top: 12,
              left: heartLeft ? 10 : null,
              right: heartLeft ? null : 10,
              child: BuySellHeart(id: l.id),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 8, 8, 10),
                    color: Colors.black.withValues(alpha: 0.22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                l.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: servicePoppins(
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            _WhitePill(
                              child: Text(
                                l.conditionLabel,
                                style: servicePoppins(size: 9.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  l.priceLabel,
                                  style: servicePoppins(
                                    size: 15,
                                    weight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            _WhitePill(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 11,
                                    color: Color(0xFFF7C324),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${l.rating} (${l.reviews})',
                                    style: servicePoppins(size: 8.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 13,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                l.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: servicePoppins(
                                  size: 10.5,
                                  color: Colors.white.withValues(alpha: 0.6),
                                ),
                              ),
                            ),
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
    );
  }
}

/// Blue circle filter button (search + results headers).
class BuySellFilterButton extends ConsumerWidget {
  const BuySellFilterButton({super.key, this.size = 46, this.onApplied});

  final double size;
  final VoidCallback? onApplied;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = !ref.watch(buySellFilterProvider).isDefault;
    return GestureDetector(
      onTap: () async {
        final applied = await showBuySellFilterSheet(context, ref);
        if (applied) onApplied?.call();
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: ServiceColors.primary,
              shape: BoxShape.circle,
            ),
            child: const ServiceIcon(
              BuySellAssets.filterWhite,
              size: 22,
              fallback: Icons.tune,
              color: Colors.white,
            ),
          ),
          if (active)
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: BuySellColors.featured,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Condition + sort sheet. Returns true when Apply was tapped.
Future<bool> showBuySellFilterSheet(BuildContext context, WidgetRef ref) async {
  var condition = ref.read(buySellFilterProvider).condition;
  var sort = ref.read(buySellFilterProvider).sort;

  final applied = await showModalBottomSheet<bool>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheet) => StatefulBuilder(
      builder: (sheet, setSheet) {
        Widget option(String label, bool selected, VoidCallback onTap) {
          return BuySellOptionChip(
            label: label,
            selected: selected,
            onTap: () {
              onTap();
              setSheet(() {});
            },
          );
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Filters',
                        style: servicePoppins(size: 17, weight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setSheet(() {
                        condition = BuySellCondition.all;
                        sort = BuySellSort.relevance;
                      }),
                      child: Text(
                        'Reset',
                        style: servicePoppins(
                          size: 14,
                          color: BuySellColors.clearAll,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text('Condition', style: servicePoppins(size: 15)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children: [
                    option('All', condition == BuySellCondition.all,
                        () => condition = BuySellCondition.all),
                    option('New', condition == BuySellCondition.newOnly,
                        () => condition = BuySellCondition.newOnly),
                    option('Used', condition == BuySellCondition.usedOnly,
                        () => condition = BuySellCondition.usedOnly),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Sort by', style: servicePoppins(size: 15)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  children: [
                    option('Relevance', sort == BuySellSort.relevance,
                        () => sort = BuySellSort.relevance),
                    option('Price: Low to High', sort == BuySellSort.priceLow,
                        () => sort = BuySellSort.priceLow),
                    option('Price: High to Low', sort == BuySellSort.priceHigh,
                        () => sort = BuySellSort.priceHigh),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: ServiceColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () => Navigator.pop(sheet, true),
                    child: Text(
                      'Apply',
                      style: servicePoppins(size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  if (applied == true) {
    ref.read(buySellFilterProvider.notifier).state =
        BuySellFilter(condition: condition, sort: sort);
    return true;
  }
  return false;
}

/// Outlined option box (Memory / Color on details, filter sheet).
class BuySellOptionChip extends StatelessWidget {
  const BuySellOptionChip({
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
        duration: const Duration(milliseconds: 150),
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 9),
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: selected ? ServiceColors.primary : BuySellColors.optionGrey,
          ),
        ),
        child: Text(
          label,
          style: servicePoppins(
            size: 13,
            color: selected ? ServiceColors.primary : BuySellColors.optionGrey,
          ),
        ),
      ),
    );
  }
}

/// Blue "Get in touch" pill with white phone circle on the left.
class BuySellContactButton extends StatelessWidget {
  const BuySellContactButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ServiceColors.primary,
      borderRadius: BorderRadius.circular(28),
      elevation: 3,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: SizedBox(
          height: 46,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FC),
                    shape: BoxShape.circle,
                    border: Border.all(color: ServiceColors.primary, width: 1.5),
                  ),
                  child: const Icon(Icons.call, size: 18, color: Colors.black),
                ),
              ),
              Text(
                'Get in touch',
                style: servicePoppins(
                  size: 15,
                  weight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
