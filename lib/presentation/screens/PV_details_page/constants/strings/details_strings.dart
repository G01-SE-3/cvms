class DetailsStrings {
  static String sectionTitle = "";
  static String pvNumber = "";
  static String offenderName = "";
  static String offenderCr = "";
  static String pvIssueDate = "";
  static String violationType = "";
  static String inspectingOfficers = "";
  static String totalNonFactorizationAmount = "";
  static String totalIllegalProfit = "";
  static String subsidizedGood = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      sectionTitle = "Details";
      pvNumber = "PV Number";
      offenderName = "Offender Name";
      offenderCr = "Offender CR";
      pvIssueDate = "PV Issue Date";
      violationType = "Violation Type";
      inspectingOfficers = "Inspecting Officers";
      totalNonFactorizationAmount = "Total Non-Factorization Amount";
      totalIllegalProfit = "Total Illegal Profit";
      subsidizedGood = "Subsidized Good";
    } else if (languageCode == 'fr') {
      sectionTitle = "Détails";
      pvNumber = "Numéro PV";
      offenderName = "Nom de l'infracteur";
      offenderCr = "CR de l'infracteur";
      pvIssueDate = "Date d'émission du PV";
      violationType = "Type de violation";
      inspectingOfficers = "Agents inspecteurs";
      totalNonFactorizationAmount = "Montant total non-facturé";
      totalIllegalProfit = "Total des profits illégaux";
      subsidizedGood = "Bien subventionné";
    }
  }
}
