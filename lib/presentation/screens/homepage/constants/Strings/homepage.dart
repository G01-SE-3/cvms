class HomePageStrings {
  static String totalPVs = "";
  static String economicOperators = "";
  static String inspectors = "";
  static String errorMessage = "";
  static String monthlyPVsEvolution = "";

  static String addPV = "";
  static String addBusinessOffender = "";
  static String addIndividualOffender = "";
  static String addInspector = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      totalPVs = 'Total PVs';
      economicOperators = 'Economic Operators';
      inspectors = 'Inspectors';
      errorMessage = 'Error: ';
      monthlyPVsEvolution = 'Monthly PVs Evolution';

      addPV = 'Add PV';
      addBusinessOffender = 'Add Business Offender';
      addIndividualOffender = 'Add Individual Offender';
      addInspector = 'Add Inspector';
    } else if (languageCode == 'fr') {
      totalPVs = 'Total PV';
      economicOperators = 'Opérateurs économiques';
      inspectors = 'Inspecteurs';
      errorMessage = 'Erreur : ';
      monthlyPVsEvolution = 'Évolution mensuelle des PV';

      addPV = 'Ajouter un PV';
      addBusinessOffender = 'Ajouter un infracteur commercial';
      addIndividualOffender = 'Ajouter un infracteur individuel';
      addInspector = 'Ajouter un inspecteur';
    }
  }
}
