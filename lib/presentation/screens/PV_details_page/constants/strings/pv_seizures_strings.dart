class PVSeizuresStrings {
  static String title = "";
  static String showSeizuresButton = "";
  static String hideSeizuresButton = "";
  static String noSeizuresMessage = "";

  static String seizureNumber = "";
  static String amount = "";
  static String quantity = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "Seizures";
      showSeizuresButton = "Show Seizures";
      hideSeizuresButton = "Hide Seizures";
      noSeizuresMessage = "No seizures associated with this PV.";
      seizureNumber = "Seizure Number";
      amount = "Amount";
      quantity = "Quantity";
    } else if (languageCode == 'fr') {
      title = "Saisies";
      showSeizuresButton = "Afficher les saisies";
      hideSeizuresButton = "Cacher les saisies";
      noSeizuresMessage = "Aucune saisie associée à ce PV.";
      seizureNumber = "Numéro de saisie";
      amount = "Montant";
      quantity = "Quantité";
    }
  }
}
