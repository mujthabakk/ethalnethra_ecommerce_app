import '../models/catalog/category_item.dart';

/// Remote image when provided; otherwise a local asset chosen from the category name.
String categoryDisplayImagePath(CategoryItem c) {
  final url = c.imageUrl?.trim();
  if (url != null && url.isNotEmpty) {
    return url;
  }
  return categoryFallbackAssetForName(c.name);
}

String categoryFallbackAssetForName(String name) {
  final n = name.toLowerCase();
  if (n.contains('meat') || n.contains('fish')) {
    return 'asstes/images/meat_fish.png';
  }
  if (n.contains('fruit') || n.contains('vegetable')) {
    return 'asstes/images/frash_fruits_vegetable.png';
  }
  if (n.contains('fashion') || n.contains('makeup') || n.contains('cosmetic')) {
    return 'asstes/images/bakery_snacks.png';
  }
  if (n.contains('groc')) {
    return 'asstes/images/grocery.png';
  }
  if (n.contains('home')) {
    return 'asstes/images/rice.png';
  }
  if (n.contains('oil') || n.contains('ghee')) {
    return 'asstes/images/cooking_oil_ghee.png';
  }
  if (n.contains('dairy') || n.contains('egg')) {
    return 'asstes/images/dairy_eggs.png';
  }
  if (n.contains('beverage') || n.contains('drink')) {
    return 'asstes/images/beverages.png';
  }
  return 'asstes/images/grocery.png';
}
