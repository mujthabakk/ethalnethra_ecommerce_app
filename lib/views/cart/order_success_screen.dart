import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/orders/orders_models.dart';
import '../../core/providers/app_refresh_providers.dart';
import '../../core/providers/main_nav_tab_provider.dart';
import '../../core/routes/app_router.dart';

class OrderSuccessScreen extends ConsumerStatefulWidget {
  const OrderSuccessScreen({super.key, this.result});

  final PlaceOrderResponse? result;

  @override
  ConsumerState<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends ConsumerState<OrderSuccessScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      refreshAfterCheckout(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;

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
              if (result.orderNumber.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  result.orderNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
              if (result.total > 0)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '₹${result.total.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              if (result.eta.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'ETA: ${result.eta}',
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
                refreshAfterCheckout(ref);
                if (result != null) {
                  context.push(AppRouter.orderStatusPath(result.orderId));
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
              onPressed: () {
                refreshAfterCheckout(ref);
                resetMainNavToHome(ref);
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
