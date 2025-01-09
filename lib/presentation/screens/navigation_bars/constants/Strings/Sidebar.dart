class SidebarStrings {
  static String dashboard = "";
  static String pvList = "";
  static String inspectors = "";
  static String businessOffender = "";
  static String individualOffender = "";
  static String help = "";
  static String settings = "";
  static String logout = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      dashboard = 'Dashboard';
      pvList = 'PVs';
      inspectors = 'Inspectors';
      businessOffender = 'Business Offender';
      individualOffender = 'Individual Offender';
      help = 'Help';
      settings = 'Settings';
      logout = 'Logout';
    } else if (languageCode == 'fr') {
      dashboard = 'Tableau de bord';
      pvList = 'PV';
      inspectors = 'Inspecteurs';
      businessOffender = 'Infracteur commercial';
      individualOffender = 'Infracteur individuel';
      help = 'Aide';
      settings = 'Paramètres';
      logout = 'Déconnexion';
    }
  }
}
