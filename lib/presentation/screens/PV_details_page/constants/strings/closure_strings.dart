class ClosureStrings {
  static String sectionTitle = "";
  static String hideClosure = "";
  static String showClosure = "";
  static String closureOrderNumber = "";
  static String closureOrderDate = "";
  static String reopeningRequestNumber = "";
  static String reportingNumber = "";
  static String noClosureMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      sectionTitle = "Closure";
      hideClosure = "Hide Closure";
      showClosure = "Show Closure";
      closureOrderNumber = "Closure Order Number";
      closureOrderDate = "Closure Order Date";
      reopeningRequestNumber = "Reopening Request Number";
      reportingNumber = "Reporting Number";
      noClosureMessage = "No closure associated with this PV.";
    } else if (languageCode == 'fr') {
      sectionTitle = "Clôture";
      hideClosure = "Cacher la clôture";
      showClosure = "Afficher la clôture";
      closureOrderNumber = "Numéro de commande de clôture";
      closureOrderDate = "Date de commande de clôture";
      reopeningRequestNumber = "Numéro de demande de réouverture";
      reportingNumber = "Numéro de rapport";
      noClosureMessage = "Aucune clôture associée à ce PV.";
    }
  }
}
