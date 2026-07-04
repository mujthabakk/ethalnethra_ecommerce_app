import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/models/orders/orders_models.dart';
import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/app_refresh_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/providers/orders_action_providers.dart';
import '../../../core/routes/app_router.dart';
import '../payment_webview_screen.dart';

class CheckoutBottomSheet extends ConsumerStatefulWidget {
  const CheckoutBottomSheet({
    super.key,
    required this.totalPrice,
    required this.isInstantCart,
  });

  final double totalPrice;

  /// Matches cart tab: instant vs pre-order.
  final bool isInstantCart;

  @override
  ConsumerState<CheckoutBottomSheet> createState() =>
      _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends ConsumerState<CheckoutBottomSheet> {
  int? _selectedAddressId;
  bool _redeemCoins = false;
  PaymentMethod _paymentMethod = PaymentMethod.cod;

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

  void _showError(Object? e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$e'),
        behavior: SnackBarBehavior.floating,
      ),
    );
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

    final notifier = ref.read(placeOrderNotifierProvider.notifier);

    if (_paymentMethod == PaymentMethod.online) {
      final payment = await notifier.createOnlinePayment(
        isInstantCart: widget.isInstantCart,
        addressId: id,
        useRewardCoins: _redeemCoins,
      );

      if (!mounted) return;

      if (payment == null) {
        ref.read(placeOrderNotifierProvider).whenOrNull(error: (e, _) => _showError(e));
        return;
      }

      final link = payment.paymentLink.trim();
      if (link.isEmpty) {
        _showError('Payment link not available. Please try again.');
        return;
      }

      final result = await Navigator.of(context).push<PlaceOrderResponse?>(
        MaterialPageRoute(
          builder: (_) => PaymentWebViewScreen(
            paymentLink: link,
            payment: payment,
          ),
        ),
      );

      if (!mounted) return;

      if (result != null) {
        notifier.markOnlinePaymentComplete(result);
        refreshAfterCheckout(ref);
        Navigator.of(context).pop();
        context.push(AppRouter.orderSuccess, extra: result);
        ref.invalidate(placeOrderNotifierProvider);
      }
      return;
    }

    final res = await notifier.submitCod(
      isInstantCart: widget.isInstantCart,
      addressId: id,
      useRewardCoins: _redeemCoins,
    );

    if (!mounted) return;

