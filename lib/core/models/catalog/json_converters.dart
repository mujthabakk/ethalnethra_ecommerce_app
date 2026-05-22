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

bool boolFromJson(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is num) return value != 0;
  final s = value.toString().toLowerCase();
  return s == 'true' || s == '1' || s == 'yes';
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

int? intNullableFromJson(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString());
}

/// Unwraps `{ data: ... }`, `{ result: ... }`, or returns map as-is.
Map<String, dynamic> mapFromJson(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is Map) return Map<String, dynamic>.from(value);
  return {};
}

/// Finds a list inside common API wrappers.
List<dynamic> listFromJson(
  dynamic value, {
  String? key,
  List<String> wrapKeys = const [
    'data',
    'result',
    'items',
    'records',
  ],
}) {
  if (value == null) return [];
  if (value is List) return value;
  if (value is! Map) return [];
  final map = value is Map<String, dynamic>
      ? value
      : Map<String, dynamic>.from(value);
  if (key != null && map[key] is List) return map[key] as List;
  for (final k in wrapKeys) {
    final v = map[k];
    if (v is List) return v;
  }
  return [];
}

List<Map<String, dynamic>> listOfMapsFromJson(
  dynamic value, {
  String? key,
}) {
  return listFromJson(value, key: key)
      .map((e) => e is Map<String, dynamic>
          ? e
          : e is Map
              ? Map<String, dynamic>.from(e)
              : null)
      .whereType<Map<String, dynamic>>()
      .toList();
}

/// Parses list items; skips invalid entries instead of failing the whole list.
/// Parses filter/category lists that may be strings or `{ "name": "..." }` maps.
List<String> stringListFlexibleFromJson(dynamic json) {
  if (json == null) return [];
  if (json is! List) return [];
  return json.map((e) {
    if (e is String) return e;
    if (e is Map) {
      final m = e is Map<String, dynamic> ? e : Map<String, dynamic>.from(e);
      final name = m['name'] ?? m['title'] ?? m['brand'];
      if (name != null) return name.toString();
    }
    return e?.toString() ?? '';
  }).where((s) => s.isNotEmpty).toList();
}

List<T> parseListLoose<T>(
  dynamic raw, {
  String? listKey,
  required T Function(Map<String, dynamic> json) parse,
  bool Function(T item)? keep,
}) {
  final maps = listOfMapsFromJson(raw, key: listKey);
  final out = <T>[];
  for (final map in maps) {
    try {
      final item = parse(map);
      if (keep == null || keep(item)) out.add(item);
    } catch (_) {
      continue;
    }
  }
  return out;
}
