class PVListLabels {
  static String exportLabel = "";
  static String addNewPVLabel = "";
  static String pvListTitle = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      exportLabel = 'Export';
      addNewPVLabel = 'Add new PV';
      pvListTitle = 'PVs List';
    } else if (languageCode == 'fr') {
      exportLabel = 'Exporter';
      addNewPVLabel = 'Ajouter un nouveau PV';
      pvListTitle = 'Liste des PVs';
    }
  }
}
