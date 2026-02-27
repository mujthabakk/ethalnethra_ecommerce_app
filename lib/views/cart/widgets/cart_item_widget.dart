import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../models/product_model.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1)),
      ),
      child: Row(
        children: [
          // Product Image
          Image.asset(
            product.imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 25),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name, style: AppTextStyles.cartItemTitle),
                    GestureDetector(
                      onTap: onRemove,
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFFB3B3B3),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  product.description,
                  style: AppTextStyles.cartItemSubtitle,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildQuantityButton(Icons.remove, onDecrement),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 30,
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF181725),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    _buildQuantityButton(
                      Icons.add,
                      onIncrement,
                      isPrimary: true,
                    ),
                    const Spacer(),
                    Text(
                      '₹${(product.price * quantity).toStringAsFixed(2)}',
                      style: AppTextStyles.cartItemPrice,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
    IconData icon,
    VoidCallback onTap, {
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: isPrimary ? AppColors.primary : const Color(0xFFB3B3B3),
          size: 20,
        ),
      ),
    );
  }
}
