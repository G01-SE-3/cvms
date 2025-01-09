class DeleteInspectorButtonWidgetStrings {
  static String deleteButtonText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      deleteButtonText = "Delete";
    } else if (languageCode == 'fr') {
      deleteButtonText = "Supprimer";
    }
  }
}
