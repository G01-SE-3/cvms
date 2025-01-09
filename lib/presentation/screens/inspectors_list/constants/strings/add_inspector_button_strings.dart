class AddStrings {
  static String addNewInspector = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      addNewInspector = "Add New Inspector";
    } else if (languageCode == 'fr') {
      addNewInspector = "Ajouter un Nouvel Inspecteur";
    }
  }
}
