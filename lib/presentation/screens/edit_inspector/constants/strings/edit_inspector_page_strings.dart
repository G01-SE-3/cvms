class EditInspectorPageStrings {
  static String title = "";
  static String inspectorNumberHint = "";
  static String inspectorNameHint = "";
  static String inspectorSurnameHint = "";
  static String inspectorBadgeNumberHint = "";
  static String contactNumberHint = "";
  static String cancelButton = "";
  static String saveButton = "";
  static String inspectorAddedMessage = "";
  static String inspectorDefaultDepartment = "";
  static String message = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "Edit Inspector";
      inspectorNumberHint = "Inspector number";
      inspectorNameHint = "Inspector Name";
      inspectorSurnameHint = "Inspector Surname";
      inspectorBadgeNumberHint = "Inspector Badge Number";
      contactNumberHint = "Contact Number";
      cancelButton = "Cancel";
      saveButton = "Edit";
      inspectorAddedMessage = "Inspector edited";
      inspectorDefaultDepartment = "HR";
      message = "";
    } else if (languageCode == 'fr') {
      title = "Modifier Inspecteur";
      inspectorNumberHint = "Numéro d'inspecteur";
      inspectorNameHint = "Nom de l'inspecteur";
      inspectorSurnameHint = "Prénom de l'inspecteur";
      inspectorBadgeNumberHint = "Numéro de badge de l'inspecteur";
      contactNumberHint = "Numéro de contact";
      cancelButton = "Annuler";
      saveButton = "Modifier";
      inspectorAddedMessage = "Inspecteur modifié";
      inspectorDefaultDepartment = "RH";
      message = "";
    }
  }
}
