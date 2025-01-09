class AddInspectorButtonWidgetStrings {
  static String addButtonText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      addButtonText = "Add";
    } else if (languageCode == 'fr') {
      addButtonText = "Ajouter";
    }
  }
}
