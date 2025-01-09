class PVHeaderStrings {
  static String title = "";
  static String editButton = "";
  static String exportButton = "";
  static String deleteButton = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "PV Details";
      editButton = "Edit";
      exportButton = "Export";
      deleteButton = "Delete";
    } else if (languageCode == 'fr') {
      title = "Détails du PV";
      editButton = "Modifier";
      exportButton = "Exporter";
      deleteButton = "Supprimer";
    }
  }
}