    if (res != null) {
      refreshAfterCheckout(ref);
      Navigator.of(context).pop();
      context.push(AppRouter.orderSuccess, extra: res);
      ref.invalidate(placeOrderNotifierProvider);
    } else {
      ref.read(placeOrderNotifierProvider).whenOrNull(error: (e, _) => _showError(e));
    }
  }

  Widget _paymentOption({
    required PaymentMethod method,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final selected = _paymentMethod == method;
    return InkWell(
      onTap: () => setState(() => _paymentMethod = method),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : const Color(0xFFE2E2E2),
            width: selected ? 1.5 : 1,
          ),
          color: selected
              ? AppColors.primary.withValues(alpha: 0.06)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.checkoutValueLabel),
                  Text(
                    subtitle,
                    style: AppTextStyles.checkoutTerms.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? AppColors.primary : Colors.grey,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool emphasize = false}) {
    final style = emphasize
        ? AppTextStyles.checkoutValueLabel
        : AppTextStyles.checkoutTerms.copyWith(color: Colors.grey.shade700);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  Widget _buildRewardWalletSection(RewardWallet wallet) {
    final canRedeem = wallet.canRedeem;
    final isSelected = canRedeem && _redeemCoins;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reward coins', style: AppTextStyles.checkoutSectionLabel),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${wallet.availableCoins} coins available',
                      style: AppTextStyles.checkoutValueLabel,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                canRedeem
                    ? 'Redeem up to ₹${wallet.maximumDiscount.toStringAsFixed(0)}'
                    : 'Minimum ${wallet.minimumRequired} coins required to redeem',
                style: AppTextStyles.checkoutTerms.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              if (wallet.coinsToBeEarned > 0) ...[
                const SizedBox(height: 4),
                Text(
                  'You will earn ${wallet.coinsToBeEarned} coins on this order',
                  style: AppTextStyles.checkoutTerms.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Opacity(
                opacity: canRedeem ? 1 : 0.4,
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: canRedeem
                        ? () => setState(() => _redeemCoins = !_redeemCoins)
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isSelected
                          ? Colors.white
                          : AppColors.primary,
                      backgroundColor:
                          isSelected ? AppColors.primary : Colors.transparent,
                      side: BorderSide(
                        color: AppColors.primary.withValues(
                          alpha: canRedeem ? 1 : 0.4,
                        ),
                      ),
                      minimumSize: const Size(double.infinity, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      isSelected ? 'Reward coins applied' : 'Redeem reward coins',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : AppColors.primary.withValues(
                                alpha: canRedeem ? 1 : 0.5,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotals(CheckoutResponse? checkout) {
    final wallet = checkout?.rewardWallet;
    final redeeming = _redeemCoins && (wallet?.canRedeem ?? false);
    final subtotal = checkout?.subtotal ?? widget.totalPrice;
    final delivery = checkout?.deliveryCharge ?? 0;
    final discount = redeeming
        ? (wallet?.maximumDiscount ?? 0)
        : (checkout?.discount ?? 0);
    final total = redeeming
        ? (wallet?.payableAfterRedeeming ?? checkout?.total ?? widget.totalPrice)
        : (checkout?.total ?? widget.totalPrice);

    return Column(
      children: [
        if (checkout != null) ...[
          _priceRow('Subtotal', '₹${subtotal.toStringAsFixed(2)}'),
          _priceRow('Delivery charge', '₹${delivery.toStringAsFixed(2)}'),
          if (discount > 0)
            _priceRow('Discount', '-₹${discount.toStringAsFixed(2)}'),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: AppTextStyles.checkoutSectionLabel),
            Text(
              '₹${total.toStringAsFixed(2)}',
              style: AppTextStyles.checkoutValueLabel,
            ),
          ],
        ),
      ],
    );
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
          final preferred =
              list.where((a) => a.isDefault).firstOrNull ?? list.first;
          setState(() {
            _selectedAddressId = preferred.id;
            _redeemCoins = false;
          });
        });
      }
    });

    final addressId = _selectedAddressId;
    final checkoutAsync = addressId == null
        ? null
        : ref.watch(
            checkoutPreviewProvider(
              CheckoutPreviewParams(
                addressId: addressId,
                isInstantCart: widget.isInstantCart,
              ),
            ),
          );

    // Reset redeem when wallet cannot redeem (e.g. after address change).
    checkoutAsync?.whenData((checkout) {
      final wallet = checkout.rewardWallet;
      if (_redeemCoins && (wallet == null || !wallet.canRedeem)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _redeemCoins = false);
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
                    if (checkoutAsync?.valueOrNull?.eta.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        checkoutAsync!.valueOrNull!.eta,
                        style: AppTextStyles.checkoutTerms.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
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
                                    a.isDefault
                                        ? '${a.label} (Default)'
                                        : a.label,
                                    style: AppTextStyles.checkoutValueLabel,
                                  ),
                                  subtitle: Text(
                                    a.displayLines,
                                    style: AppTextStyles.checkoutTerms,
                                  ),
                                  onChanged: placeAsync.isLoading
                                      ? null
                                      : (v) => setState(() {
                                          _selectedAddressId = v;
                                          _redeemCoins = false;
                                        }),
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
                    _paymentOption(
                      method: PaymentMethod.cod,
                      title: 'Cash on delivery (COD)',
                      subtitle: 'Pay when your order arrives',
                      icon: Icons.payments_outlined,
                    ),
                    const SizedBox(height: 10),
                    _paymentOption(
                      method: PaymentMethod.online,
                      title: 'Online payment',
                      subtitle: 'Pay securely with Razorpay',
                      icon: Icons.credit_card_outlined,
                    ),
                    const Divider(
                      height: 32,
                      color: Color(0xFFE2E2E2),
                      thickness: 1,
                    ),
                    if (checkoutAsync != null)
                      checkoutAsync.when(
                        loading: () => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        ),
                        error: (e, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Could not load checkout details',
                              style: TextStyle(color: Colors.red.shade800),
                            ),
                            TextButton(
                              onPressed: addressId == null
                                  ? null
                                  : () => ref.invalidate(
                                        checkoutPreviewProvider(
                                          CheckoutPreviewParams(
                                            addressId: addressId,
                                            isInstantCart: widget.isInstantCart,
                                          ),
                                        ),
                                      ),
                              child: const Text('Retry'),
                            ),
                            const SizedBox(height: 8),
                            _buildTotals(null),
                          ],
                        ),
                        data: (checkout) {
                          final wallet = checkout.rewardWallet;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (wallet != null) ...[
                                _buildRewardWalletSection(wallet),
                                const Divider(
                                  height: 32,
                                  color: Color(0xFFE2E2E2),
                                  thickness: 1,
                                ),
                              ],
                              _buildTotals(checkout),
                            ],
                          );
                        },
                      )
                    else
                      _buildTotals(null),
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
                          : Text(
                              _paymentMethod == PaymentMethod.online
                                  ? 'Pay Now'
                                  : 'Place Order',
                              style: const TextStyle(
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
