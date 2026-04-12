import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/mappers/catalog_product_mapper.dart';
import '../../../core/providers/catalog_providers.dart';
import '../../../core/routes/app_router.dart';

/// Home search: filters loaded products and opens results; updates [homeSearchQueryProvider] while typing.
class HomeStoreSearchBar extends ConsumerStatefulWidget {
  const HomeStoreSearchBar({super.key});

  @override
  ConsumerState<HomeStoreSearchBar> createState() => _HomeStoreSearchBarState();
}

class _HomeStoreSearchBarState extends ConsumerState<HomeStoreSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openResults(String rawQuery) {
    final q = rawQuery.trim();
    final productsAsync = ref.read(homeProductsProvider);
    final products = productsAsync.valueOrNull ?? [];
    final lower = q.toLowerCase();
    final filtered = lower.isEmpty
        ? products
        : products.where((p) => p.name.toLowerCase().contains(lower)).toList();

    if (!mounted) return;
    context.push(
      AppRouter.categoryProducts,
      extra: {
        'title': q.isEmpty ? 'All products' : 'Search: $q',
        'products': filtered.map((e) => e.toProductModel()).toList(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          ref.read(homeSearchQueryProvider.notifier).state = value;
        },
        onSubmitted: _openResults,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search Store',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'asstes/icons/ic_search.png',
              width: 18,
              height: 18,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.search,
                size: 22,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            color: AppColors.primary,
            onPressed: () => _openResults(_controller.text),
          ),
        ),
      ),
    );
  }
}
