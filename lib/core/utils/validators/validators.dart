
import '../../error/app_error_messages.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return AppErrorMessages.emailRequired;
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) return AppErrorMessages.invalidEmail;
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return AppErrorMessages.passwordRequired;
    if (value.length < 6) return AppErrorMessages.least6Charachters;
    if (!RegExp(r'[A-Z]').hasMatch(value))
      return AppErrorMessages.passwordWithCapital;
    if (!RegExp(r'[0-9]').hasMatch(value)) return AppErrorMessages.passwordWithNumber;
    return null;
  }

  static String? validateRePassword(String? value, String password) {
    if (value == null || value.isEmpty) return AppErrorMessages.confirmPassword;
    if (value != password) return AppErrorMessages.passwordDontMatch;
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return AppErrorMessages.phoneRequired;
    if (!RegExp(r'^01[0-9]{9}$').hasMatch(value))
      return AppErrorMessages.invalidnumber;
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppErrorMessages.required;
    }
    if (value.length < 3) {
      return AppErrorMessages.least3Charachters;
    }
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(value)) {
      return AppErrorMessages.invalidNamed;
    }
    return null;
  }
}
