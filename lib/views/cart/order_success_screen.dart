import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/orders/orders_models.dart';
import '../../core/routes/app_router.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key, this.result});

  final PlaceOrderResponse? result;

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
            if (result != null) ...[
              const SizedBox(height: 12),
              Text(
                result!.orderNumber,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              if (result!.eta.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'ETA: ${result!.eta}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.orderSuccessDescription,
                  ),
                ),
            ],
            const SizedBox(height: 20),
            Text(
              'Your items has been placcd and is on\nit’s way to being processed',
              textAlign: TextAlign.center,
              style: AppTextStyles.orderSuccessDescription,
            ),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {
                final r = result;
                if (r != null) {
                  context.push(AppRouter.orderStatusPath(r.orderId));
                } else {
                  context.push(AppRouter.ordersList);
                }
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
