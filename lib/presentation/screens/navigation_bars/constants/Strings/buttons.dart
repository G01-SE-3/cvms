class ButtonStrings {
  static String cancel = "";
  static String apply = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      cancel = 'Cancel';
      apply = 'Apply';
    } else if (languageCode == 'fr') {
      cancel = 'Annuler';
      apply = 'Appliquer';
    }
  }
}
