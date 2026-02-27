import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_text_styles.dart';

class PromoCodeScreen extends StatelessWidget {
  const PromoCodeScreen({super.key});

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
        title: const Text(
          'Promo Code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          _buildPromoCard(
            'Welcome Offer',
            'GET20OFF',
            '20% off on your first order',
            'Expires: 31 Dec 2024',
            const Color(0xFF53B175),
          ),
          const SizedBox(height: 20),
          _buildPromoCard(
            'Summer Sale',
            'SUMMER15',
            '15% off on all fruits and vegetables',
            'Expires: 31 Aug 2024',
            const Color(0xFFF3603F),
          ),
          const SizedBox(height: 20),
          _buildPromoCard(
            'Weekend Special',
            'WEEKEND10',
            '10% off on your weekend grocery',
            'Expires: 30 June 2024',
            const Color(0xFF2E3192),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(
    String title,
    String code,
    String description,
    String expiry,
    Color themeColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: themeColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.orderItemTitle.copyWith(color: themeColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF181725),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            expiry,
            style: const TextStyle(fontSize: 12, color: Color(0xFF7C7C7C)),
          ),
        ],
      ),
    );
  }
}
