import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_text_styles.dart';
import '../../core/models/user/user_details_models.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(userDetailsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          Expanded(
                            child: detailsAsync.when(
                              loading: () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 16,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                              error: (e, _) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Could not load profile',
                                    style: AppTextStyles.accountName.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        ref.invalidate(userDetailsProvider),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                              data: (d) {
                                final name = d.displayName.isNotEmpty
                                    ? d.displayName
                                    : '—';
                                final email = (d.email != null &&
                                        d.email!.trim().isNotEmpty)
                                    ? d.email!.trim()
                                    : '—';
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            name,
                                            style: AppTextStyles.accountName,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () => context
                                              .push(AppRouter.editProfile),
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
                                      email,
                                      style: AppTextStyles.accountEmail,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(color: Color(0xFFE2E2E2), thickness: 1),
                    _buildMenuItem(
                      context,
                      'Orders',
                      'asstes/icons/ic_orders.png',
                      onTap: () => context.push(AppRouter.ordersList),
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
                      'Help',
                      'asstes/icons/ic_help.png',
                    ),
                  ],
                ),
              ),
            ),
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
                Image.asset(
                  iconPath,
                  width: 22,
                  height: 22,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.circle_outlined,
                    size: 22,
                    color: Color(0xFF181725),
                  ),
                ),
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
