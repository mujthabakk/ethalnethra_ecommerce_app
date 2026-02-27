import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';
import '../home/widgets/search_bar_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // Profile Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E2E2),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Afsar Hossen',
                                    style: AppTextStyles.accountName,
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () =>
                                        context.push(AppRouter.editProfile),
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFF53B175),
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Imshuvo97@gmail.com',
                                style: AppTextStyles.accountEmail,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(color: Color(0xFFE2E2E2), thickness: 1),

                    // Menu Items
                    _buildMenuItem(
                      context,
                      'Orders',
                      'asstes/icons/ic_orders.png',
                      onTap: () => context.push(AppRouter.orderStatus),
                    ),
                    _buildMenuItem(
                      context,
                      'My Details',
                      'asstes/icons/ic_my_details.png',
                      onTap: () => context.push(AppRouter.editProfile),
                    ),
                    _buildMenuItem(
                      context,
                      'Delivery Address',
                      'asstes/icons/ic_delicery_address.png',
                      onTap: () => context.push(AppRouter.deliveryAddress),
                    ),
                    _buildMenuItem(
                      context,
                      'Promo Cord',
                      'asstes/icons/ic_promo_cord.png',
                      onTap: () => context.push(AppRouter.promoCode),
                    ),
                    _buildMenuItem(
                      context,
                      'Notifications',
                      'asstes/icons/ic_bell.png',
                      onTap: () => context.push(AppRouter.notifications),
                    ),
                    _buildMenuItem(context, 'Help', 'asstes/icons/ic_help.png'),
                  ],
                ),
              ),
            ),

            // Logout Button at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 25.0,
              ),
              child: InkWell(
                onTap: () => context.go(AppRouter.welcome),
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  width: double.infinity,
                  height: 67,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Positioned(
                        left: 20,
                        child: Icon(
                          Icons.logout,
                          color: Color(0xFF53B175),
                          size: 24,
                        ),
                      ),
                      Text('Log Out', style: AppTextStyles.logoutButton),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    String iconPath, {
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Row(
              children: [
                Image.asset(iconPath, width: 22, height: 22),
                const SizedBox(width: 20),
                Text(title, style: AppTextStyles.accountMenuLabel),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Color(0xFF181725),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(color: Color(0xFFE2E2E2), thickness: 1, height: 1),
        ),
      ],
    );
  }
}
