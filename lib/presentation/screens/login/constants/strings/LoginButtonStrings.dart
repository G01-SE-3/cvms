class Loginbuttonstrings {
  static String LoginLabel = "";
  static String LoginFailed = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      LoginLabel = 'Login';
      LoginFailed = 'Account does not exist, please try again';
    } else if (languageCode == 'fr') {
      LoginLabel = 'Se connecter';
      LoginFailed = "Le compte n'existe pas, veuillez réessayer";
    }
  }
}
