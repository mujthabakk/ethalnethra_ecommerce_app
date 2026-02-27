import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'asstes/images/pyment_success.png',
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),
            Text(
              'Your Order has been\naccepted',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessTitle,
            ),
            const SizedBox(height: 20),
            Text(
              'Your items has been placcd and is on\nit’s way to being processed',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessDescription,
            ),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: () => context.push(AppRouter.orderStatus),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Track Order',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(AppRouter.mainNav),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: Text(
                'Back to home',
                style: AppTextStyles.orderSuccessBackHome,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
