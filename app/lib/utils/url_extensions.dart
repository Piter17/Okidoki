extension StringUrlX on String {
  String? removeSas() {
    final uri = Uri.tryParse(this);
    return uri == null ? null : "${uri.origin}${uri.path}";
  }

  bool representSameFile(String? other) => removeSas() == other?.removeSas();
}
