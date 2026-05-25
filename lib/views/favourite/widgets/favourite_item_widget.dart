import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../models/product_model.dart';

class FavouriteItemWidget extends StatelessWidget {
  final ProductModel product;
  final bool selected;
  final ValueChanged<bool>? onSelectedChanged;

  const FavouriteItemWidget({
    super.key,
    required this.product,
    this.selected = false,
    this.onSelectedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRouter.productDetail, extra: product);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1)),
        ),
        child: Row(
          children: [
            if (onSelectedChanged != null)
              Checkbox(
                value: selected,
                activeColor: AppColors.primary,
                onChanged: (v) => onSelectedChanged!(v ?? false),
              ),
            AppImage(
              path: product.imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.displayName, style: AppTextStyles.cartItemTitle),
                  const SizedBox(height: 5),
                  Text(
                    product.description,
                    style: AppTextStyles.cartItemSubtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.checkoutValueLabel,
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF181725),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
