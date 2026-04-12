import '../../models/product_model.dart';
import '../models/catalog/product_detail_dto.dart';

extension ProductDetailDtoMapper on ProductDetailDto {
  ProductModel toProductModel(ProductModel listing) {
    final primary =
        images.isNotEmpty ? images.first : listing.imagePath;
    final desc = description?.trim();
    return ProductModel(
      id: id,
      name: name,
      description: listing.description.isNotEmpty
          ? listing.description
          : '${listing.unit}, Price',
      longDescription: (desc != null && desc.isNotEmpty)
          ? desc
          : listing.longDescription,
      imagePath: primary,
      price: displayPrice,
      unit: listing.unit,
      isPreOrder: preorderAvailable,
    );
  }
}
