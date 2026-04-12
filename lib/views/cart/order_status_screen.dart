import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/orders/orders_models.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';

class OrderStatusScreen extends ConsumerStatefulWidget {
  const OrderStatusScreen({super.key, required this.orderId});

  final String orderId;

  @override
  ConsumerState<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends ConsumerState<OrderStatusScreen> {
  bool _cancelling = false;

  String _normalizeStatus(String raw) {
    return raw.toLowerCase().replaceAll(RegExp(r'[\s-]'), '_');
  }

  String _displayStatus(String raw) {
    if (raw.isEmpty) return raw;
    return raw
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }

  /// 0 = order placed … 4 = delivered (current step index).
  int _stepIndexFromStatus(String raw) {
    final s = _normalizeStatus(raw);
    if (s.contains('deliver')) return 4;
    if (s.contains('way') || s == 'on_way') return 3;
    if (s.contains('progress')) return 2;
    if (s.contains('accept')) return 1;
    return 0;
  }

  bool _canCancel(String raw) {
    final s = _normalizeStatus(raw);
    if (s.contains('deliver')) return false;
    if (s.contains('cancel')) return false;
    return true;
  }

  Future<void> _onCancel(BuildContext context) async {
    if (_cancelling) return;
    setState(() => _cancelling = true);
    try {
      final msg = await ref
          .read(ordersRepositoryProvider)
          .cancelOrder(widget.orderId);
      ref.invalidate(orderTrackProvider(widget.orderId));
      ref.invalidate(ordersListProvider);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg.message)),
      );
      context.pop();
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _cancelling = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orderId.isEmpty) {
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
        ),
        body: const Center(child: Text('Invalid order')),
      );
    }

    final trackAsync = ref.watch(orderTrackProvider(widget.orderId));

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
      body: trackAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load tracking',
                  style: AppTextStyles.accountName.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () =>
                      ref.invalidate(orderTrackProvider(widget.orderId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (OrderTrackResponse track) {
          final stepIndex = _stepIndexFromStatus(track.status);
          final delivered = stepIndex >= 4;
          const steps = <({IconData icon, String label})>[
            (
              icon: Icons.description_outlined,
              label: 'order placed',
            ),
            (
              icon: Icons.assignment_turned_in_outlined,
              label: 'Accepted',
            ),
            (
              icon: Icons.access_time_filled,
              label: 'In Progress',
            ),
            (
              icon: Icons.local_shipping_outlined,
              label: 'On the Way',
            ),
            (
              icon: Icons.inventory_2_outlined,
              label: 'Delivered',
            ),
          ];

          return SingleChildScrollView(
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
                const SizedBox(height: 12),
                Text(
                  _displayStatus(track.status),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                if (track.eta.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'ETA: ${track.eta}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.orderSuccessDescription,
                  ),
                ],
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2F1E8).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      for (var i = 0; i < steps.length; i++)
                        _buildTimelineItem(
                          icon: steps[i].icon,
                          label: steps[i].label,
                          time: null,
                          isCompleted: delivered || i < stepIndex,
                          isCurrent: !delivered && i == stepIndex,
                          isLast: i == steps.length - 1,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
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
                      _buildSummaryRow('Order number:', track.orderNumber),
                      _buildSummaryRow('Status:', _displayStatus(track.status)),
                      if (track.eta.isNotEmpty)
                        _buildSummaryRow('ETA:', track.eta),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (_canCancel(track.status))
                  OutlinedButton(
                    onPressed: _cancelling ? null : () => _onCancel(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFB00020),
                      side: const BorderSide(color: Color(0xFFB00020)),
                      minimumSize: const Size(double.infinity, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: _cancelling
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text(
                            'Cancel order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                if (_canCancel(track.status)) const SizedBox(height: 16),
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
          );
        },
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
