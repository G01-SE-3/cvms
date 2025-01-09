class ChangesSavedDialogStrings {
  static String title = "";
  static String okButtonText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      title = "Changes Saved";
      okButtonText = "OK";
    } else if (languageCode == 'fr') {
      title = "Modifications Enregistrées";
      okButtonText = "OK";
    }
  }
}
