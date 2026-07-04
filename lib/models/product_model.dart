import '../core/utils/product_display_name.dart';

/// UI product used across home, explore, favourites, and detail screens.
class ProductModel {
  final String id;
  /// English name from API (`name`).
  final String name;
  /// Malayalam name from API (`name_ml`).
  final String nameMl;
  final String description;
  final String longDescription;
  final String imagePath;
  final double price;
  final String unit;
  final bool preorderAvailable;
  final bool instantOrderAvailable;
  final bool isCustomOrder;
  final bool isGramWise;

  /// Back-compat alias for [preorderAvailable].
  bool get isPreOrder => preorderAvailable;

  final double listPrice;
  final double ourPrice;
  final double finalPrice;
  final double displayPrice;
  final double? preorderPrice;
  final bool hasDiscount;
  final double discountPercentage;
  final int stock;
  final String category;
  final String type;

  ProductModel({
    required this.id,
    required this.name,
    this.nameMl = '',
    required this.description,
    this.longDescription =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
    required this.imagePath,
    required this.price,
    required this.unit,
    bool isPreOrder = false,
    bool? preorderAvailable,
    this.instantOrderAvailable = false,
    this.isCustomOrder = false,
    this.isGramWise = false,
    double? listPrice,
    double? ourPrice,
    double? finalPrice,
    double? displayPrice,
    this.preorderPrice,
    this.hasDiscount = false,
    this.discountPercentage = 0,
    this.stock = 0,
    this.category = '',
    this.type = '',
  })  : preorderAvailable = preorderAvailable ?? isPreOrder,
        listPrice = listPrice ?? price,
        ourPrice = ourPrice ?? price,
        finalPrice = finalPrice ?? price,
        displayPrice = displayPrice ?? price;

  /// Malayalam primary, English in parentheses — for all product UI labels.
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);

  bool get isInStock => stock > 0;

  /// Weight unit (e.g. `kg`), defaulting to `kg` when missing.
  String get unitLabel {
    final u = unit.trim();
    return u.isEmpty ? 'kg' : u;
  }

  /// Shown selling price per unit, e.g. `₹75 / kg`.
  String get pricePerUnitLabel =>
      '₹${displayPrice.toStringAsFixed(2)} / $unitLabel';

  /// Rounded discount badge text (e.g. `9% OFF`); empty when no discount.
  String get discountLabel =>
      showDiscount ? '${discountPercentage.round()}% OFF' : '';

  /// Stock availability label, e.g. `5 in stock` / `Out of stock`.
  String get stockLabel => isInStock ? '$stock in stock' : 'Out of stock';

  /// Whether to show the struck-through actual price (`price`) next to the
  /// shown selling price (`display_price`).
  bool get showDiscount => hasDiscount && listPrice > displayPrice;

  double get effectivePreorderPrice {
    if (preorderPrice != null && preorderPrice! > 0) return preorderPrice!;
    return finalPrice > 0 ? finalPrice : ourPrice;
  }
}
