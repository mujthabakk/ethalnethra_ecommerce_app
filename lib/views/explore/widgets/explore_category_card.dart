import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';
import '../../../models/category_model.dart';
import '../../../services/mock_data_service.dart';

class ExploreCategoryCard extends StatelessWidget {
  final CategoryModel category;

  const ExploreCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Logically map categories to their product lists
        // In a real app, you'd fetch by ID, but here we use names for simplicity
        var products = MockDataService.getExclusiveOffers(); // default fallback
        var title = category.name.replaceAll('\n', ' ');

        if (title.contains('Beverages')) {
          products = MockDataService.getBeverages();
        } else if (title.contains('Fruits')) {
          products = MockDataService.getExclusiveOffers();
        } else if (title.contains('Dairy')) {
          products = MockDataService.getEggsAndMore();
        }

        context.push(
          AppRouter.categoryProducts,
          extra: {'title': title, 'products': products},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: category.backgroundColor.withOpacity(0.7),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(category.imagePath, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.exploreCategoryTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
