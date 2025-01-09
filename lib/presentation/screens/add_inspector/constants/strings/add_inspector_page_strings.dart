import 'package:shared_preferences/shared_preferences.dart';

class AddInspectorPageStrings {
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
      title = "Add an Inspector";
      inspectorNumberHint = "Inspector number";
      inspectorNameHint = "Inspector Name";
      inspectorSurnameHint = "Inspector Surname";
      inspectorBadgeNumberHint = "Inspector Badge Number";
      contactNumberHint = "Contact Number";
      cancelButton = "Cancel";
      saveButton = "Add";
      inspectorAddedMessage = "Inspector added";
      inspectorDefaultDepartment = "HR";
      message = "";
    } else if (languageCode == 'fr') {
      title = "Ajouter un Inspecteur";
      inspectorNumberHint = "Numéro d'inspecteur";
      inspectorNameHint = "Nom de l'inspecteur";
      inspectorSurnameHint = "Prénom de l'inspecteur";
      inspectorBadgeNumberHint = "Numéro de badge de l'inspecteur";
      contactNumberHint = "Numéro de contact";
      cancelButton = "Annuler";
      saveButton = "Ajouter";
      inspectorAddedMessage = "Inspecteur ajouté";
      inspectorDefaultDepartment = "RH";
      message = "";
    }
  }
}
