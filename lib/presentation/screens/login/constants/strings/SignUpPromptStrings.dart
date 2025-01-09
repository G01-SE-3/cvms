class SignUpPromptStrings {
  static String haveAccountLabel = "";
  static String signUpLabel = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      haveAccountLabel = "Don't have an account?";
      signUpLabel = 'Sign up';
    } else if (languageCode == 'fr') {
      haveAccountLabel = "Vous n'avez pas de compte ?";
      signUpLabel = 'S\'inscrire';
    }
  }
}
