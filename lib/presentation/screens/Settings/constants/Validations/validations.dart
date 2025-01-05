import '../../../sign_up/constants/strings/SignUpPage.dart';

String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.usernameRequired;
    }
  
    return null;
  }

String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.emailRequired;
    }
    if (!RegExp(r'^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$').hasMatch(value)) {
      return SignUpPageStrings.emailInvalid;
    }
    return null;
  }

String? validateUserPassword(String? value,String? dbValue) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.passwordRequired;
    }
    if (value.length < 6) {
      return SignUpPageStrings.passwordTooShort;
    }
    if(value != dbValue){
      return "Incorrect Password";
    }
    return null;
}


String? validateConfirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please confirm your password";
    }
    if (confirmPassword!= password) {
      return "Passwords do not match";
    }
    return null;
}


String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return SignUpPageStrings.passwordRequired;
    }
    if (value.length < 6) {
      return SignUpPageStrings.passwordTooShort;
    }
    
    return null;
}