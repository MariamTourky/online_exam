import 'package:online_exam/core/utils/extensions/string_extenstions.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.isValidEmail) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!value.isValidPassword) {
      return 'At least 6 chars, 1 capital letter, and 1 number';
    }
    return null;
  }
}
