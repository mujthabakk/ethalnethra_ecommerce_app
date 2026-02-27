import 'package:flutter/material.dart';

/// App Color Palette
/// Based on the design specification
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(
    0xFF53B175,
  ); // Green - Primary action color
  static const Color googleBlue = Color(0xFF5383EC); // Blue - Google button
  static const Color facebookBlue = Color(
    0xFF4A66AC,
  ); // Dark Blue - Facebook button
  static const Color darkBackground = Color(0xFF181725); // Dark - Text primary
  static const Color textSecondary = Color(0xFF7C7C7C); // Grey - Secondary text

  // Additional Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Pre-order / Instant cart tab active (orange) - #F7B23B
  static const Color preOrderOrange = Color(0xFFF7B23B);

  // Background Colors
  static const Color scaffoldBackground = Color(0xFFFCFCFC);
  static const Color inputBackground = Color(0xFFF2F3F2);

  // Border Colors
  static const Color borderGrey = Color(0xFFE2E2E2);
  static const Color inputBorder = Color(0xFFE2E2E2);

  // Gradient for Welcome Screen
  static const List<Color> welcomeGradient = [
    Color(0x00000000),
    Color(0x80000000),
    Color(0xE0000000),
  ];
}
