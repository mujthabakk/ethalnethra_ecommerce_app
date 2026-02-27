import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final double totalPrice;

  const CheckoutBottomSheet({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Checkout', style: AppTextStyles.checkoutTitle),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close, color: Color(0xFF181725)),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFFE2E2E2), thickness: 1),
          _buildCheckoutRow('Delivery', 'Select Method'),
          const Divider(color: Color(0xFFE2E2E2), thickness: 1),
          _buildCheckoutRow(
            'Payment',
            '',
          ), // In screenshot spelled "Pament" but using "Payment"
          const Divider(color: Color(0xFFE2E2E2), thickness: 1),
          _buildCheckoutRow('Promo Code', 'Pick discount'),
          const Divider(color: Color(0xFFE2E2E2), thickness: 1),
          _buildCheckoutRow('Total Cost', '₹${totalPrice.toStringAsFixed(2)}'),
          const Divider(color: Color(0xFFE2E2E2), thickness: 1),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: AppTextStyles.checkoutTerms,
              children: [
                const TextSpan(text: 'By placing an order you agree to our '),
                TextSpan(
                  text: 'Terms',
                  style: AppTextStyles.checkoutTerms.copyWith(
                    color: const Color(0xFF181725),
                  ),
                ),
                const TextSpan(text: ' And '),
                TextSpan(
                  text: 'Conditions',
                  style: AppTextStyles.checkoutTerms.copyWith(
                    color: const Color(0xFF181725),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.pop(); // Close bottom sheet
              context.push(AppRouter.orderSuccess);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 67),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Place Order',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCheckoutRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.checkoutSectionLabel),
          const Spacer(),
          Text(value, style: AppTextStyles.checkoutValueLabel),
          const SizedBox(width: 15),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF181725),
          ),
        ],
      ),
    );
  }
}
