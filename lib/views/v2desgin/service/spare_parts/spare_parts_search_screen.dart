import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'spare_parts_data.dart';
import 'spare_parts_widgets.dart';

/// Figma "Search Parts" — category cards + Recommended for you.
class SparePartsSearchScreen extends StatefulWidget {
  const SparePartsSearchScreen({super.key});

  @override
  State<SparePartsSearchScreen> createState() => _SparePartsSearchScreenState();
}

class _SparePartsSearchScreenState extends State<SparePartsSearchScreen> {
  final _controller = TextEditingController();
  String _query = '';
  String? _category;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _open(SparePart p) =>
      context.push(AppRouter.sparePartsDetails, extra: p);

  List<SparePart> get _results {
    if (_query.trim().isNotEmpty) return SparePartsData.search(_query);
    if (_category != null) return SparePartsData.byCategory(_category!);
    return SparePartsData.parts.take(4).toList();
  }

  String get _resultsTitle {
    if (_query.trim().isNotEmpty) return 'Results';
    return _category ?? 'Recommended for you';
  }

  Future<void> _showFilter() async {
    final picked = await showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheet) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Filter by category',
                style: servicePoppins(size: 16, weight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text('All parts', style: servicePoppins()),
              trailing: _category == null
                  ? const Icon(Icons.check, color: ServiceColors.primary)
                  : null,
              onTap: () => Navigator.pop(sheet, ''),
            ),
            for (final c in SparePartsData.categories)
              ListTile(
                title: Text(c.name, style: servicePoppins()),
                trailing: _category == c.name
                    ? const Icon(Icons.check, color: ServiceColors.primary)
                    : null,
                onTap: () => Navigator.pop(sheet, c.name),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (picked == null) return;
    setState(() => _category = picked.isEmpty ? null : picked);
  }

  @override
  Widget build(BuildContext context) {
    final searching = _query.trim().isNotEmpty;
    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: ServicePageHeader(title: 'Search Parts'),
                ),
              ),
              SliverToBoxAdapter(child: _buildSearch()),
              if (!searching)
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(28, 20, 26, 0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 22,
                      crossAxisSpacing: 14,
                      childAspectRatio: 163 / 76,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (_, i) {
                        final c = SparePartsData.categories[i];
                        return _CategoryCard(
                          category: c,
                          selected: _category == c.name,
                          onTap: () => setState(
                            () => _category = _category == c.name ? null : c.name,
                          ),
                        );
                      },
                      childCount: SparePartsData.categories.length,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 34, 26, 22),
                  child: Text(
                    _resultsTitle,
                    style: servicePoppins(size: 18, weight: FontWeight.w500),
                  ),
                ),
              ),
              SparePartGrid(parts: _results, onTap: _open),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 4, 22, 0),
      child: Row(
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
                  const Icon(Icons.search, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: (v) => setState(() => _query = v),
                      textInputAction: TextInputAction.search,
                      style: servicePoppins(size: 14),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: servicePoppins(
                          size: 14,
                          weight: FontWeight.w300,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _controller.clear();
                        setState(() => _query = '');
                      },
                      child: const Icon(Icons.close, size: 18),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          ServiceCircleButton(
            size: 42,
            onTap: _showFilter,
            child: const ServiceIcon(
              SparePartsAssets.filter,
              size: 20,
              fallback: Icons.tune,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final PartCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? ServiceColors.primary : Colors.transparent,
            width: 1.4,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            children: [
              Positioned(
                right: -6,
                top: 0,
                bottom: 0,
                width: 72,
                child: Image.asset(
                  category.image,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                  filterQuality: FilterQuality.medium,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
              Positioned(
                left: 7,
                right: 70,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    category.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: servicePoppins(size: 11.5, weight: FontWeight.w500),
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
