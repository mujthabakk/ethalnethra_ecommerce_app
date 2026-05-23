import '../../utils/product_display_name.dart';
import 'category_item.dart';

extension CategoryItemDisplay on CategoryItem {
  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);
}
