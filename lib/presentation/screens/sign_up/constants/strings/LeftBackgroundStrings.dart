class LeftBackgroundStrings {
  static String welcomeMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      welcomeMessage = "Welcome ..";
    } else if (languageCode == 'fr') {
      welcomeMessage = "Bienvenue ..";
    }
  }
}
