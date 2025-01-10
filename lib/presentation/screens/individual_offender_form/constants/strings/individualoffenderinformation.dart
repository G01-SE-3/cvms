/*
File Name: <individualoffenderinformation.dart>
Purpose: <Defines variables for storing individual and personal offender information.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
class IndividualOffenderStrings {
  static String name = "";
  static String surname = "";
  static String commercialRegisterNumber = "";
  static String commercialRegisterDate = "";
  static String editDate = "";
  static String cancellationDate = "";
  static String dateOfBirth = "";
  static String placeOfBirth = "";
  static String birthCertificateNumber = "";
  static String motherName = "";
  static String motherSurname = "";
  static String fatherName = "";
  static String address = "";
  static String businessAddress = "";
  static String showRegisterNumberDetails = "";
  static String addButtonText = "";
  static String validationErrorEmptyField = "";
  static String validationError = "";
  static String successMessage = "";
  static String failureMessage = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      name = "Name";
      surname = "Surname";
      commercialRegisterNumber = "Commercial Register Number";
      commercialRegisterDate = "Commercial Register Date";
      editDate = "Edit Date";
      cancellationDate = "Cancellation Date";
      dateOfBirth = "Date of Birth";
      placeOfBirth = "Place of Birth";
      birthCertificateNumber = "Birth Certificate Number";
      motherName = "Mother's Name";
      motherSurname = "Mother's Surname";
      fatherName = "Father's Name";
      address = "Address";
      businessAddress = "Business Address";
      showRegisterNumberDetails = "Show register number details";
      addButtonText = "Add";
      validationErrorEmptyField = "This field cannot be empty.";
      validationError = "Please enter a valid commercial register number";
      successMessage = "Individual Offender added successfully!";
      failureMessage = "Failed to add offender";
    } else if (languageCode == 'fr') {
      name = "Nom";
      surname = "Prénom";
      commercialRegisterNumber = "Numéro de registre du commerce";
      commercialRegisterDate = "Date du registre du commerce";
      editDate = "Modifier la date";
      cancellationDate = "Date d'annulation";
      dateOfBirth = "Date de naissance";
      placeOfBirth = "Lieu de naissance";
      birthCertificateNumber = "Numéro de l'acte de naissance";
      motherName = "Nom de la mère";
      motherSurname = "Prénom de la mère";
      fatherName = "Nom du père";
      address = "Adresse";
      businessAddress = "Adresse de l'entreprise";
      showRegisterNumberDetails = "Afficher les détails du numéro de registre";
      addButtonText = "Ajouter";
      validationErrorEmptyField = "Ce champ ne peut pas être vide.";
      validationError =
          "Veuillez entrer un numéro de registre du commerce valide";
      successMessage = "Infracteur individuel ajouté avec succès !";
      failureMessage = "Échec de l'ajout de l'infracteur";
    }
  }
}
