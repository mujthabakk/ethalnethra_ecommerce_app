import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/mappers/catalog_product_mapper.dart';
import '../../core/providers/catalog_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_shimmer.dart';
import '../../models/product_model.dart';
import '../home/widgets/product_card.dart';

/// Lists products for a category, search, or curated type. Loads from the API when
/// [apiCategory], [apiSearch], [productType], or [fetchAll] is set; otherwise shows [initialProducts].
class CategoryProductsScreen extends ConsumerStatefulWidget {
  const CategoryProductsScreen({
    super.key,
    required this.title,
    this.initialProducts = const [],
    this.apiCategory,
    this.apiSearch,
    this.productType,
    this.fetchAll = false,
  });

  final String title;
  final List<ProductModel> initialProducts;
  final String? apiCategory;
  final String? apiSearch;
  final String? productType;
  final bool fetchAll;

  @override
  ConsumerState<CategoryProductsScreen> createState() =>
      _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends ConsumerState<CategoryProductsScreen> {
  final _searchController = TextEditingController();
  List<ProductModel> _allProducts = [];
  List<ProductModel> _visible = [];
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _allProducts = List<ProductModel>.from(widget.initialProducts);
    _visible = List<ProductModel>.from(_allProducts);
    final shouldFetch = widget.fetchAll ||
        (widget.apiSearch != null && widget.apiSearch!.isNotEmpty) ||
        (widget.apiCategory != null && widget.apiCategory!.isNotEmpty) ||
        (widget.productType != null && widget.productType!.isNotEmpty);
    if (shouldFetch) {
      _loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadFromApi());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadFromApi() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final repo = ref.read(catalogRepositoryProvider);
      final res = await repo.fetchProducts(
        limit: 50,
        page: 1,
        category: widget.apiCategory,
        search: widget.apiSearch,
        type: widget.productType,
      );
      if (!mounted) return;
      setState(() {
        _allProducts = res.products.map((e) => e.toProductModel()).toList();
        _applySearch();
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _allProducts = List<ProductModel>.from(widget.initialProducts);
        _applySearch();
        _loading = false;
      });
    }
  }

  void _applySearch() {
    final q = _searchController.text.trim().toLowerCase();
    setState(() {
      _visible = q.isEmpty
          ? List<ProductModel>.from(_allProducts)
          : _allProducts
              .where((p) => p.name.toLowerCase().contains(q))
              .toList();
    });
  }

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
          widget.title,
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
              errorBuilder: (_, __, ___) => const Icon(Icons.tune, size: 20),
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
            Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (_) => _applySearch(),
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
                ),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(
                'Using offline list: $_error',
                style: TextStyle(fontSize: 12, color: Colors.red.shade700),
              ),
            ],
            const SizedBox(height: 16),
            Expanded(
              child: _loading
                  ? const ProductGridShimmer(rows: 4)
                  : _visible.isEmpty
                      ? Center(
                          child: Text(
                            'No products found',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        )
                      : GridView.builder(
                          itemCount: _visible.length,
                          padding: const EdgeInsets.only(bottom: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(product: _visible[index]);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
