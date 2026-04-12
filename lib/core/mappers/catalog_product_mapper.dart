import '../../models/product_model.dart';
import '../models/catalog/catalog_product.dart';

extension CatalogProductMapper on CatalogProduct {
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      description: '$weight, Price',
      imagePath: imageUrl,
      price: displayPrice,
      unit: weight,
      isPreOrder: preorderAvailable,
    );
  }
}
