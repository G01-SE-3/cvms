class BusinessOffenderStrings {
  static String business_offender_information = "";
  static String business_name = "";
  static String commercial_register_number = "";
  static String commercial_register_date = "";
  static String register_number_details = "";
  static String edit_date = "";
  static String cancellation_date = "";
  static String name = "";
  static String surname = "";
  static String date_of_birth = "";
  static String place_of_birth = "";
  static String birth_certificate_number = "";
  static String mother_name = "";
  static String mother_surname = "";
  static String father_name = "";
  static String address = "";
  static String business_address = "";
  static String add_button = "";
  static String date_picker_icon_tooltip = "";
  static String commercial_register_number_empty_error = "";
  static String date_empty_error = "";
  static String register_number_validation = "";
  static String success = "";
  static String failed = "";
  static String form_offender = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      business_offender_information = "Business Offender Information";
      business_name = "Business Name";
      commercial_register_number = "Commercial Register Number";
      commercial_register_date = "Commercial Register Date";
      register_number_details = "Show Register Number Details";
      edit_date = "Edit Date";
      cancellation_date = "Cancellation Date";
      name = "Name";
      surname = "Surname";
      date_of_birth = "Date of Birth";
      place_of_birth = "Place of Birth";
      birth_certificate_number = "Birth Certificate Number";
      mother_name = "Mother's Name";
      mother_surname = "Mother's Surname";
      father_name = "Father's Name";
      address = "Address";
      business_address = "Business Address";
      add_button = "Add";
      date_picker_icon_tooltip = "Pick a date";
      commercial_register_number_empty_error =
          "Commercial Register Number cannot be empty";
      date_empty_error = "Date cannot be empty";
      register_number_validation =
          "Please enter a valid commercial register number";
      success = "Business Offender added successfully!";
      failed = "Failed to add offender";
      form_offender = "Business Offender Form";
    } else if (languageCode == 'fr') {
      business_offender_information =
          "Informations sur l'infracteur commercial";
      business_name = "Nom de l'entreprise";
      commercial_register_number = "Numéro de registre du commerce";
      commercial_register_date = "Date du registre du commerce";
      register_number_details = "Afficher les détails du numéro de registre";
      edit_date = "Modifier la date";
      cancellation_date = "Date d'annulation";
      name = "Nom";
      surname = "Prénom";
      date_of_birth = "Date de naissance";
      place_of_birth = "Lieu de naissance";
      birth_certificate_number = "Numéro de l'acte de naissance";
      mother_name = "Nom de la mère";
      mother_surname = "Prénom de la mère";
      father_name = "Nom du père";
      address = "Adresse";
      business_address = "Adresse de l'entreprise";
      add_button = "Ajouter";
      date_picker_icon_tooltip = "Choisir une date";
      commercial_register_number_empty_error =
          "Le numéro de registre du commerce ne peut pas être vide";
      date_empty_error = "La date ne peut pas être vide";
      register_number_validation =
          "Veuillez entrer un numéro de registre du commerce valide";
      success = "Infracteur commercial ajouté avec succès !";
      failed = "Échec de l'ajout de l'infracteur";
      form_offender = "Formulaire d'infracteur commercial";
    }
  }
}
