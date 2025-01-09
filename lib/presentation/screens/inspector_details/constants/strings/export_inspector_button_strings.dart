class ExportInspectorButtonWidgetStrings {
  static String exportButtonText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      exportButtonText = "Export";
    } else if (languageCode == 'fr') {
      exportButtonText = "Exporter";
    }
  }
}
