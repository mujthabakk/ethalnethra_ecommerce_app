import '../../utils/product_display_name.dart';
import 'cart_dtos.dart';

extension CartLineDisplay on CartLineDto {
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);
}
