import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../services/mock_data_service.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/banner_widget.dart';
import 'widgets/section_header.dart';
import 'widgets/product_card.dart';
import 'widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Location Header
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asstes/images/location.png',
                        width: 15,
                        height: 18,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Kochi, kerala',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Search Bar
                const CustomSearchBar(),
                const SizedBox(height: 20),
                // Banner Carousel placeholder
                Row(
                  children: [
                    const Expanded(child: HomeBanner()),
                    const SizedBox(width: 10),
                    // "Our Services" side banner
                    Container(
                      width: 110,
                      height: 115,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA2D3B1).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'asstes/images/service.png',
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Our Services',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF53B175),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Exclusive Offer
                SectionHeader(title: 'Exclusive Offer', onSeeAll: () {}),
                const SizedBox(height: 15),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: MockDataService.getExclusiveOffers().length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: MockDataService.getExclusiveOffers()[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                // Best Selling
                SectionHeader(title: 'Best Selling', onSeeAll: () {}),
                const SizedBox(height: 15),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: MockDataService.getBestSelling().length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: MockDataService.getBestSelling()[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                // Groceries Section
                SectionHeader(title: 'Groceries', onSeeAll: () {}),
                const SizedBox(height: 15),
                SizedBox(
                  height: 105,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: MockDataService.getGroceries().length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        category: MockDataService.getGroceries()[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25),
                // Meat & Fish products (using same product card)
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: MockDataService.getMeatProducts().length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: MockDataService.getMeatProducts()[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
