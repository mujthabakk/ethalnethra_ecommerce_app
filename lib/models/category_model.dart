import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imagePath;
  final Color backgroundColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });
}
