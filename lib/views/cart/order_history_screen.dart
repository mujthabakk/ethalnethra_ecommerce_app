import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_text_styles.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF181725),
            size: 30,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('Order Details', style: AppTextStyles.orderHistoryTitle),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Current Order Details Card
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE2E2E2)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildOrderDetailsItem(
                    name: 'Red Apple',
                    subtitle: '1kg, Price',
                    price: '₹15.99',
                    imagePath: 'asstes/images/apple.png',
                  ),
                  const Divider(height: 1, color: Color(0xFFE2E2E2)),
                  _buildOrderDetailsItem(
                    name: 'Egg Noodles',
                    subtitle: '2ps, Price',
                    price: '₹15.99',
                    imagePath: 'asstes/images/egg_noodles.png',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Text('Order History', style: AppTextStyles.orderHistoryTitle),
            const SizedBox(height: 20),

            // Order History Items
            _buildHistoryCard(
              name: 'Red Apple',
              subtitle: '1kg, Price',
              price: '₹15.99',
              imagePath: 'asstes/images/apple.png',
            ),
            const SizedBox(height: 15),
            _buildHistoryCard(
              name: 'Red Apple',
              subtitle: '1kg, Price',
              price: '₹15.99',
              imagePath: 'asstes/images/apple.png',
            ),
            const SizedBox(height: 15),
            _buildHistoryCard(
              name: 'Red Apple',
              subtitle: '1kg, Price',
              price: '₹15.99',
              imagePath: 'asstes/images/apple.png',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetailsItem({
    required String name,
    required String subtitle,
    required String price,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.contain),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.orderItemTitle),
                const SizedBox(height: 5),
                Text(subtitle, style: AppTextStyles.cartItemSubtitle),
              ],
            ),
          ),
          Text(price, style: AppTextStyles.checkoutValueLabel),
        ],
      ),
    );
  }

  Widget _buildHistoryCard({
    required String name,
    required String subtitle,
    required String price,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.orderItemTitle),
                    const SizedBox(height: 5),
                    Text(subtitle, style: AppTextStyles.cartItemSubtitle),
                  ],
                ),
              ),
              Text(price, style: AppTextStyles.checkoutValueLabel),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE2E2E2)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh, size: 16, color: Color(0xFFF3603F)),
                  const SizedBox(width: 5),
                  Text('Reorder', style: AppTextStyles.reorderButtonText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
