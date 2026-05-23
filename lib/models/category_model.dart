import 'package:flutter/material.dart';

import '../core/utils/product_display_name.dart';

class CategoryModel {
  final String id;
  /// English name (API / filters).
  final String name;
  final String nameMl;
  final String imagePath;
  final Color backgroundColor;

  CategoryModel({
    required this.id,
    required this.name,
    this.nameMl = '',
    required this.imagePath,
    required this.backgroundColor,
  });

  String get displayName =>
      formatProductDisplayName(nameMl: nameMl, nameEn: name);
}
