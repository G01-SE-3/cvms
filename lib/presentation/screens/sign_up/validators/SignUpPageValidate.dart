/*`File Name: <SignUpPageValidate.dart>
Purpose: 
- The purpose of this file is to validate user input for the signup page, ensuring the username, email, and password meet required criteria.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/


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
