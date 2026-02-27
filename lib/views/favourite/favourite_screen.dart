import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/favourites_provider.dart';
import '../../core/providers/cart_provider.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/favourite_item_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavouritesProvider>();
    final favourites = favProvider.items.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorurite', // Spelling from screenshot
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E2E2), height: 1),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomSearchBar(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: favourites.isEmpty
          ? const Center(
              child: Text(
                'No Favourites Yet',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF7C7C7C),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
            : Stack(
                children: [
                  ListView.builder(
                    itemCount: favourites.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemBuilder: (context, index) {
                      return FavouriteItemWidget(product: favourites[index]);
                    },
                  ),
                  Positioned(
                    bottom: 25,
                    left: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        final cart = context.read<CartProvider>();
                        for (var product in favourites) {
                          cart.addItemToInstant(product);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("All items added to cart!"),
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size(double.infinity, 67),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Add All To Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
