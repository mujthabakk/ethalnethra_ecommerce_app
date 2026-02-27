import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/cart_provider.dart';
import '../home/widgets/search_bar_widget.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isInstantCart = true;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final cartItems = _isInstantCart
        ? cart.getInstantItemsList()
        : cart.getPreOrderItemsList();
    final total = _isInstantCart
        ? cart.instantTotalAmount
        : cart.preOrderTotalAmount;

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
      body: Column(
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
                    label: 'Instant cart',
                    isSelected: _isInstantCart,
                    activeColor: AppColors.preOrderOrange,
                    onTap: () => setState(() => _isInstantCart = true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _CartTab(
                    label: 'Pre-order cart',
                    isSelected: !_isInstantCart,
                    activeColor: AppColors.primary,
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
                ListView.builder(
                  itemCount: cartItems.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemWidget(
                      product: item.product,
                      quantity: item.quantity,
                      onIncrement: () {
                        if (_isInstantCart) {
                          cart.addItemToInstant(item.product);
                        } else {
                          cart.addItemToPreOrder(item.product);
                        }
                      },
                      onDecrement: () {
                        cart.removeSingleItem(item.product.id);
                      },
                      onRemove: () {
                        if (_isInstantCart) {
                          cart.removeInstantItem(item.product.id);
                        } else {
                          cart.removePreOrderItem(item.product.id);
                        }
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 25,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: cartItems.isEmpty
                        ? null
                        : () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return CheckoutBottomSheet(totalPrice: total);
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
                ),
              ],
            ),
          ),
        ],
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
