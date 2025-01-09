class PVLegalProceedingsStrings {
  static String title = "";
  static String showProceedingsButton = "";
  static String hideProceedingsButton = "";
  static String noProceedingsMessage = "";

  static String referralToJusticeNumber = "";
  static String referralToJusticeDate = "";
  static String jurisdiction = "";
  static String legalProvisions = "";
  static String courtDecisionNumber = "";
  static String courtDecisionDate = "";
  static String courtImposedFineAmount = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "Legal Proceedings";
      showProceedingsButton = "Show Legal Proceedings";
      hideProceedingsButton = "Hide Legal Proceedings";
      noProceedingsMessage = "No legal proceedings associated with this PV.";
      referralToJusticeNumber = "Referral to Justice Number";
      referralToJusticeDate = "Referral to Justice Date";
      jurisdiction = "Jurisdiction";
      legalProvisions = "Legal Provisions";
      courtDecisionNumber = "Court Decision Number";
      courtDecisionDate = "Court Decision Date";
      courtImposedFineAmount = "Court Imposed Fine Amount";
    } else if (languageCode == 'fr') {
      title = "Procédures judiciaires";
      showProceedingsButton = "Afficher les procédures judiciaires";
      hideProceedingsButton = "Cacher les procédures judiciaires";
      noProceedingsMessage = "Aucune procédure judiciaire associée à ce PV.";
      referralToJusticeNumber = "Numéro de renvoi à la justice";
      referralToJusticeDate = "Date de renvoi à la justice";
      jurisdiction = "Juridiction";
      legalProvisions = "Dispositions légales";
      courtDecisionNumber = "Numéro de décision du tribunal";
      courtDecisionDate = "Date de décision du tribunal";
      courtImposedFineAmount = "Montant de l'amende imposée par le tribunal";
    }
  }
}
