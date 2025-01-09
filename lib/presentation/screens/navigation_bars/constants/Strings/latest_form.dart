class LatestPopupFormStrings {
  static String title = "";
  static String hintText = "";
  static String errorMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = 'Latest:';
      hintText = 'Enter a number';
      errorMessage = 'Error: ';
    } else if (languageCode == 'fr') {
      title = 'Dernier :';
      hintText = 'Entrez un numéro';
      errorMessage = 'Erreur : ';
    }
  }
}
