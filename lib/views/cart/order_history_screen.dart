import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/orders/orders_models.dart';
import '../../core/providers/cart_providers.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/utils/auth_guard.dart';
import '../../core/widgets/app_network_image.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key, required this.orderId});

  final String orderId;

  String _titleCaseStatus(String raw) {
    if (raw.isEmpty) return raw;
    return raw
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }

  Future<void> _reorderItem(
    BuildContext context,
    WidgetRef ref,
    OrderDetailItem item,
  ) async {
    if (item.productId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot reorder this item')),
      );
      return;
    }
    if (!await ensureLoggedIn(context, ref)) return;
    try {
      await ref.read(cartNotifierProvider.notifier).addToCart(
            item.productId,
            quantity: item.quantity.round().clamp(1, 999),
            preorder: item.isPreorder,
          );
      if (!context.mounted) return;
      await showAddedToCartPopup(
        context,
        productName: item.displayName,
        preorder: item.isPreorder,
      );
    } catch (e) {
      if (!context.mounted) return;
      await showCartOrAuthError(context, e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (orderId.isEmpty) {
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
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(child: Text('Invalid order')),
      );
    }

    final detailAsync = ref.watch(orderDetailProvider(orderId));
    final ordersAsync = ref.watch(ordersListProvider);

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
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load order details',
                  style: AppTextStyles.accountName.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () =>
                      ref.invalidate(orderDetailProvider(orderId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (OrderDetailResponse detail) {
          final historyProducts = detail.historyItems;
          final pastOrders = ordersAsync.maybeWhen(
            data: (list) => list.orders
                .where((o) => o.id != orderId)
                .toList(growable: false),
            orElse: () => const <OrderListItem>[],
          );

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(orderDetailProvider(orderId));
              ref.invalidate(ordersListProvider);
              await Future.wait([
                ref.read(orderDetailProvider(orderId).future),
                ref.read(ordersListProvider.future),
              ]);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  if (detail.orderNumber.isNotEmpty) ...[
                    Text(
                      detail.orderNumber,
                      style: AppTextStyles.accountName.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                  ],
                  if (detail.status.isNotEmpty) ...[
                    Text(
                      _titleCaseStatus(detail.status),
                      style: AppTextStyles.orderSuccessDescription,
                    ),
                    const SizedBox(height: 6),
                  ],
                  if (detail.date.isNotEmpty)
                    Text(
                      detail.date,
                      style: AppTextStyles.orderSuccessDescription,
                    ),
                  const SizedBox(height: 16),
                  if (detail.items.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'No items in this order',
                        style: AppTextStyles.orderSuccessDescription,
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          for (var i = 0; i < detail.items.length; i++) ...[
                            if (i > 0)
                              const Divider(
                                height: 1,
                                color: Color(0xFFE2E2E2),
                              ),
                            _OrderLineTile(item: detail.items[i]),
                          ],
                        ],
                      ),
                    ),
                  if (detail.total > 0) ...[
                    const SizedBox(height: 16),
                    _TotalsSection(detail: detail),
                  ],
                  const SizedBox(height: 30),
                  Text('Order History', style: AppTextStyles.orderHistoryTitle),
                  const SizedBox(height: 20),
                  if (historyProducts.isNotEmpty)
                    ...historyProducts.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _HistoryProductCard(
                          item: item,
                          onReorder: () => _reorderItem(context, ref, item),
                        ),
                      ),
                    )
                  else if (pastOrders.isEmpty)
                    Text(
                      'No previous orders',
                      style: AppTextStyles.orderSuccessDescription,
                    )
                  else
                    ...pastOrders.map(
                      (o) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _PastOrderCard(
                          order: o,
                          statusLabel: _titleCaseStatus(o.status),
                          onTap: () =>
                              context.push(AppRouter.orderHistoryPath(o.id)),
                        ),
                      ),
                    ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TotalsSection extends StatelessWidget {
  const _TotalsSection({required this.detail});

  final OrderDetailResponse detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          if (detail.subtotal > 0)
            _totalRow('Subtotal', detail.subtotal),
          if (detail.discount > 0)
            _totalRow('Discount', -detail.discount),
          if (detail.deliveryCharge > 0)
            _totalRow('Delivery', detail.deliveryCharge),
          _totalRow('Total', detail.total, bold: true),
        ],
      ),
    );
  }

  Widget _totalRow(String label, double amount, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            label,
            style: bold
                ? const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF181725),
                  )
                : AppTextStyles.orderSuccessDescription,
          ),
          const Spacer(),
          Text(
            '₹${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: bold ? 16 : 14,
              fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
              color: const Color(0xFF181725),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderLineTile extends StatelessWidget {
  const _OrderLineTile({required this.item});

  final OrderDetailItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AppImage(
              path: item.imageUrl.isNotEmpty
                  ? item.imageUrl
                  : 'asstes/images/grocery.png',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.displayName, style: AppTextStyles.orderItemTitle),
                const SizedBox(height: 5),
                Text(
                  item.quantitySubtitle,
                  style: AppTextStyles.cartItemSubtitle,
                ),
              ],
            ),
          ),
          Text(item.lineTotalLabel, style: AppTextStyles.checkoutValueLabel),
        ],
      ),
    );
  }
}

class _HistoryProductCard extends StatelessWidget {
  const _HistoryProductCard({
    required this.item,
    required this.onReorder,
  });

  final OrderDetailItem item;
  final VoidCallback onReorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _OrderLineTile(item: item),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: onReorder,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E2E2)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.refresh,
                      size: 16,
                      color: Color(0xFFF3603F),
                    ),
                    const SizedBox(width: 5),
                    Text('Reorder', style: AppTextStyles.reorderButtonText),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PastOrderCard extends StatelessWidget {
  const _PastOrderCard({
    required this.order,
    required this.statusLabel,
    required this.onTap,
  });

  final OrderListItem order;
  final String statusLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE2E2E2)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderNumber,
                      style: AppTextStyles.orderItemTitle,
                    ),
                    if (order.date.isNotEmpty) ...[
                      const SizedBox(height: 5),
                      Text(
                        order.date,
                        style: AppTextStyles.cartItemSubtitle,
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '₹${order.total.toStringAsFixed(2)}',
                    style: AppTextStyles.checkoutValueLabel,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
