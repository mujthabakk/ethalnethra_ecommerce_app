import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'buy_sell_data.dart';
import 'buy_sell_widgets.dart';

/// Figma Buy & Sell search results.
class BuySellResultsScreen extends ConsumerStatefulWidget {
  const BuySellResultsScreen({
    super.key,
    this.query = '',
    this.category,
    this.title,
  });

  final String query;
  final String? category;

  /// Label used when there is no text query (category / see all).
  final String? title;

  @override
  ConsumerState<BuySellResultsScreen> createState() =>
      _BuySellResultsScreenState();
}

class _BuySellResultsScreenState extends ConsumerState<BuySellResultsScreen> {
  late final _controller = TextEditingController(text: widget.query);
  late String _query = widget.query;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit(String v) {
    setState(() => _query = v.trim());
    rememberBuySellSearch(ref, v);
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(buySellFilterProvider);
    final location = ref.watch(buySellLocationProvider) ?? 'Thrissur, Kerala';
    final results = BuySellData.search(
      query: _query,
      category: _query.isEmpty ? widget.category : null,
      filter: filter,
    );
    final label = _query.isNotEmpty ? _query : (widget.title ?? 'all items');
    final bottom = MediaQuery.paddingOf(context).bottom;

    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 24, 0),
                child: Row(
                  children: [
                    ServiceCircleButton(
                      size: 46,
                      onTap: () => context.pop(),
                      child: const Icon(Icons.arrow_back, size: 22),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 46,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF8A9BAA)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, size: 19),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                textInputAction: TextInputAction.search,
                                onSubmitted: _submit,
                                style: servicePoppins(size: 13.5),
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  hintText: 'Search',
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
                    const SizedBox(width: 8),
                    const BuySellFilterButton(size: 46),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => pickBuySellLocation(context, ref),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: BuySellColors.chipBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ServiceColors.primary.withValues(alpha: 0.45),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on_outlined, size: 18),
                          const SizedBox(width: 8),
                          Text(location, style: servicePoppins(size: 12.5)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Showing:  ',
                        style: servicePoppins(
                          size: 13,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                      TextSpan(
                        text: '${results.length} results for $label',
                        style: servicePoppins(size: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (results.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Center(
                    child: Text(
                      'No items found',
                      style: servicePoppins(color: ServiceColors.textSecondary),
                    ),
                  ),
                ),
              ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 24, 28 + bottom),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 16,
                  childAspectRatio: 177 / 248,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, i) => BuySellCard(
                    listing: results[i],
                    showFeatured: false,
                    heartLeft: true,
                    onTap: () => context.push(
                      AppRouter.buySellDetails,
                      extra: results[i],
                    ),
                  ),
                  childCount: results.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
