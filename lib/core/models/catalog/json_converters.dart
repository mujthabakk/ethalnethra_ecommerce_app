String stringFromJson(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

double doubleFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0;
}

double? doubleNullableFromJson(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
