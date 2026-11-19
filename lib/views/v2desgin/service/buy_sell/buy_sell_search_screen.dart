import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'buy_sell_data.dart';
import 'buy_sell_widgets.dart';

/// Figma Buy & Sell "Search" — recent searches + popular categories.
class BuySellSearchScreen extends ConsumerStatefulWidget {
  const BuySellSearchScreen({super.key});

  @override
  ConsumerState<BuySellSearchScreen> createState() =>
      _BuySellSearchScreenState();
}

class _BuySellSearchScreenState extends ConsumerState<BuySellSearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search(String term) {
    final t = term.trim();
    if (t.isEmpty) return;
    rememberBuySellSearch(ref, t);
    context.push(AppRouter.buySellResults, extra: {'query': t});
  }

  @override
  Widget build(BuildContext context) {
    final recent = ref.watch(buySellRecentSearchesProvider);

    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          children: [
            Row(
              children: [
                ServiceCircleButton(
                  size: 42,
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back, size: 22),
                ),
                const SizedBox(width: 24),
                Text(
                  'Search',
                  style: servicePoppins(size: 17, weight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, size: 19),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            autofocus: true,
                            textInputAction: TextInputAction.search,
                            onSubmitted: _search,
                            style: servicePoppins(size: 13.5),
                            decoration: InputDecoration(
                              isCollapsed: true,
                              border: InputBorder.none,
                              hintText: 'Find cars mobiles & more....',
                              hintStyle: servicePoppins(
                                size: 13.5,
                                weight: FontWeight.w300,
                                color: ServiceColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                BuySellFilterButton(
                  size: 42,
                  onApplied: () => context.push(
                    AppRouter.buySellResults,
                    extra: {'query': _controller.text.trim()},
                  ),
                ),
              ],
            ),
            if (recent.isNotEmpty) ...[
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Recent search',
                      style: servicePoppins(size: 14, weight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => ref
                        .read(buySellRecentSearchesProvider.notifier)
                        .state = const [],
                    child: Text(
                      'Clear all',
                      style: servicePoppins(
                        size: 13,
                        color: BuySellColors.clearAll,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              for (final term in recent)
                InkWell(
                  onTap: () => _search(term),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.schedule, size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(term, style: servicePoppins(size: 13)),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            final n = ref.read(
                              buySellRecentSearchesProvider.notifier,
                            );
                            n.state =
                                n.state.where((e) => e != term).toList();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.close, size: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
            const SizedBox(height: 24),
            Text(
              'Popular categories',
              style: servicePoppins(size: 14, weight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            for (final c in BuySellData.popularCategories)
              InkWell(
                onTap: () => context.push(
                  AppRouter.buySellResults,
                  extra: {'category': c.$2, 'title': c.$1},
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(c.$1, style: servicePoppins(size: 13)),
                      ),
                      const Icon(Icons.chevron_right, size: 26),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
