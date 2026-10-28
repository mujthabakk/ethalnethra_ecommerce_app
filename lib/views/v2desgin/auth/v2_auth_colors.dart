import 'package:flutter/material.dart';

/// Exact Figma colors: #DEFFD9 + #0E5A03
abstract final class V2AuthUiColors {
  static const Color darkGreen = Color(0xFF0E5A03);
  static const Color deepGreen = Color(0xFF0E5A03);
  static const Color mint = Color(0xFFDEFFD9);
  static const Color mintAlt = Color(0xFFDEFFD9);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF0E5A03);
  static const Color hint = Color(0xFF8AA88A);
  static const Color resendBrown = Color(0xFF8B7355);

  static const LinearGradient ctaGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF000000), Color(0xFF0E5A03)],
  );
}
