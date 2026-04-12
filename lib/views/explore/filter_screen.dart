import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/catalog/filters_response.dart';
import '../../core/providers/catalog_providers.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  /// User override; when null, first API item is treated as selected for display.
  String? _pickedCategory;
  String? _pickedBrand;

  String? _effectiveChoice(String? picked, List<String> options) {
    if (options.isEmpty) return null;
    if (picked != null && options.contains(picked)) return picked;
    return options.first;
  }

  void _applyAndPop(FiltersResponse data) {
    final categories = data.categories;
    final brands = data.brands;
    final category = _effectiveChoice(_pickedCategory, categories);
    final brand = brands.isEmpty
        ? null
        : _effectiveChoice(_pickedBrand, brands);
    context.pop(<String, String?>{
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtersAsync = ref.watch(filtersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF181725), size: 24),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
      ),
      body: filtersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load filters',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text('$e', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(filtersProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (data) {
          final categories = data.categories;
          final brands = data.brands;
          final categorySel = _effectiveChoice(_pickedCategory, categories);
          final brandSel =
              brands.isEmpty ? null : _effectiveChoice(_pickedBrand, brands);

          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: AppTextStyles.filterSectionTitle),
                  const SizedBox(height: 20),
                  if (categories.isEmpty)
                    Text(
                      'No categories available.',
                      style: TextStyle(color: Colors.grey.shade700),
                    )
                  else
                    ...categories.map(
                      (cat) => _buildFilterItem(
                        cat,
                        categorySel == cat,
                        () => setState(() => _pickedCategory = cat),
                      ),
                    ),
                  const SizedBox(height: 40),
                  Text('Brand', style: AppTextStyles.filterSectionTitle),
                  const SizedBox(height: 20),
                  if (brands.isEmpty)
                    Text(
                      'No brands available.',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    )
                  else
                    ...brands.map(
                      (brand) => _buildFilterItem(
                        brand,
                        brandSel == brand,
                        () => setState(() => _pickedBrand = brand),
                      ),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: categories.isEmpty
                        ? null
                        : () => _applyAndPop(data),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: const Color(0xFFE2E2E2),
                      minimumSize: const Size(double.infinity, 67),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      elevation: 0,
                    ),
                    child:
                        Text('Apply Filter', style: AppTextStyles.filterButton),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterItem(
    String title,
    bool isSelected,
    VoidCallback onSelect,
  ) {
    return InkWell(
      onTap: onSelect,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFFB1B1B1),
                  width: 1.5,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: isSelected
                    ? AppTextStyles.filterOptionSelected
                    : AppTextStyles.filterOptionUnselected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
