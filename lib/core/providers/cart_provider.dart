import 'package:flutter/material.dart';
import '../../models/product_model.dart';

enum CartType { instant, preOrder }

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _instantItems = {};
  final Map<String, CartItem> _preOrderItems = {};

  Map<String, CartItem> get items => {..._instantItems};
  Map<String, CartItem> get instantItems => {..._instantItems};
  Map<String, CartItem> get preOrderItems => {..._preOrderItems};

  int get itemCount => _instantItems.length + _preOrderItems.length;
  int get instantItemCount => _instantItems.length;
  int get preOrderItemCount => _preOrderItems.length;

  double get totalAmount {
    var total = 0.0;
    _instantItems.forEach((_, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    _preOrderItems.forEach((_, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  double get instantTotalAmount {
    var total = 0.0;
    _instantItems.forEach((_, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  double get preOrderTotalAmount {
    var total = 0.0;
    _preOrderItems.forEach((_, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  List<CartItem> getInstantItemsList() => _instantItems.values.toList();
  List<CartItem> getPreOrderItemsList() => _preOrderItems.values.toList();

  void addItem(ProductModel product, {int quantity = 1}) {
    addItemToInstant(product, quantity: quantity);
  }

  void addItemToInstant(ProductModel product, {int quantity = 1}) {
    final map = _instantItems;
    if (map.containsKey(product.id)) {
      map.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + quantity,
        ),
      );
    } else {
      map[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void addItemToPreOrder(ProductModel product, {int quantity = 1}) {
    final map = _preOrderItems;
    if (map.containsKey(product.id)) {
      map.update(
        product.id,
        (existingItem) => CartItem(
          product: existingItem.product,
          quantity: existingItem.quantity + quantity,
        ),
      );
    } else {
      map[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_instantItems.containsKey(productId)) {
      if (_instantItems[productId]!.quantity > 1) {
        _instantItems.update(
          productId,
          (existingItem) => CartItem(
            product: existingItem.product,
            quantity: existingItem.quantity - 1,
          ),
        );
      } else {
        _instantItems.remove(productId);
      }
      notifyListeners();
      return;
    }
    if (_preOrderItems.containsKey(productId)) {
      if (_preOrderItems[productId]!.quantity > 1) {
        _preOrderItems.update(
          productId,
          (existingItem) => CartItem(
            product: existingItem.product,
            quantity: existingItem.quantity - 1,
          ),
        );
      } else {
        _preOrderItems.remove(productId);
      }
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _instantItems.remove(productId);
    _preOrderItems.remove(productId);
    notifyListeners();
  }

  void removeInstantItem(String productId) {
    _instantItems.remove(productId);
    notifyListeners();
  }

  void removePreOrderItem(String productId) {
    _preOrderItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _instantItems.clear();
    _preOrderItems.clear();
    notifyListeners();
  }
}
