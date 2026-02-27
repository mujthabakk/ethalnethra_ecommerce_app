class ProductModel {
  final String id;
  final String name;
  final String description; // Subtitle like "1kg, Price"
  final String longDescription; // Detailed description
  final String imagePath;
  final double price;
  final String unit;
  /// When true, product shows "Add To Pre-order Basket" option on card and detail.
  final bool isPreOrder;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    this.longDescription =
        'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
    required this.imagePath,
    required this.price,
    required this.unit,
    this.isPreOrder = false,
  });
}
