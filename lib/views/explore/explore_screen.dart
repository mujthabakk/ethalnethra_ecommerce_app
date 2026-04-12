import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_shimmer.dart';
import '../../core/mappers/category_image_path.dart';
import '../../core/models/catalog/category_item.dart';
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
    final filtersAsync = ref.watch(filtersProvider);
    final categoriesAsync = ref.watch(homeCategoriesProvider);

    final categoryItems = categoriesAsync.maybeWhen(
      data: (list) => list,
      orElse: () => <CategoryItem>[],
    );

    final fromCategoryNames =
        categoryItems.map((c) => c.name).toList();

    final names = filtersAsync.maybeWhen(
      data: (f) =>
          f.categories.isNotEmpty ? f.categories : fromCategoryNames,
      orElse: () => fromCategoryNames,
    );

    final byName = {
      for (final c in categoryItems) c.name.toLowerCase(): c,
    };

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const HomeStoreSearchBar(),
            const SizedBox(height: 20),
            Expanded(
              child: filtersAsync.isLoading &&
                      categoriesAsync.isLoading &&
                      names.isEmpty
                  ? const ExploreGridShimmer()
                  : names.isEmpty
                      ? Center(
                          child: Text(
                            filtersAsync.hasError
                                ? 'Could not load filters'
                                : 'No categories',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        )
                      : GridView.builder(
                          itemCount: names.length,
                          padding: const EdgeInsets.only(bottom: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) {
                            final title = names[index];
                            final match = byName[title.toLowerCase()];
                            final imagePath = match != null
                                ? categoryDisplayImagePath(match)
                                : categoryFallbackAssetForName(title);
                            final model = CategoryModel(
                              id: match?.id ?? title,
                              name: title,
                              imagePath: imagePath,
                              backgroundColor: _exploreCategoryColors[
                                  index % _exploreCategoryColors.length],
                            );
                            return ExploreCategoryCard(
                              category: model,
                              onTap: () {
                                context.push(
                                  AppRouter.categoryProducts,
                                  extra: {
                                    'title': title,
                                    'products': const <ProductModel>[],
                                    'apiCategory': title,
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
