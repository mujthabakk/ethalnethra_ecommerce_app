/// Malayalam label first; English in parentheses when both exist.
String formatProductDisplayName({
  String? nameMl,
  String? nameEn,
}) {
  final ml = (nameMl ?? '').trim();
  final en = (nameEn ?? '').trim();
  if (ml.isNotEmpty && en.isNotEmpty) {
    if (ml == en) return ml;
    return '$ml ($en)';
  }
  if (ml.isNotEmpty) return ml;
  return en;
}

/// Prefer Malayalam body; append English when both exist.
String formatProductDescription({
  String? descriptionMl,
  String? descriptionEn,
}) {
  final ml = (descriptionMl ?? '').trim();
  final en = (descriptionEn ?? '').trim();
  if (ml.isNotEmpty && en.isNotEmpty) {
    if (ml == en) return ml;
    return '$ml\n\n$en';
  }
  if (ml.isNotEmpty) return ml;
  return en;
}
