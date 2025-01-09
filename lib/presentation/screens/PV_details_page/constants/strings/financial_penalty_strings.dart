class FinancialPenaltyStrings {
  static String sectionTitle = "";
  static String showButton = "";
  static String hideButton = "";
  static String noFinancialPenaltyMessage = "";

  static String penaltyNumber = "";
  static String penaltyAmount = "";
  static String penaltyDate = "";
  static String paymentReceiptNumber = "";
  static String paymentReceiptDate = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      sectionTitle = "Financial Penalty";
      showButton = "Show Financial Penalty";
      hideButton = "Hide Financial Penalty";
      noFinancialPenaltyMessage =
          "No financial penalty associated with this PV.";
      penaltyNumber = "Penalty Number";
      penaltyAmount = "Penalty Amount";
      penaltyDate = "Penalty Date";
      paymentReceiptNumber = "Payment Receipt Number";
      paymentReceiptDate = "Payment Receipt Date";
    } else if (languageCode == 'fr') {
      sectionTitle = "Pénalité financière";
      showButton = "Afficher la pénalité financière";
      hideButton = "Cacher la pénalité financière";
      noFinancialPenaltyMessage =
          "Aucune pénalité financière associée à ce PV.";
      penaltyNumber = "Numéro de pénalité";
      penaltyAmount = "Montant de la pénalité";
      penaltyDate = "Date de la pénalité";
      paymentReceiptNumber = "Numéro de reçu de paiement";
      paymentReceiptDate = "Date de reçu de paiement";
    }
  }
}
