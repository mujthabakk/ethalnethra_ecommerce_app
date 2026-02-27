import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_router.dart';
import '../../services/mock_data_service.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/explore_category_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = MockDataService.getExploreCategories();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Find Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBackground,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.notifications),
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.darkBackground,
            ),
          ),
          IconButton(
            onPressed: () => context.push(AppRouter.editProfile),
            icon: const Icon(
              Icons.person_outline,
              color: AppColors.darkBackground,
            ),
          ),
          const SizedBox(width: 5),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CustomSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return ExploreCategoryCard(category: categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
