class ValidationUtilStrings {
  static String emptyField = "";
  static String invalidNumber = "";
  static String invalidPhoneNumber = "";
  static String emptyDepartment = "";
  static String invalidDepartment = "";
  static String number = "";
  static String phone = "";
  static String hr = "";
  static String finance = "";
  static String operations = "";
  static String it = "";
  static String sales = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      emptyField = "This field cannot be empty";
      invalidNumber = "Please enter a valid number";
      invalidPhoneNumber = "Phone number must be 10 digits";
      emptyDepartment = "Please select a department";
      invalidDepartment = "Invalid department selection";
      number = "number";
      phone = "phone";
      hr = "HR";
      finance = "Finance";
      operations = "Operations";
      it = "IT";
      sales = "Sales";
    } else if (languageCode == 'fr') {
      emptyField = "Ce champ ne peut pas être vide";
      invalidNumber = "Veuillez entrer un numéro valide";
      invalidPhoneNumber = "Le numéro de téléphone doit comporter 10 chiffres";
      emptyDepartment = "Veuillez sélectionner un département";
      invalidDepartment = "Sélection de département invalide";
      number = "numéro";
      phone = "téléphone";
      hr = "RH"; // Ressources Humaines
      finance = "Finances";
      operations = "Opérations";
      it = "Informatique";
      sales = "Ventes";
    }
  }
}
