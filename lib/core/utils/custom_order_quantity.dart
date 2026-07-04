/// Quantity rules for weight-based products (`is_custom_order`).
///
/// Quantities are always tracked in **kilograms** (the unit the API and the
/// per-kg pricing expect), regardless of how they are displayed.
///
/// - kg-wise: start at 1 kg, then ±0.5 kg per step (min 1 kg).
/// - gram-wise (`is_gram_wise`): start at 500 g, then ±50 g per step (min 50 g),
///   displayed in grams.
abstract final class CustomOrderQuantity {
  // kg-wise (values in kg)
  static const double initialKg = 1.0;
  static const double stepKg = 0.5;
  static const double minKg = 1.0;

  // gram-wise (values still in kg: 50 g == 0.05 kg)
  static const double gramInitialKg = 0.5; // 500 g
  static const double gramStepKg = 0.05; // 50 g
  static const double gramMinKg = 0.05; // 50 g

  /// Starting quantity (kg) for a fresh add-to-cart.
  static double initial({bool isGramWise = false}) =>
      isGramWise ? gramInitialKg : initialKg;

  static double increment(double current, {bool isGramWise = false}) {
    final step = isGramWise ? gramStepKg : stepKg;
    return _round(current + step);
  }

  /// Returns `null` when the next step is below the minimum (caller should
  /// remove the line).
  static double? decrement(double current, {bool isGramWise = false}) {
    final step = isGramWise ? gramStepKg : stepKg;
    final min = isGramWise ? gramMinKg : minKg;
    final next = _round(current - step);
    if (next < min - 1e-9) return null;
    return next;
  }

  static String formatLabel(
    double quantity,
    String unit, {
    bool isGramWise = false,
  }) {
    if (isGramWise) {
      final grams = (quantity * 1000).round();
      if (grams < 1000) return '$grams g';
      final kg = grams / 1000;
      var s = kg.toStringAsFixed(2);
      if (s.endsWith('00')) {
        s = kg.toStringAsFixed(0); // 1.00 -> 1
      } else if (s.endsWith('0')) {
        s = kg.toStringAsFixed(1); // 3.10 -> 3.1
      }
      return '$s kg';
    }
    final u = unit.trim().isEmpty ? 'kg' : unit.trim();
    if (quantity == quantity.roundToDouble()) {
      return '${quantity.toInt()} $u';
    }
    return '${quantity.toStringAsFixed(1)} $u';
  }

  static double _round(double v) => (v * 100).roundToDouble() / 100;
}
