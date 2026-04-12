import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/mappers/favorite_product_mapper.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/providers/favorites_providers.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/favourite_item_widget.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favAsync = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorurite',
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
      body: favAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load favorites',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text('$e', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(favoritesNotifierProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (favourites) {
          if (favourites.isEmpty) {
            return const Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomSearchBar(),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      'No Favourites Yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF7C7C7C),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: favourites.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemBuilder: (context, index) {
                        final p = favourites[index].toProductModel();
                        return FavouriteItemWidget(product: p);
                      },
                    ),
                    Positioned(
                      bottom: 25,
                      left: 20,
                      right: 20,
                      child: ElevatedButton(
                        onPressed: () async {
                          final notifier =
                              ref.read(cartNotifierProvider.notifier);
                          for (final dto in favourites) {
                            try {
                              await notifier.addToCart(
                                dto.id,
                                quantity: 1,
                                preorder: false,
                              );
                            } catch (_) {
                              /* continue with next */
                            }
                          }
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Items added to cart where possible.'),
                                duration: Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
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
          );
        },
      ),
    );
  }
}
