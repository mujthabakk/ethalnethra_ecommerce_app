import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/providers/cart_providers.dart';
import '../../../core/utils/auth_guard.dart';
import '../../../core/utils/custom_order_quantity.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/product_model.dart';

/// Modal shown when user taps pre-order on a product card. Single CTA: Add To Pre-order Basket.
class PreOrderModal extends ConsumerWidget {
  final ProductModel product;

  const PreOrderModal({super.key, required this.product});

  static void show(BuildContext context, ProductModel product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PreOrderModal(product: product),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        top: 25,
        bottom: 25 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE2E2E2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppImage(
                  path: product.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.displayName,
                      style: AppTextStyles.productCardTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: AppTextStyles.productCardSubtitle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '₹${product.price.toStringAsFixed(2)}',
                                style: AppTextStyles.productCardPrice,
                              ),
                              TextSpan(
                                text: ' /${product.unitLabel}',
                                style: AppTextStyles.productCardSubtitle
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        if (product.showDiscount) ...[
                          const SizedBox(width: 8),
                          Text(
                            '₹${product.listPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7C7C7C),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 67,
            child: ElevatedButton(
              onPressed: () async {
                if (!await ensureLoggedIn(context, ref)) return;
                try {
                  await ref.read(cartNotifierProvider.notifier).addToCart(
                        product.id,
                        quantity: (product.isCustomOrder || product.isGramWise)
                            ? CustomOrderQuantity.initial(
                                isGramWise: product.isGramWise,
                              )
                            : 1,
                        preorder: true,
                      );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    await showAddedToCartPopup(
                      context,
                      productName: product.displayName,
                      preorder: true,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    await showCartOrAuthError(context, e);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
                elevation: 0,
              ),
              child: Text(
                'Add To Pre-order Basket',
                style: AppTextStyles.productDetailButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
