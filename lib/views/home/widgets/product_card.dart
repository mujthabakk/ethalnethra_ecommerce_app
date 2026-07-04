import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/providers/cart_providers.dart';
import '../../../core/utils/custom_order_quantity.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/product_model.dart';
import 'pre_order_modal.dart';

class ProductCard extends ConsumerWidget {
  final ProductModel product;
  final double? width;

  const ProductCard({
    super.key,
    required this.product,
    this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPreOrder = product.preorderAvailable;
    final showInstant = product.instantOrderAvailable;

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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: AppImage(
                        path: product.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (product.discountLabel.isNotEmpty)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: _DiscountBadge(text: product.discountLabel),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.displayName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.productCardTitle,
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    product.stockLabel,
                    style: AppTextStyles.productCardSubtitle.copyWith(
                      color: product.isInStock
                          ? const Color(0xFF7C7C7C)
                          : Colors.red.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (product.showDiscount)
                        Text(
                          '₹${product.listPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF7C7C7C),
                            decoration: TextDecoration.lineThrough,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '₹${product.price.toStringAsFixed(2)}',
                              style: AppTextStyles.productCardPrice,
                            ),
                            TextSpan(
                              text: ' /${product.unitLabel}',
                              style: AppTextStyles.productCardSubtitle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
                  if (showInstant) const SizedBox(width: 8),
                ],
                if (showInstant)
                  _InstantBasketButton(
                    onTap: () async {
                    try {
                      await ref
                          .read(cartNotifierProvider.notifier)
                          .addToCart(
                            product.id,
                            quantity:
                                (product.isCustomOrder || product.isGramWise)
                                ? CustomOrderQuantity.initial(
                                    isGramWise: product.isGramWise,
                                  )
                                : 1,
                            preorder: false,
                          );
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
                            backgroundColor: Colors.red.shade600,
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

class _DiscountBadge extends StatelessWidget {
  final String text;

  const _DiscountBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
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
          color: AppColors.primary,
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
          color: AppColors.preOrderOrange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
