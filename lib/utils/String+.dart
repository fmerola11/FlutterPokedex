extension StringExtension on String {
  String capitalized() {
    return this[0].toUpperCase() + substring(1);
  }
}