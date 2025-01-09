class ValidationStrings {
  static String startDateError = "";
  static String emptyFieldsError = "";
  static String emptyFieldError = "";
  static String invalidNumberError = "";
  static String searchInputNullError = "";
  static String invalidSearchInputError = "";
  static String noPVFoundTitle = "";
  static String noPVFoundMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      startDateError = 'Start date cannot be later than end date.';
      emptyFieldsError = 'Input fields cannot be empty.';
      emptyFieldError = 'This field cannot be empty.';
      invalidNumberError = 'Please enter a valid number.';
      searchInputNullError = "Search input can't be null.";
      invalidSearchInputError = "Invalid input.";
      noPVFoundTitle = 'No Results Found';
      noPVFoundMessage = 'No PV found for the given number.';
    } else if (languageCode == 'fr') {
      startDateError =
          'La date de début ne peut pas être postérieure à la date de fin.';
      emptyFieldsError = 'Les champs de saisie ne peuvent pas être vides.';
      emptyFieldError = 'Ce champ ne peut pas être vide.';
      invalidNumberError = 'Veuillez entrer un numéro valide.';
      searchInputNullError = "L'entrée de recherche ne peut pas être nulle.";
      invalidSearchInputError = "Entrée invalide.";
      noPVFoundTitle = 'Aucun résultat trouvé';
      noPVFoundMessage = 'Aucun PV trouvé pour le numéro donné.';
    }
  }
}
