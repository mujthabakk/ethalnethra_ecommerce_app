import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_shimmer.dart';
import '../../core/mappers/category_image_path.dart';
import '../../core/models/catalog/category_item_extensions.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/routes/app_router.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../home/widgets/home_store_search_bar.dart';
import 'widgets/explore_category_card.dart';

const _exploreCategoryColors = [
  Color(0xFFF8E8D0),
  Color(0xFFE5F3EA),
  Color(0xFFE8E0F5),
  Color(0xFFFFF3E0),
  Color(0xFFE3F2FD),
];

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(homeCategoriesProvider);

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const HomeStoreSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: categoriesAsync.when(
                loading: () => const ExploreGridShimmer(),
                error: (_, __) => Center(
                  child: Text(
                    'Could not load categories',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                data: (categoryItems) {
                  if (categoryItems.isEmpty) {
                    return Center(
                      child: Text(
                        'No categories',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    );
                  }

                  return GridView.builder(
                    itemCount: categoryItems.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final category = categoryItems[index];
                      final model = CategoryModel(
                        id: category.id,
                        name: category.name,
                        nameMl: category.nameMl,
                        imagePath: categoryDisplayImagePath(category),
                        backgroundColor: _exploreCategoryColors[
                            index % _exploreCategoryColors.length],
                      );
                      return ExploreCategoryCard(
                        category: model,
                        onTap: () {
                          context.push(
                            AppRouter.categoryProducts,
                            extra: {
                              'title': category.displayName,
                              'products': const <ProductModel>[],
                              'apiCategory': category.name,
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
