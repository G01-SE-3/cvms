import 'package:cvms/presentation/screens/sign_up/constants/strings/SignUpPage.dart';

class SignUpPageValidate {
  static String? validateUsername(String? value, List<String> existingUsernames) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.usernameRequired;
    }
    if (existingUsernames.contains(value)) {
      return SignUpPageStrings.usernameExists;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.emailRequired;
    }
    if (!RegExp(r'^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$').hasMatch(value)) {
      return SignUpPageStrings.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.passwordRequired;
    }
    if (value.length < 6) {
      return SignUpPageStrings.passwordTooShort;
    }
    return null;
  }
}
