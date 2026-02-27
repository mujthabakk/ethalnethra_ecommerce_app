import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../models/product_model.dart';

class FavouriteItemWidget extends StatelessWidget {
  final ProductModel product;

  const FavouriteItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1)),
      ),
      child: Row(
        children: [
          // Product Image
          Image.asset(
            product.imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: AppTextStyles.cartItemTitle),
                const SizedBox(height: 5),
                Text(
                  product.description,
                  style: AppTextStyles.cartItemSubtitle,
                ),
              ],
            ),
          ),
          // Price and Chevron
          Row(
            children: [
              Text(
                '₹${product.price.toStringAsFixed(2)}',
                style: AppTextStyles.checkoutValueLabel,
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF181725),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
