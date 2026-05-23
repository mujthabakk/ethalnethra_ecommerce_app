import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/app_refresh_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/providers/orders_action_providers.dart';
import '../../../core/routes/app_router.dart';

class CheckoutBottomSheet extends ConsumerStatefulWidget {
  const CheckoutBottomSheet({
    super.key,
    required this.totalPrice,
    required this.isInstantCart,
    required this.acceptedLineIds,
  });

  final double totalPrice;

  /// Matches cart tab: instant vs pre-order.
  final bool isInstantCart;

  /// Cart line ids with `is_accept: true` only — not sent for rejected lines.
  final List<String> acceptedLineIds;

  @override
  ConsumerState<CheckoutBottomSheet> createState() =>
      _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends ConsumerState<CheckoutBottomSheet> {
  int? _selectedAddressId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      refreshCheckoutSheetData(ref);
    });
  }

  String get _deliveryLabel =>
      widget.isInstantCart ? 'Instant delivery' : 'Pre-order delivery';

  Future<void> _openAddAddress() async {
    await context.push(AppRouter.deliveryAddress);
    if (!mounted) return;
    ref.invalidate(userAddressesProvider);
    await ref.read(userAddressesProvider.future);
    if (mounted) setState(() {});
  }

  Future<void> _placeOrder() async {
    final id = _selectedAddressId;
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Select a delivery address'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final res = await ref.read(placeOrderNotifierProvider.notifier).submit(
          isInstantCart: widget.isInstantCart,
          addressId: id,
          cartItemIds: widget.acceptedLineIds,
        );

    if (!mounted) return;

    if (res != null) {
      refreshAfterCheckout(ref);
      Navigator.of(context).pop();
      context.push(AppRouter.orderSuccess, extra: res);
      ref.invalidate(placeOrderNotifierProvider);
    } else {
      ref
          .read(placeOrderNotifierProvider)
          .whenOrNull(
            error: (e, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$e'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final addressesAsync = ref.watch(userAddressesProvider);
    final placeAsync = ref.watch(placeOrderNotifierProvider);

    addressesAsync.whenData((list) {
      if (list.isEmpty) return;
      final valid =
          _selectedAddressId != null &&
          list.any((e) => e.id == _selectedAddressId);
      if (!valid) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          final preferred = list.where((a) => a.isDefault).firstOrNull ?? list.first;
          setState(() => _selectedAddressId = preferred.id);
        });
      }
    });

    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.92,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Checkout', style: AppTextStyles.checkoutTitle),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, color: Color(0xFF181725)),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery', style: AppTextStyles.checkoutSectionLabel),
                    const SizedBox(height: 8),
                    Text(
                      _deliveryLabel,
                      style: AppTextStyles.checkoutValueLabel,
                    ),
                    const Divider(
                      height: 32,
                      color: Color(0xFFE2E2E2),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery address',
                          style: AppTextStyles.checkoutSectionLabel,
                        ),
                        TextButton(
                          onPressed: placeAsync.isLoading
                              ? null
                              : _openAddAddress,
                          child: const Text('Add new'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    addressesAsync.when(
                      loading: () => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (e, _) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Could not load addresses',
                            style: TextStyle(color: Colors.red.shade800),
                          ),
                          TextButton(
                            onPressed: () =>
                                ref.invalidate(userAddressesProvider),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                      data: (addresses) {
                        if (addresses.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'No saved addresses. Add one to continue.',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                const SizedBox(height: 12),
                                OutlinedButton(
                                  onPressed: _openAddAddress,
                                  child: const Text('Add address'),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: addresses
                              .map(
                                (a) => RadioListTile<int>(
                                  contentPadding: EdgeInsets.zero,
                                  value: a.id,
                                  groupValue: _selectedAddressId,
                                  activeColor: AppColors.primary,
                                  title: Text(
                                    a.isDefault ? '${a.label} (Default)' : a.label,
                                    style: AppTextStyles.checkoutValueLabel,
                                  ),
                                  subtitle: Text(
                                    a.displayLines,
                                    style: AppTextStyles.checkoutTerms,
                                  ),
                                  onChanged: placeAsync.isLoading
                                      ? null
                                      : (v) => setState(
                                          () => _selectedAddressId = v,
                                        ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                    const Divider(
                      height: 32,
                      color: Color(0xFFE2E2E2),
                      thickness: 1,
                    ),
                    Text('Payment', style: AppTextStyles.checkoutSectionLabel),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cash on delivery (COD)',
                                style: AppTextStyles.checkoutValueLabel,
                              ),
                              Text(
                                'Other payment methods — coming soon',
                                style: AppTextStyles.checkoutTerms.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 32,
                      color: Color(0xFFE2E2E2),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: AppTextStyles.checkoutSectionLabel,
                        ),
                        Text(
                          '₹${widget.totalPrice.toStringAsFixed(2)}',
                          style: AppTextStyles.checkoutValueLabel,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.checkoutTerms,
                        children: [
                          const TextSpan(
                            text: 'By placing an order you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms',
                            style: AppTextStyles.checkoutTerms.copyWith(
                              color: const Color(0xFF181725),
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Conditions',
                            style: AppTextStyles.checkoutTerms.copyWith(
                              color: const Color(0xFF181725),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: placeAsync.isLoading ? null : _placeOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size(double.infinity, 67),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: placeAsync.isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Place Order',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
