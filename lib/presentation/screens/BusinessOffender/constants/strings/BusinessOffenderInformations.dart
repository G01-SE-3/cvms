/*
File Name: <BusinessOffenderInformations.dart>
Purpose: <Defines string variables for storing business and personal information for an offender.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
class BusinessOffStrings {
  static String businessName = "";
  static String registerNumber = "";
  static String name = "";
  static String surname = "";
  static String birthInfo = "";
  static String birthCertificateNum = "";
  static String address = "";
  static String dateAndPlaceOfBirth = "";
  static String birthCertificateNumber = "";
  static String mothersNameAndSurname = "";
  static String motherName = "";
  static String fatherName = "";
  static String businessAddress = "";
  static String menu = "";
  static String export = "";
  static String addNewOffender = "";
  static String noOffendersFound = "";
  static String viewDetails = "";
  static String delete = "";
  static String confirmDelete = "";
  static String deleteConfirmationMessage = "";
  static String cancel = "";
  static String deleteAction = "";
  static String Error = "";
  static String loading = "";
  static String Edit = "";
  static String deleteBusinessOffender = "";
  static String noData = "";
  static String id = "";
  static String action = "";
  static String details = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      businessName = "Business Name";
      registerNumber = "Register Number";
      name = "Name";
      surname = "Surname";
      birthInfo = "YYYY-MM-DD";
      birthCertificateNum = "00000000000";
      address = "Address";
      dateAndPlaceOfBirth = "Date & Place of birth";
      birthCertificateNumber = "Birth Certificate num";
      mothersNameAndSurname = "Mother's name & Surname";
      motherName = "Mother Name";
      fatherName = "Father Name";
      businessAddress = "Business Address";
      menu = "Menu";
      export = "Export";
      addNewOffender = "Add New Offender";
      noOffendersFound = "No offenders found.";
      viewDetails = "View Details";
      delete = "Delete";
      confirmDelete = "Confirm Delete";
      deleteConfirmationMessage =
          "Are you sure you want to delete this record?";
      cancel = "Cancel";
      deleteAction = "Delete";
      Error = "Error fetching ";
      loading = "Loading...";
      Edit = "edit";
      deleteBusinessOffender = "delete";
      noData = "No offender found";
      id = "Business ID";
      action = "action";
      details = "view details";
    } else if (languageCode == 'fr') {
      businessName = "Nom de l'entreprise";
      registerNumber = "Numéro d'enregistrement";
      name = "Nom";
      surname = "Prénom";
      birthInfo = "AAAA-MM-JJ";
      birthCertificateNum = "00000000000";
      address = "Adresse";
      dateAndPlaceOfBirth = "Date et lieu de naissance";
      birthCertificateNumber = "Numéro de certificat de naissance";
      mothersNameAndSurname = "Nom et prénom de la mère";
      motherName = "Nom de la mère";
      fatherName = "Nom du père";
      businessAddress = "Adresse de l'entreprise";
      menu = "Menu";
      export = "Exporter";
      addNewOffender = "Ajouter un nouvel infracteur";
      noOffendersFound = "Aucun infracteur trouvé.";
      viewDetails = "Voir les détails";
      delete = "Supprimer";
      confirmDelete = "Confirmer la suppression";
      deleteConfirmationMessage =
          "Êtes-vous sûr de vouloir supprimer cet enregistrement ?";
      cancel = "Annuler";
      deleteAction = "Supprimer";
      Error = "Erreur lors de la récupération ";
      loading = "Chargement...";
      Edit = "modifier";
      deleteBusinessOffender = "supprimer";
      noData = "Aucun infracteur trouvé";
      id = "ID de l'entreprise";
      action = "action";
      details = "voir les détails";
    }
  }
}
