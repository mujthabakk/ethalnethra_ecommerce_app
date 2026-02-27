import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class FavouritesProvider with ChangeNotifier {
  final Map<String, ProductModel> _favouriteItems = {};

  Map<String, ProductModel> get items => {..._favouriteItems};

  bool isFavourite(String productId) {
    return _favouriteItems.containsKey(productId);
  }

  void toggleFavourite(ProductModel product) {
    if (_favouriteItems.containsKey(product.id)) {
      _favouriteItems.remove(product.id);
    } else {
      _favouriteItems[product.id] = product;
    }
    notifyListeners();
  }

  void clearFavourites() {
    _favouriteItems.clear();
    notifyListeners();
  }
}
