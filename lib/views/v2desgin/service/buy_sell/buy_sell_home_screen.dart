import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'buy_sell_data.dart';
import 'buy_sell_widgets.dart';

/// Figma Buy & Sell home.
class BuySellHomeScreen extends ConsumerStatefulWidget {
  const BuySellHomeScreen({super.key});

  @override
  ConsumerState<BuySellHomeScreen> createState() => _BuySellHomeScreenState();
}

class _BuySellHomeScreenState extends ConsumerState<BuySellHomeScreen> {
  static const _gap = 12.0;
  static const _side = 26.0;
  ScrollController? _scroll;
  double _cardW = 160;
  int _page = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.sizeOf(context).width;
    _cardW = (width - _side * 2 - _gap) / 2;
    // Start on the 2nd card so the 1st peeks in from the left (Figma).
    _scroll ??= ScrollController(initialScrollOffset: _cardW + _gap)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    final i = ((_scroll!.offset) / (_cardW + _gap)).round().clamp(
          0,
          BuySellData.recommended.length - 1,
        );
    if (i != _page) setState(() => _page = i);
  }

  @override
  void dispose() {
    _scroll?.dispose();
    super.dispose();
  }

  void _open(BuySellListing l) =>
      context.push(AppRouter.buySellDetails, extra: l);

  void _results({String query = '', String? category, String? title}) {
    context.push(
      AppRouter.buySellResults,
      extra: {'query': query, 'category': category, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    final recent = BuySellData.recentlyViewed;
    final bottom = MediaQuery.paddingOf(context).bottom;

    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearch()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26, 26, 26, 18),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Recommended for you',
                        style: servicePoppins(
                          size: 18,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _results(title: 'Recommended for you'),
                      child: Text(
                        'see all',
                        style: servicePoppins(
                          size: 13,
                          color: ServiceColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: _buildCarousel()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26, 28, 26, 18),
                child: Text(
                  'Browse categories',
                  style: servicePoppins(size: 18, weight: FontWeight.w500),
                ),
              ),
            ),
            SliverToBoxAdapter(child: _buildCategories()),
            SliverToBoxAdapter(child: _buildPromo()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 18),
                child: Text(
                  'Recently viewed',
                  style: servicePoppins(size: 18, weight: FontWeight.w500),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(26, 0, 24, 28 + bottom),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 177 / 248,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, i) => BuySellCard(
                    listing: recent[i],
                    onTap: () => _open(recent[i]),
                  ),
                  childCount: recent.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final picked = ref.watch(buySellLocationProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 18, 22, 22),
      child: Row(
        children: [
          ServiceCircleButton(
            size: 42,
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, size: 22),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => pickBuySellLocation(context, ref),
              child: Column(
                children: [
                  Text('Location', style: servicePoppins(size: 11.5)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ServiceIcon(
                        BuySellAssets.pinBlue,
                        size: 15,
                        fallback: Icons.location_on_outlined,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          picked ?? serviceLocationLabel(ref),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: servicePoppins(size: 12.5),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                BuySellAssets.logo,
                width: 30,
                height: 30,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.storefront,
                  color: ServiceColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Buy & Sell',
                style: servicePoppins(size: 12, weight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: GestureDetector(
        onTap: () => context.push(AppRouter.buySellSearch),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 20),
              const SizedBox(width: 12),
              Text(
                'Search',
                style: servicePoppins(
                  size: 14,
                  weight: FontWeight.w300,
                  color: ServiceColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    final items = BuySellData.recommended;
    return Column(
      children: [
        SizedBox(
          height: _cardW * 248 / 177,
          child: ListView.separated(
            controller: _scroll,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: _side),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: _gap),
            itemBuilder: (_, i) => SizedBox(
              width: _cardW,
              child: BuySellCard(
                listing: items[i],
                onTap: () => _open(items[i]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (i) {
            final active = i == _page;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? ServiceColors.primary
                    : ServiceColors.primary.withValues(alpha: 0.35),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    const cats = BuySellData.categories;
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 26),
        itemBuilder: (_, i) {
          final c = cats[i];
          return GestureDetector(
            onTap: () => _results(category: c.key, title: c.name),
            child: SizedBox(
              width: 58,
              child: Column(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: c.image != null
                          ? Image.asset(
                              c.image!,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.medium,
                            )
                          : ColoredBox(
                              color: Colors.white,
                              child: Icon(
                                c.icon,
                                color: ServiceColors.primary,
                                size: 28,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    c.name,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                    style: servicePoppins(size: 13),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: GestureDetector(
        onTap: () => _results(title: 'Special offers'),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: BuySellColors.promoBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned(
                  right: -2,
                  bottom: 22,
                  width: 180,
                  child: Image.asset(
                    BuySellAssets.promoCar,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: servicePoppins(
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                          children: [
                            const TextSpan(text: 'Special '),
                            TextSpan(
                              text: '40%',
                              style: servicePoppins(
                                size: 19,
                                weight: FontWeight.w500,
                                color: ServiceColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'discount for new users',
                        style: servicePoppins(size: 16, weight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 160,
                        child: Text(
                          'Get a chance to experience great values as a '
                          'first time user with our unlimited offer',
                          style: servicePoppins(
                            size: 10.5,
                            color: const Color(0xFF555555),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
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
