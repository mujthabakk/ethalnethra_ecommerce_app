import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/providers/favorites_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_network_image.dart';
import 'v2_assets.dart';

/// Figma My wishlist — search, chips, 2-col product cards.
class V2WishlistScreen extends ConsumerStatefulWidget {
  const V2WishlistScreen({super.key});

  @override
  ConsumerState<V2WishlistScreen> createState() => _V2WishlistScreenState();
}

class _V2WishlistScreenState extends ConsumerState<V2WishlistScreen> {
  static const _green = Color(0xFF0E5A03);
  static const _grey = Color(0xFFDADADA);
  static const _chipBg = Color(0xFFF2F2F2);

  static const _chips = ['All items', 'Fruits', 'Vegetables', 'Dairy'];

  int _chip = 0;

  @override
  Widget build(BuildContext context) {
    final favAsync = ref.watch(favoritesNotifierProvider);
    final favorites = favAsync.value ?? const [];
    final items = favorites
        .map((item) => _WishItem(item.imageUrl, item.name, item.price.round(), item.id))
        .toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildSearchRow(),
              _buildChips(),
              if (items.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await ref
                            .read(favoritesNotifierProvider.notifier)
                            .addAllToCart();
                        if (context.mounted) context.push(AppRouter.v2Cart);
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    child: Text(
                      'Add all to cart',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: _green,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: favAsync.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : favAsync.hasError
                        ? Center(child: Text(favAsync.error.toString()))
                        : items.isEmpty
                            ? Center(
                                child: Text(
                                  'No saved products',
                                  style: GoogleFonts.poppins(),
                                ),
                              )
                            : GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: favAsync.isLoading ? 0 : items.length,
                  itemBuilder: (context, i) => _WishCard(
                    item: items[i],
                    onRemove: () => ref
                        .read(favoritesNotifierProvider.notifier)
                        .toggleFavorite(items[i].id),
                    onAddCart: () async {
                      try {
                        await ref
                            .read(favoritesNotifierProvider.notifier)
                            .moveSelectedToCart([items[i].id]);
                        if (context.mounted) context.push(AppRouter.v2Cart);
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: Row(
        children: [
          _circleBtn(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.v2Home);
              }
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              'My wishlist',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          _circleBtn(
            onTap: () => context.push(AppRouter.v2Cart),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 20,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn({required VoidCallback onTap, required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Widget _buildSearchRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: _chipBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _grey),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 22, color: Colors.grey.shade600),
                  const SizedBox(width: 10),
                  Text(
                    'Search your wishlist',
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _chipBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _grey),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              V2Assets.wishFilter,
              width: 20,
              height: 18,
              errorBuilder: (_, __, ___) => Icon(
                Icons.tune_rounded,
                color: Colors.grey.shade800,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final active = _chip == i;
          return GestureDetector(
            onTap: () => setState(() => _chip = i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? _green : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: active ? _green : _grey,
                ),
              ),
              child: Text(
                _chips[i],
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WishItem {
  _WishItem(this.image, this.name, this.price, this.id);
  final String image;
  final String name;
  final int price;
  final String id;
}

class _WishCard extends StatelessWidget {
  const _WishCard({
    required this.item,
    required this.onRemove,
    required this.onAddCart,
  });

  final _WishItem item;
  final VoidCallback onRemove;
  final VoidCallback onAddCart;

  static const _green = Color(0xFF0E5A03);
  static const _grey = Color(0xFFDADADA);
  static const _cardBg = Color(0xFFEBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _grey.withValues(alpha: 0.6)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AppImage(
                      path: item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_vert_rounded,
                      size: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '₹ ${item.price}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 14,
                        color: _green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'In stock',
                        style: GoogleFonts.poppins(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                          color: _green,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: onAddCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 34),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: onRemove,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Remove',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
