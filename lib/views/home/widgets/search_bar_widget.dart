import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_router.dart';
import '../../../services/mock_data_service.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onSubmitted: (value) {
          if (value.toLowerCase().contains('egg')) {
            context.push(
              AppRouter.categoryProducts,
              extra: {
                'title': 'Egg Results',
                'products': MockDataService.getEggsAndMore(),
              },
            );
          }
        },
        decoration: InputDecoration(
          hintText: "Search Store",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'asstes/icons/ic_search.png',
              width: 18,
              height: 18,
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
