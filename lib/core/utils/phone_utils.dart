/// Keeps only digits from [raw].
String digitsOnly(String raw) =>
    RegExp(r'\d').allMatches(raw).map((m) => m.group(0)!).join();

/// Normalizes Indian mobile: digits only, last 10 digits if longer.
String normalizeIndianPhone(String raw) {
  final d = digitsOnly(raw);
  if (d.length <= 10) return d;
  return d.substring(d.length - 10);
}
