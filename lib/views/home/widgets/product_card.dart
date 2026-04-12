import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/product_model.dart';
import '../../../core/providers/cart_provider.dart';
import 'pre_order_modal.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  /// When set (e.g. home “Exclusive Offer”), width fits ~2 cards per viewport.
  final double? width;

  const ProductCard({super.key, required this.product, this.width});

  @override
  Widget build(BuildContext context) {
    final showPreOrder = product.isPreOrder;

    return InkWell(
      onTap: () {
        context.push(AppRouter.productDetail, extra: product);
      },
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: width ?? 173,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'product_${product.id}',
                  child: AppImage(path: product.imagePath, fit: BoxFit.contain),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.productCardTitle,
            ),
            const SizedBox(height: 5),
            // Description left, price right (flex so price can shrink in narrow cards)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    product.description,
                    style: AppTextStyles.productCardSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    '₹${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.productCardPrice,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Buttons row: take remaining width, buttons at end to avoid overflow
            Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                if (showPreOrder) ...[
                  _PreOrderButton(
                    onTap: () {
                      PreOrderModal.show(context, product);
                    },
                  ),
                  const SizedBox(width: 8),
                ],
                _InstantBasketButton(
                  onTap: () {
                    context.read<CartProvider>().addItemToInstant(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart!'),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Orange rounded-square button with clock icon (Add To Pre-order Basket).
class _PreOrderButton extends StatelessWidget {
  final VoidCallback onTap;

  const _PreOrderButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.preOrderOrange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.schedule_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

/// Green rounded-square button with plus icon (Add To Instant Basket).
class _InstantBasketButton extends StatelessWidget {
  final VoidCallback onTap;

  const _InstantBasketButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
