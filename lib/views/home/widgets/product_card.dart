import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/providers/cart_providers.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/product_model.dart';
import 'pre_order_modal.dart';

class ProductCard extends ConsumerWidget {
  final ProductModel product;
  final double? width;

  const ProductCard({super.key, required this.product, this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              product.displayName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.productCardTitle,
            ),
            const SizedBox(height: 5),
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
                  onTap: () async {
                    try {
                      await ref
                          .read(cartNotifierProvider.notifier)
                          .addToCart(product.id, quantity: 1, preorder: false);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${product.displayName} added to cart!',
                            ),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$e'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    }
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
