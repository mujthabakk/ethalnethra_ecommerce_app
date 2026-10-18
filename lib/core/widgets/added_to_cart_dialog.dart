import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../providers/main_nav_tab_provider.dart';
import '../routes/app_router.dart';

/// Popup shown after a product is successfully added to the cart.
class AddedToCartDialog extends ConsumerWidget {
  const AddedToCartDialog({
    super.key,
    required this.productName,
    this.preorder = false,
  });

  final String productName;
  final bool preorder;

  static Future<void> show(
    BuildContext context, {
    required String productName,
    bool preorder = false,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AddedToCartDialog(
        productName: productName,
        preorder: preorder,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = preorder ? 'pre-order basket' : 'cart';

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF181725),
                  size: 24,
                ),
              ),
            ),
            Image.asset(
              'asstes/images/pyment_success.png',
              width: 160,
              height: 160,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 88,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Added to $basket',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessTitle.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Text(
              productName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.orderSuccessDescription.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF181725),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your item has been added successfully.',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessDescription,
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(mainNavTabIndexProvider.notifier).state =
                    kMainNavCartTabIndex;
                context.go(AppRouter.mainNav);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
                elevation: 0,
              ),
              child: const Text(
                'View Cart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: Text(
                'Continue Shopping',
                style: AppTextStyles.orderSuccessBackHome,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
