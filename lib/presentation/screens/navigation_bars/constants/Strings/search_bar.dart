class SearchStrings {
  static String type = "";
  static String pv = "";
  static String rc = "";
  static String latest = "";
  static String date = "";
  static String clear = "";
  static String search = "";
  static String filterBy = "";
  static String error = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      type = 'Type';
      pv = 'PV';
      rc = 'RC';
      latest = 'Latest';
      date = 'Date';
      clear = 'Clear';
      search = 'Search';
      filterBy = 'Filter by';
      error = 'Error: ';
    } else if (languageCode == 'fr') {
      type = 'Type';
      pv = 'PV';
      rc = 'RC';
      latest = 'Dernier';
      date = 'Date';
      clear = 'Effacer';
      search = 'Recherche';
      filterBy = 'Filtrer par';
      error = 'Erreur: ';
    }
  }
}
