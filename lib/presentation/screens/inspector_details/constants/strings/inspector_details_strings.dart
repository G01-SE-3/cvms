class InspectorDetailsPageStrings {
  static String personalInfoTitle = "";
  static String inspectorNumberLabel = "";
  static String inspectorNameLabel = "";
  static String inspectorSurnameLabel = "";
  static String inspectorBadgeNumberLabel = "";
  static String assignedDepartmentLabel = "";
  static String contactNumberLabel = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      personalInfoTitle = "Personal Information";
      inspectorNumberLabel = "Inspector Number";
      inspectorNameLabel = "Inspector Name";
      inspectorSurnameLabel = "Inspector Surname";
      inspectorBadgeNumberLabel = "Inspector Badge Number";
      assignedDepartmentLabel = "Assigned Department";
      contactNumberLabel = "Contact Number";
    } else if (languageCode == 'fr') {
      personalInfoTitle = "Informations Personnelles";
      inspectorNumberLabel = "Numéro d'Inspecteur";
      inspectorNameLabel = "Nom de l'Inspecteur";
      inspectorSurnameLabel = "Prénom de l'Inspecteur";
      inspectorBadgeNumberLabel = "Numéro de Badge de l'Inspecteur";
      assignedDepartmentLabel = "Département Assigné";
      contactNumberLabel = "Numéro de Contact";
    }
  }
}
