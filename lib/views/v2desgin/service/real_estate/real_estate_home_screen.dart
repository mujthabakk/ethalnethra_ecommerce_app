import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'real_estate_data.dart';
import 'real_estate_widgets.dart';

/// Figma Real Estate home — search, type chips, featured + nearby.
class RealEstateHomeScreen extends ConsumerStatefulWidget {
  const RealEstateHomeScreen({super.key});

  @override
  ConsumerState<RealEstateHomeScreen> createState() =>
      _RealEstateHomeScreenState();
}

class _RealEstateHomeScreenState extends ConsumerState<RealEstateHomeScreen> {
  final _search = TextEditingController();
  String? _type = 'Apartments';
  String _nearbyFilter = 'All';
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _open(Property p) =>
      context.push(AppRouter.realEstateDetails, extra: p);

  /// Type chip narrows results, but never empties a section — fall back to
  /// the unfiltered list so the page keeps the Figma look.
  List<Property> _apply(List<Property> source, {String? nearby}) {
    final byQuery =
        source.where((p) => RealEstateData.matchesQuery(p, _query)).toList();
    if (_query.trim().isNotEmpty) {
      return byQuery
          .where((p) => nearby == null || RealEstateData.matchesNearby(p, nearby))
          .toList();
    }
    final byType =
        byQuery.where((p) => RealEstateData.matchesType(p, _type)).toList();
    final base = byType.isEmpty ? byQuery : byType;
    if (nearby == null) return base;
    return base.where((p) => RealEstateData.matchesNearby(p, nearby)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final featured = _apply(RealEstateData.featured);
    final nearby = _apply(RealEstateData.nearby, nearby: _nearbyFilter);
    final bottom = MediaQuery.paddingOf(context).bottom;

    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: ServiceLocationHeader(
                  avatar: RealEstateAssets.avatar,
                  pinIcon: RealEstateAssets.pinBlue,
                ),
              ),
              SliverToBoxAdapter(child: _buildSearch()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: RealEstateChipRow(
                    labels: RealEstateData.propertyTypes,
                    isSelected: (l) => l == _type,
                    onTap: (l) =>
                        setState(() => _type = _type == l ? null : l),
                  ),
                ),
              ),
              if (featured.isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 34, bottom: 18),
                    child: RealEstateSectionHeader(
                      title: 'Featured Listings',
                      onSeeAll: () =>
                          context.push(AppRouter.realEstateFeatured),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: _buildFeatured(featured)),
              ],
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 22),
                  child: RealEstateSectionHeader(
                    title: 'Nearby Properties',
                    onSeeAll: () => setState(() => _nearbyFilter = 'All'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: RealEstateChipRow(
                  labels: RealEstateData.nearbyFilters,
                  isSelected: (l) => l == _nearbyFilter,
                  onTap: (l) => setState(() => _nearbyFilter = l),
                ),
              ),
              if (nearby.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: Text(
                        'No properties found',
                        style: servicePoppins(
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 34, 20, 24 + bottom),
                sliver: SliverGrid(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 28,
                    crossAxisSpacing: 22,
                    childAspectRatio: 181 / 211,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => NearbyPropertyTile(
                      property: nearby[i],
                      onTap: () => _open(nearby[i]),
                    ),
                    childCount: nearby.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const ServiceIcon(
                    RealEstateAssets.search,
                    size: 17,
                    fallback: Icons.search,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _search,
                      onChanged: (v) => setState(() => _query = v),
                      textInputAction: TextInputAction.search,
                      style: servicePoppins(size: 15),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: servicePoppins(
                          size: 15,
                          weight: FontWeight.w300,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _search.clear();
                        setState(() => _query = '');
                      },
                      child: const Icon(Icons.close, size: 18),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          ServiceCircleButton(
            size: 52,
            onTap: _showFilterSheet,
            child: const ServiceIcon(
              RealEstateAssets.filter,
              size: 22,
              fallback: Icons.tune,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatured(List<Property> items) {
    final width = (MediaQuery.sizeOf(context).width - 56).clamp(260.0, 328.0);
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, i) => SizedBox(
          width: width,
          child: Align(
            alignment: Alignment.topCenter,
            child: FeaturedPropertyCard(
              property: items[i],
              onTap: () => _open(items[i]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showFilterSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheet) {
          Widget group(String title, List<String> labels, bool Function(String) sel,
              ValueChanged<String> tap) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: servicePoppins(size: 15, weight: FontWeight.w500)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final l in labels)
                      RealEstatePillChip(
                        label: l,
                        selected: sel(l),
                        onTap: () {
                          tap(l);
                          setSheet(() {});
                          setState(() {});
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 22),
              ],
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Filters',
                      style: servicePoppins(size: 17, weight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 18),
                  group('Property type', RealEstateData.propertyTypes,
                      (l) => l == _type, (l) => _type = _type == l ? null : l),
                  group('Listing', RealEstateData.nearbyFilters,
                      (l) => l == _nearbyFilter, (l) => _nearbyFilter = l),
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
                      onPressed: () => Navigator.pop(sheetContext),
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
  }
}
