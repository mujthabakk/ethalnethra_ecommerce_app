import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/commerce_constants.dart';
import '../../core/utils/custom_order_quantity.dart';
import '../../core/models/commerce/cart_dtos.dart';
import '../../core/providers/app_refresh_providers.dart';
import '../../core/providers/cart_providers.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/checkout_bottom_sheet.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _isInstantCart = true;

  double _tabTotal(List<CartLineDto> lines) {
    return lines
        .where((l) => l.isAccept)
        .fold<double>(0, (a, b) => a + b.subtotal);
  }

  List<CartLineDto> _acceptedLines(List<CartLineDto> lines) =>
      lines.where((l) => l.isAccept).toList();

  bool _canCheckout(List<CartLineDto> lines, double total) {
    return _acceptedLines(lines).isNotEmpty && total >= minOrderAmount;
  }

  Future<void> _runCartAction(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E2E2), height: 1),
        ),
      ),
      body: cartAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load cart',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text('$e', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(cartNotifierProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (cart) {
          final cartItems =
              _isInstantCart ? cart.instant : cart.preorder;
          final total = _tabTotal(cartItems);
          final acceptedLines = _acceptedLines(cartItems);
          final canCheckout = _canCheckout(cartItems, total);
          final belowMinimum =
              acceptedLines.isNotEmpty && total < minOrderAmount;
          final notifier = ref.read(cartNotifierProvider.notifier);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _CartTab(
                        label: 'Instant cart (${cart.instant.length})',
                        isSelected: _isInstantCart,
                        activeColor: AppColors.primary,
                        onTap: () => setState(() => _isInstantCart = true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _CartTab(
                        label: 'Pre-order (${cart.preorder.length})',
                        isSelected: !_isInstantCart,
                        activeColor: AppColors.preOrderOrange,
                        onTap: () => setState(() => _isInstantCart = false),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    if (cartItems.isEmpty)
                      Center(
                        child: Text(
                          _isInstantCart
                              ? 'No items in instant cart'
                              : 'No items in pre-order cart',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      )
                    else
                    ListView.builder(
                      itemCount: cartItems.length,
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 100,
                      ),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        final weighted =
                            item.isCustomOrder || item.isGramWise;
                        return CartItemWidget(
                          line: item,
                          onIncrement: () => _runCartAction(() {
                            final newQty = weighted
                                ? CustomOrderQuantity.increment(
                                    item.quantity,
                                    isGramWise: item.isGramWise,
                                  )
                                : item.quantity.round() + 1;
                            return notifier.setLineQuantity(item.id, newQty);
                          }),
                          onDecrement: () => _runCartAction(() {
                            if (weighted) {
                              final next = CustomOrderQuantity.decrement(
                                item.quantity,
                                isGramWise: item.isGramWise,
                              );
                              return next == null
                                  ? notifier.removeLine(item.id)
                                  : notifier.setLineQuantity(item.id, next);
                            }
                            final qty = item.quantity.round();
                            return qty <= 1
                                ? notifier.removeLine(item.id)
                                : notifier.setLineQuantity(item.id, qty - 1);
                          }),
                          onRemove: () =>
                              _runCartAction(() => notifier.removeLine(item.id)),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 25,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (belowMinimum)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Minimum order amount is ₹${minOrderAmount.toStringAsFixed(0)}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange.shade800,
                                ),
                              ),
                            ),
                          ElevatedButton(
                        onPressed: !canCheckout
                            ? null
                            : () async {
                                await refreshCheckoutSheetData(ref);
                                if (!context.mounted) return;
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return CheckoutBottomSheet(
                                      totalPrice: total,
                                      isInstantCart: _isInstantCart,
                                    );
                                  },
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          disabledBackgroundColor: const Color(0xFFE2E2E2),
                          minimumSize: const Size(double.infinity, 67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 50),
                            Expanded(
                              child: Text(
                                'Go to Checkout',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.cartButton,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF489E67),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '₹${total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  const _CartTab({
    required this.label,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.white,
          border: Border.all(
            color: isSelected ? activeColor : const Color(0xFFB3B3B3),
            width: isSelected ? 0 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF181725),
          ),
        ),
      ),
    );
  }
}
