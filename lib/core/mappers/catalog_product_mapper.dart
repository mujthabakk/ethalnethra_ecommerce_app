import '../../models/product_model.dart';
import '../models/catalog/catalog_product.dart';
import '../models/catalog/catalog_product_extensions.dart';

extension CatalogProductMapper on CatalogProduct {
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      nameMl: nameMl,
      description: '$weight, Price',
      imagePath: imageUrl,
      price: effectiveDisplayPrice,
      unit: weight,
      isPreOrder: preorderAvailable,
      listPrice: price,
      ourPrice: ourPrice,
      finalPrice: finalPrice,
      displayPrice: displayPrice,
      preorderPrice: preorderPrice,
      hasDiscount: hasDiscount,
      discountPercentage: discountPercentage,
      stock: stock,
      category: category,
      type: type,
    );
  }
}
