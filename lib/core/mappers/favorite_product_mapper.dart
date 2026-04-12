import '../../models/product_model.dart';
import '../models/commerce/favorites_dtos.dart';

extension FavoriteProductMapper on FavoriteProductDto {
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      description: 'Tap to view details',
      imagePath: imageUrl,
      price: price,
      unit: '',
      isPreOrder: false,
    );
  }
}
