extension StringUrlX on String {
  String? removeSas() {
    final uri = Uri.tryParse(this);
    return uri == null ? null : "${uri.origin}${uri.path}";
  }

  bool representSameFile(String? other) => removeSas() == other?.removeSas();

  int toInt() => int.parse(this);
  int? toNInt() => int.tryParse(this);
}

extension DateTimeX on DateTime {
  static DateTime get min => DateTime.fromMicrosecondsSinceEpoch(0);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  DateTime get zero => min;

  Duration get timeSinceNow => DateTime.now().difference(this);
}

extension IntX on int? {
  bool get isNullOrZero => this == null || this == 0;
  bool get isNotNullOrZero => !isNullOrZero;
}
