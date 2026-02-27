import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 105,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image.asset(
            category.imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 15),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBackground,
            ),
          ),
        ],
      ),
    );
  }
}
