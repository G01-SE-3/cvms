class GeneralAppbarStrings {
  static String home = "";
  static String pvList = "";
  static String inspectors = "";
  static String businessOffenders = "";
  static String individualOffenders = "";
  static String none = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      home = 'Home';
      pvList = 'PVs';
      inspectors = 'Inspectors';
      businessOffenders = 'Business Offenders';
      individualOffenders = 'Individual Offenders';
      none = 'none';
    } else if (languageCode == 'fr') {
      home = 'Accueil';
      pvList = 'PV';
      inspectors = 'Inspecteurs';
      businessOffenders = 'Infracteur(s) commercial(aux)';
      individualOffenders = 'Infracteur(s) individuel(s)';
      none = 'aucun';
    }
  }
}
