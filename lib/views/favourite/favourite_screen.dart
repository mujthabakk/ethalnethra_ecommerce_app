import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/mappers/favorite_product_mapper.dart';
import '../../core/providers/favorites_providers.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/favourite_item_widget.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  final Set<String> _selectedIds = {};
  bool _isAddingAll = false;
  bool _isMovingSelected = false;

  void _toggleSelection(String id, bool selected) {
    setState(() {
      if (selected) {
        _selectedIds.add(id);
      } else {
        _selectedIds.remove(id);
      }
    });
  }

  Future<void> _addAllToCart() async {
    setState(() => _isAddingAll = true);
    try {
      await ref.read(favoritesNotifierProvider.notifier).addAllToCart();
      if (!mounted) return;
      setState(() => _selectedIds.clear());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All favorites added to cart.'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isAddingAll = false);
    }
  }

  Future<void> _moveSelectedToCart() async {
    if (_selectedIds.isEmpty) return;
    setState(() => _isMovingSelected = true);
    try {
      await ref
          .read(favoritesNotifierProvider.notifier)
          .moveSelectedToCart(_selectedIds.toList());
      if (!mounted) return;
      setState(() => _selectedIds.clear());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selected items moved to cart.'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isMovingSelected = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final favAsync = ref.watch(favoritesNotifierProvider);
    final busy = _isAddingAll || _isMovingSelected;

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
              if (_selectedIds.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${_selectedIds.length} selected',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: favourites.length,
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 20,
                        top: 10,
                        bottom: 150,
                      ),
                      itemBuilder: (context, index) {
                        final dto = favourites[index];
                        final p = dto.toProductModel();
                        return FavouriteItemWidget(
                          product: p,
                          selected: _selectedIds.contains(dto.id),
                          onSelectedChanged: busy
                              ? null
                              : (v) => _toggleSelection(dto.id, v),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 25,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_selectedIds.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: OutlinedButton(
                                  onPressed: busy ? null : _moveSelectedToCart,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.primary,
                                    side: const BorderSide(
                                      color: AppColors.primary,
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19),
                                    ),
                                  ),
                                  child: _isMovingSelected
                                      ? const SizedBox(
                                          height: 22,
                                          width: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Text(
                                          'Add Selected to Cart (${_selectedIds.length})',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          SizedBox(
                            width: double.infinity,
                            height: 67,
                            child: ElevatedButton(
                              onPressed: busy ? null : _addAllToCart,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                disabledBackgroundColor:
                                    const Color(0xFFE2E2E2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                elevation: 0,
                              ),
                              child: _isAddingAll
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
