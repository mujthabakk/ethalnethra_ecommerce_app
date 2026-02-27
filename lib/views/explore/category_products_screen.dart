import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_router.dart';
import '../../models/product_model.dart';
import '../home/widgets/search_bar_widget.dart';
import '../home/widgets/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const CategoryProductsScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkBackground,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBackground,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'asstes/icons/ic_filter_icon.png',
              width: 17,
              height: 17,
            ),
            onPressed: () => context.push(AppRouter.filter),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CustomSearchBar(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7, // Adjusted for typical product card
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
