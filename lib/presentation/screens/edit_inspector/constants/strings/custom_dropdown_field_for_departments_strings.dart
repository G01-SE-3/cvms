class CustomDropdownFieldForDepartmentsStrings {
  static String labelText = "";
  static String hr = "";
  static String finance = "";
  static String operations = "";
  static String it = "";
  static String sales = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      labelText = "Department";
      hr = "HR";
      finance = "Finance";
      operations = "Operations";
      it = "IT";
      sales = "Sales";
    } else if (languageCode == 'fr') {
      labelText = "Département";
      hr = "RH"; // Ressources Humaines
      finance = "Finances";
      operations = "Opérations";
      it = "Informatique";
      sales = "Ventes";
    }
  }
}
