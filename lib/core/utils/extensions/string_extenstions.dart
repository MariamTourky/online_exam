extension StringExtension on String {
  bool get isValidEmail => RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  ).hasMatch(this);

  bool get isValidPassword =>
      length >= 6 &&
          contains(RegExp(r'[A-Z]')) &&
          contains(RegExp(r'[0-9]'));

  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
