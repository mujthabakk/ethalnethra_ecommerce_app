import '../utils/product_display_name.dart';
import '../../models/product_model.dart';
import '../models/catalog/product_detail_dto.dart';

extension ProductDetailDtoMapper on ProductDetailDto {
  double get _effectiveDisplayPrice =>
      displayPrice > 0 ? displayPrice : finalPrice;

  ProductModel toProductModel(ProductModel listing) {
    final primary = images.isNotEmpty
        ? images.first
        : (imageUrl.isNotEmpty ? imageUrl : listing.imagePath);
    final desc = formatProductDescription(
      descriptionMl: descriptionMl,
      descriptionEn: description,
    ).trim();
    final unitLabel = weight.isNotEmpty ? weight : listing.unit;
    return ProductModel(
      id: id,
      name: name,
      nameMl: nameMl,
      description: listing.description.isNotEmpty
          ? listing.description
          : '$unitLabel, Price',
      longDescription: desc.isNotEmpty ? desc : listing.longDescription,
      imagePath: primary,
      price: _effectiveDisplayPrice,
      unit: unitLabel,
      preorderAvailable: preorderAvailable || listing.preorderAvailable,
      instantOrderAvailable:
          instantOrderAvailable || listing.instantOrderAvailable,
      isCustomOrder: isCustomOrder || listing.isCustomOrder,
      isGramWise: isGramWise || listing.isGramWise,
      listPrice: price,
      ourPrice: ourPrice,
      finalPrice: finalPrice,
      displayPrice: displayPrice,
      preorderPrice: preorderPrice,
      hasDiscount: hasDiscount,
      discountPercentage: discountPercentage,
      stock: stock ?? listing.stock,
      category: category.isNotEmpty ? category : listing.category,
      type: type.isNotEmpty ? type : listing.type,
    );
  }
}
