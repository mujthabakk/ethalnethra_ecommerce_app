import '../../utils/custom_order_quantity.dart';
import '../../utils/product_display_name.dart';
import 'cart_dtos.dart';

extension CartLineDisplay on CartLineDto {
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);

  bool get isWeighted => isCustomOrder || isGramWise;

  String get quantityLabel => isWeighted
      ? CustomOrderQuantity.formatLabel(quantity, 'kg', isGramWise: isGramWise)
      : quantity == quantity.roundToDouble()
          ? quantity.toInt().toString()
          : quantity.toStringAsFixed(1);

  String get unitPriceLabel => isWeighted
      ? '₹${price.toStringAsFixed(2)} / kg'
      : '₹${price.toStringAsFixed(2)} each';
}
