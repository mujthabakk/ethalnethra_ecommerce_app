import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/orders/orders_models.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';

class OrdersListScreen extends ConsumerWidget {
  const OrdersListScreen({super.key});

  String _titleCaseStatus(String raw) {
    if (raw.isEmpty) return raw;
    return raw
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(ordersListProvider);

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
        title: Text('My Orders', style: AppTextStyles.orderHistoryTitle),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load orders',
                  style: AppTextStyles.accountName.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => ref.invalidate(ordersListProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (OrdersListResponse data) {
          if (data.orders.isEmpty) {
            return Center(
              child: Text(
                'No orders yet',
                style: AppTextStyles.orderSuccessDescription,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(ordersListProvider);
              await ref.read(ordersListProvider.future);
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              itemCount: data.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final o = data.orders[index];
                return Material(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => context.push(AppRouter.orderStatusPath(o.id)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  o.orderNumber,
                                  style: AppTextStyles.accountName.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              if (o.orderTypeLabel.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (o.isInstantOrder
                                            ? AppColors.primary
                                            : AppColors.preOrderOrange)
                                        .withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    o.orderTypeLabel,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: o.isInstantOrder
                                          ? AppColors.primary
                                          : AppColors.preOrderOrange,
                                    ),
                                  ),
                                ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _titleCaseStatus(o.status),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (o.date.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              o.date,
                              style: AppTextStyles.orderSuccessDescription,
                            ),
                          ],
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                '₹${o.total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF181725),
                                ),
                              ),
                              if (o.discount > 0) ...[
                                const SizedBox(width: 8),
                                Text(
                                  'Disc. ₹${o.discount.toStringAsFixed(2)}',
                                  style: AppTextStyles.orderSuccessDescription,
                                ),
                              ],
                              const Spacer(),
                              if (o.subtotal > 0 && o.subtotal != o.total)
                                Text(
                                  'Subtotal ₹${o.subtotal.toStringAsFixed(2)}',
                                  style: AppTextStyles.orderSuccessDescription,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
