class LoginPageStrings {
  static String loginToAccountLabel = "";
  static String login = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      loginToAccountLabel = 'Login to your account';
      login = 'Login';
    } else if (languageCode == 'fr') {
      loginToAccountLabel = 'Connectez-vous à votre compte';
      login = 'Se connecter';
    }
  }
}
