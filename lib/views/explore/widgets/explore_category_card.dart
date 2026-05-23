import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/category_model.dart';

class ExploreCategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const ExploreCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: category.backgroundColor.withValues(alpha: 0.7),
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
                child: AppImage(path: category.imagePath, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  category.displayName,
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
