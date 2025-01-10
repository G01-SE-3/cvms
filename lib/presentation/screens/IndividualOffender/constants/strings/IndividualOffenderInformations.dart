/*
File Name: <IndividualOffenderInformations.dart>
Purpose: <Defines string variables for storing individual and personal information for an offender.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
class IndividualDetailsStrings {
  static String Name = "";
  static String RegisterNumber = "";
  static String Surname = "";
  static String birthInfo = "";
  static String BirthCertificatenum = "";
  static String Address = "";
  static String DateandPlaceofbirth = "";
  static String BirthCertificatenumber = "";
  static String MothersnameandSurname = "";
  static String FatherName = "";
  static String BusinessAddress = "";
  static String Menu = "";
  static String Error = "";
  static String edit = "";
  static String loading = "";
  static String cancel = "";
  static String delete = "";
  static String confirmDelete = "";
  static String confirmDeleteRecord = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      Name = "Name";
      RegisterNumber = "Commercial Register Number";
      Surname = "Surname";
      birthInfo = "YYYY-MM-DD";
      BirthCertificatenum = "00000000000";
      Address = "Address";
      DateandPlaceofbirth = "Date & Place of birth";
      BirthCertificatenumber = "Birth Certificate num";
      MothersnameandSurname = "Mother's name & Surname";
      FatherName = "Father Name";
      BusinessAddress = "Business Address";
      Menu = "Menu";
      Error = "Error during fetching";
      edit = "Edit";
      loading = "loading ..";
      cancel = "cancel";
      delete = "Delete";
      confirmDelete = "confirm Delete";
      confirmDeleteRecord = "Are you sure you want to delete this record?";
    } else if (languageCode == 'fr') {
      Name = "Nom";
      RegisterNumber = "Numéro de registre du commerce";
      Surname = "Prénom";
      birthInfo = "AAAA-MM-JJ";
      BirthCertificatenum = "00000000000";
      Address = "Adresse";
      DateandPlaceofbirth = "Date et lieu de naissance";
      BirthCertificatenumber = "Numéro de certificat de naissance";
      MothersnameandSurname = "Nom et prénom de la mère";
      FatherName = "Nom du père";
      BusinessAddress = "Adresse de l'entreprise";
      Menu = "Menu";
      Error = "Erreur lors de la récupération";
      edit = "Modifier";
      loading = "Chargement...";
      cancel = "Annuler";
      delete = "Supprimer";
      confirmDelete = "Confirmer la suppression";
      confirmDeleteRecord =
          "Êtes-vous sûr de vouloir supprimer cet enregistrement ?";
    }
  }
}
