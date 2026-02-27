import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF181725),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Image.asset(
              'asstes/images/ic_order_status.png',
              height: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text('Order Status', style: AppTextStyles.orderSuccessTitle),
            const SizedBox(height: 25),

            // Timeline Container
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFFE2F1E8).withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  _buildTimelineItem(
                    icon: Icons.description_outlined,
                    label: 'order placed',
                    time: '29 July 2024 ,11:00 PM',
                    isCompleted: true,
                    isLast: false,
                  ),
                  _buildTimelineItem(
                    icon: Icons.assignment_turned_in_outlined,
                    label: 'Accepted',
                    time: '29 July 2024 ,11:00 PM',
                    isCompleted: true,
                    isLast: false,
                  ),
                  _buildTimelineItem(
                    icon: Icons.access_time_filled,
                    label: 'In Progress',
                    time: '29 July 2024 ,11:00 PM',
                    isCompleted: true,
                    isCurrent: true,
                    isLast: false,
                  ),
                  _buildTimelineItem(
                    icon: Icons.local_shipping_outlined,
                    label: 'On the Way',
                    isCompleted: false,
                    isLast: false,
                  ),
                  _buildTimelineItem(
                    icon: Icons.inventory_2_outlined,
                    label: 'Delivered',
                    isCompleted: false,
                    isLast: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Order Summary Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: AppTextStyles.orderStatusSummaryTitle,
                  ),
                  const SizedBox(height: 15),
                  _buildSummaryRow('Order ID:', '153468790876'),
                  _buildSummaryRow('Shipping Address:', '45 onye’s house'),
                  _buildSummaryRow('Tracking ID:', '153468790876'),
                  _buildSummaryRow(
                    'Estimated Delivery Date:',
                    '11/03/25; 04:54pm',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () => context.push(AppRouter.orderHistory),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33.5),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Order details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String label,
    String? time,
    required bool isCompleted,
    bool isCurrent = false,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted
                    ? const Color(0xFF2E3192)
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: isCompleted
                    ? null
                    : Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  gradient: isCurrent
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            Colors.white.withOpacity(0.5),
                          ],
                        )
                      : null,
                  color: isCompleted && !isCurrent
                      ? AppColors.primary
                      : Colors.white.withOpacity(0.5),
                ),
              ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: isCompleted
                        ? const Color(0xFF181725)
                        : const Color(0xFF7C7C7C),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: AppTextStyles.orderStatusItemLabel.copyWith(
                      color: isCompleted
                          ? const Color(0xFF181725)
                          : const Color(0xFF7C7C7C),
                    ),
                  ),
                  if (time != null) ...[
                    const Spacer(),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color(0xFF7C7C7C).withOpacity(0.8),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.orderStatusSummaryLabel),
          const SizedBox(width: 5),
          Expanded(
            child: Text(value, style: AppTextStyles.orderStatusSummaryValue),
          ),
        ],
      ),
    );
  }
}
