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

int intFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString()) ?? 0;
}

List<dynamic> dynamicListFromJson(dynamic value) {
  if (value == null) return [];
  if (value is List) return value;
  return [];
}

List<String> stringListFromJson(dynamic value) {
  if (value == null) return [];
  if (value is! List) return [];
  return value
      .map((e) => e?.toString() ?? '')
      .where((s) => s.isNotEmpty)
      .toList();
}
