class InspectorTableStrings {
  // General strings for the table
  static String inspectorNumber = "";
  static String name = "";
  static String surname = "";
  static String badgeNumber = "";
  static String department = "";
  static String contact = "";
  static String noInspectorsFound = "";

  // Popup menu options
  static String edit = "";
  static String delete = "";

  // Alert dialog strings
  static String deleteInspector = "";
  static String areYouSureDelete = "";
  static String cancel = "";
  static String deleteAction = "";

  // Inspector details strings
  static String inspectorDetails = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      inspectorNumber = "Inspector Number";
      name = "Name";
      surname = "Surname";
      badgeNumber = "Badge Number";
      department = "Department";
      contact = "Contact";
      noInspectorsFound = "No inspectors found";

      // Popup menu options
      edit = "Edit";
      delete = "Delete";

      // Alert dialog strings
      deleteInspector = "Delete Inspector";
      areYouSureDelete = "Are you sure you want to delete this inspector?";
      cancel = "Cancel";
      deleteAction = "Delete";

      // Inspector details strings
      inspectorDetails = "Inspector Details";
    } else if (languageCode == 'fr') {
      inspectorNumber = "Numéro d'Inspecteur";
      name = "Nom";
      surname = "Prénom";
      badgeNumber = "Numéro de Badge";
      department = "Département";
      contact = "Contact";
      noInspectorsFound = "Aucun inspecteur trouvé";

      // Popup menu options
      edit = "Modifier";
      delete = "Supprimer";

      // Alert dialog strings
      deleteInspector = "Supprimer l'Inspecteur";
      areYouSureDelete = "Êtes-vous sûr de vouloir supprimer cet inspecteur ?";
      cancel = "Annuler";
      deleteAction = "Supprimer";

      // Inspector details strings
      inspectorDetails = "Détails de l'Inspecteur";
    }
  }
}
