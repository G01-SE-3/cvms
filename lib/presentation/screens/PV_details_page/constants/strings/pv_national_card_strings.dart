class PVNationalCardStrings {
  static String title = "";
  static String showDetailsButton = "";
  static String hideDetailsButton = "";
  static String noNationalCardMessage = "";

  static String registrationDate = "";
  static String registrationNumber = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "National Card Registration";
      showDetailsButton = "Show Details";
      hideDetailsButton = "Hide Details";
      noNationalCardMessage =
          "No national card registration associated with this PV.";
      registrationDate = "Registration Date";
      registrationNumber = "Registration Number";
    } else if (languageCode == 'fr') {
      title = "Enregistrement de la carte nationale";
      showDetailsButton = "Afficher les détails";
      hideDetailsButton = "Cacher les détails";
      noNationalCardMessage =
          "Aucun enregistrement de carte nationale associé à ce PV.";
      registrationDate = "Date d'enregistrement";
      registrationNumber = "Numéro d'enregistrement";
    }
  }
}
