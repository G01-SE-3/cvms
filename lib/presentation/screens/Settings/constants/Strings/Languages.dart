class LanguagesStrings {
  static String English = "";
  static String Languages = "";
  static String Arabic = "";
  static String French = "";
  static String SaveChanges = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      English = "English";
      Languages = "Languages";
      Arabic = "Arabic";
      French = "French";
      SaveChanges = "Save Changes";
    } else if (languageCode == 'fr') {
      English = "Anglais";
      Languages = "Langues";
      Arabic = "Arabe";
      French = "Français";
      SaveChanges = "Sauvegarder les modifications";
    }
  }
}
