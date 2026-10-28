import 'package:flutter/material.dart';

/// V2 home / brand colors — Figma exact.
abstract final class V2Colors {
  static const Color darkGreen = Color(0xFF0E5A03);
  static const Color mint = Color(0xFFDEFFD9);
  static const Color mintSoft = Color(0xCCDEFFD9);
  static const Color iconChip = Color(0xFFE9E9E9);
  static const Color searchBar = Color(0xFFE9E9E9);
  static const Color textPrimary = Color(0xFF181725);
  static const Color textSecondary = Color(0xFF7C7C7C);
  static const Color shopNow = Color(0xFF0E5A03);
  static const Color navActive = Color(0xFF0E5A03);
  static const Color white = Color(0xFFFFFFFF);
  static const Color dealBadge = Color(0xFFE53935);

  static const LinearGradient promoGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFDEFFD9)],
    stops: [0.0, 1.0],
  );
}
