class ValidationUtilStrings {
  static String pleaseEnterInspectorNumber = "";
  static String pleaseEnterInspectorName = "";
  static String pleaseEnterInspectorSurname = "";
  static String pleaseEnterInspectorBadgeNumber = "";
  static String pleaseSelectDepartment = "";
  static String pleaseEnterContactNumber = "";
  static String pleaseEnterValidBadgeNumber = "";
  static String pleaseEnterValidInspectorNumber = "";
  static String invalidDepartmentSelection = "";
  static String invalidContactNumber = "";
  static String hr = "";
  static String finance = "";
  static String operations = "";
  static String it = "";
  static String sales = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      pleaseEnterInspectorNumber = "Please enter inspector number";
      pleaseEnterInspectorName = "Please enter inspector name";
      pleaseEnterInspectorSurname = "Please enter inspector surname";
      pleaseEnterInspectorBadgeNumber = "Please enter inspector badge number";
      pleaseSelectDepartment = "Please select a department";
      pleaseEnterContactNumber = "Please enter contact number";
      pleaseEnterValidBadgeNumber = "Please enter valid badge number";
      pleaseEnterValidInspectorNumber = "Please enter valid inspector number";
      invalidDepartmentSelection = "Please choose a valid department";
      invalidContactNumber = "Please enter a valid contact number";
      hr = "HR";
      finance = "Finance";
      operations = "Operations";
      it = "IT";
      sales = "Sales";
    } else if (languageCode == 'fr') {
      pleaseEnterInspectorNumber = "Veuillez entrer le numéro d'inspecteur";
      pleaseEnterInspectorName = "Veuillez entrer le nom de l'inspecteur";
      pleaseEnterInspectorSurname = "Veuillez entrer le prénom de l'inspecteur";
      pleaseEnterInspectorBadgeNumber =
          "Veuillez entrer le numéro de badge de l'inspecteur";
      pleaseSelectDepartment = "Veuillez sélectionner un département";
      pleaseEnterContactNumber = "Veuillez entrer un numéro de contact";
      pleaseEnterValidBadgeNumber = "Veuillez entrer un numéro de badge valide";
      pleaseEnterValidInspectorNumber =
          "Veuillez entrer un numéro d'inspecteur valide";
      invalidDepartmentSelection = "Veuillez choisir un département valide";
      invalidContactNumber = "Veuillez entrer un numéro de contact valide";
      hr = "RH"; // Ressources Humaines
      finance = "Finances";
      operations = "Opérations";
      it = "Informatique";
      sales = "Ventes";
    }
  }
}
