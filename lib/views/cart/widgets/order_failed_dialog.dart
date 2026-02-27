import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_router.dart';

class OrderFailedDialog extends StatelessWidget {
  const OrderFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF181725),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'asstes/images/payment_faild.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Text(
              'Oops! Order Failed',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessTitle,
            ),
            const SizedBox(height: 15),
            Text(
              'Something went tembly wrong.',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessDescription,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.pop();
                // Logic to try again
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
                'Please Try Again',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                context.pop();
                context.go(AppRouter.mainNav);
              },
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: Text(
                'Back to home',
                style: AppTextStyles.orderSuccessBackHome,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
