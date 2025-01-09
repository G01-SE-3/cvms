class Forgotpasswordstrings {
  static String ForgotPassword = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      ForgotPassword = 'Forgot Password?';
    } else if (languageCode == 'fr') {
      ForgotPassword = 'Mot de passe oublié ?';
    }
  }
}
