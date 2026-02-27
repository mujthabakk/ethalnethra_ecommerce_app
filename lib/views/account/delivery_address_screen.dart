import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

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
        title: Text('My Addresses', style: AppTextStyles.orderHistoryTitle),
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

            // Add New Address Bar
            GestureDetector(
              onTap: () => context.push(AppRouter.selectLocation),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E2E2)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Color(0xFFF3603F), size: 24),
                    const SizedBox(width: 10),
                    Text(
                      'Add New Address',
                      style: AppTextStyles.addNewAddressButtonText,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFF3603F),
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            Text('SAVED ADDRESSES', style: AppTextStyles.addressSectionHeader),
            const SizedBox(height: 20),

            // Saved Address Cards
            _buildAddressCard(
              label: 'HOME',
              icon: Icons.home,
              address: '45 Palm Grove\nKochi, Kerala 682001\nIndia',
            ),
            const SizedBox(height: 15),
            _buildAddressCard(
              label: 'WORK',
              icon: Icons.work,
              address: '45 Palm Grove\nKochi, Kerala 682001\nIndia',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard({
    required String label,
    required IconData icon,
    required String address,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.darkBackground, size: 28),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: AppTextStyles.orderItemTitle),
                    const SizedBox(height: 5),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF181725),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label == 'HOME')
                  const Icon(
                    Icons.more_horiz,
                    color: Color(0xFFE2E2E2),
                    size: 20,
                  ),
                const SizedBox(width: 10),
                const Icon(Icons.delete, color: Color(0xFFF3603F), size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
