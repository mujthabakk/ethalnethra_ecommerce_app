import '../../utils/product_display_name.dart';
import 'catalog_product.dart';

/// Pricing helpers for [CatalogProduct] API fields.
extension CatalogProductPricing on CatalogProduct {
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);

  /// Price shown on product cards (falls back when API sends `display_price: 0`).
  double get effectiveDisplayPrice =>
      displayPrice > 0 ? displayPrice : finalPrice;

  /// Pre-order price for modal / basket.
  double get effectivePreorderPrice {
    if (preorderPrice != null && preorderPrice! > 0) return preorderPrice!;
    return finalPrice > 0 ? finalPrice : ourPrice;
  }

  bool get isInStock => stock > 0;

  bool get showDiscount => hasDiscount && price > finalPrice;
}
