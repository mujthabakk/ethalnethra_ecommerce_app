import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/models/commerce/cart_dtos.dart';
import '../../../core/models/commerce/cart_line_extensions.dart';
import '../../../core/widgets/app_network_image.dart';

class CartItemWidget extends StatelessWidget {
  final CartLineDto line;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.line,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final accepted = line.isAccept;
    final content = Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppImage(
              path: line.imageUrl.isNotEmpty
                  ? line.imageUrl
                  : 'asstes/images/grocery.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        line.displayName,
                        style: AppTextStyles.cartItemTitle,
                      ),
                    ),
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
                  line.unitPriceLabel,
                  style: AppTextStyles.cartItemSubtitle,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildQuantityButton(
                      Icons.remove,
                      accepted ? onDecrement : () {},
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 56,
                      child: Center(
                        child: Text(
                          line.quantityLabel,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF181725),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _buildQuantityButton(
                      Icons.add,
                      accepted ? onIncrement : () {},
                      isPrimary: true,
                    ),
                    const Spacer(),
                    Text(
                      '₹${line.subtotal.toStringAsFixed(2)}',
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

    if (accepted) return content;
    return Opacity(opacity: 0.45, child: content);
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
