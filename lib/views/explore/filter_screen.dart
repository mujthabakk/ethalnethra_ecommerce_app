import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> categories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  final List<String> brands = [
    'Individual Callection',
    'Cocola',
    'Ifad',
    'Kazi Farmas',
  ];

  String selectedCategory = 'Eggs';
  String selectedBrand = 'Cocola';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF2F3F2,
      ), // Light grey background like screenshot
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories', style: AppTextStyles.filterSectionTitle),
              const SizedBox(height: 20),
              ...categories.map(
                (cat) => _buildFilterItem(
                  cat,
                  selectedCategory == cat,
                  (val) => setState(() => selectedCategory = cat),
                ),
              ),
              const SizedBox(height: 40),
              Text('Brand', style: AppTextStyles.filterSectionTitle),
              const SizedBox(height: 20),
              ...brands.map(
                (brand) => _buildFilterItem(
                  brand,
                  selectedBrand == brand,
                  (val) => setState(() => selectedBrand = brand),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  elevation: 0,
                ),
                child: Text('Apply Filter', style: AppTextStyles.filterButton),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterItem(
    String title,
    bool isSelected,
    Function(bool?) onChanged,
  ) {
    return InkWell(
      onTap: () => onChanged(!isSelected),
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
            Text(
              title,
              style: isSelected
                  ? AppTextStyles.filterOptionSelected
                  : AppTextStyles.filterOptionUnselected,
            ),
          ],
        ),
      ),
    );
  }
}
