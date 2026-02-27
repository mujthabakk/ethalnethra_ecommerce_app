import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF181725),
            size: 32,
          ),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          NotificationCard(
            message: 'Order confirmed on 09 Feb 2026 at 10:30 AM.',
            isNew: true,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message: 'Order confirmed on 09 Feb 2026 at 10:30 AM.',
            isNew: true,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message:
                'Your order was delivered on 09 Feb 2026 at 4:45 PM.\nThank you for shopping with us!',
            isNew: false,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message: 'Your order is being packed.\n09 Feb 2026, 09:40 AM',
            isNew: true,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message:
                'Delivery arriving soon. Please be available.\n09 Feb 2026, 01:10 PM',
            isNew: false,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message:
                'Delivery arriving soon. Please be available.\n09 Feb 2026, 01:10 PM',
            isNew: false,
          ),
          SizedBox(height: 15),
          NotificationCard(
            message:
                'Delivery arriving soon. Please be available.\n09 Feb 2026, 01:10 PM',
            isNew: false,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String message;
  final bool isNew;

  const NotificationCard({
    super.key,
    required this.message,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFCEF1DE) : const Color(0xFFE2E2E2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF181725),
                height: 1.4,
              ),
            ),
          ),
          if (isNew) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF53B175),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
