class DateFilterStrings {
  static String filteringByDate = "";
  static String startDate = "";
  static String endDate = "";
  static String errorMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      filteringByDate = 'Filtering by Date:';
      startDate = 'Start Date';
      endDate = 'End Date';
      errorMessage = 'Error fetching PVs: ';
    } else if (languageCode == 'fr') {
      filteringByDate = 'Filtrage par date :';
      startDate = 'Date de début';
      endDate = 'Date de fin';
      errorMessage = 'Erreur lors de la récupération des PV : ';
    }
  }
}
