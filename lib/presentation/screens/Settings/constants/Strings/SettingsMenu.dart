class SettingsMenuStrings {
  static String Account = "";
  static String ChangeLanguage = "";
  static String Logout = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      Account = "Account";
      ChangeLanguage = "Change Language";
      Logout = "Logout";
    } else if (languageCode == 'fr') {
      Account = "Compte";
      ChangeLanguage = "Changer de langue";
      Logout = "Se déconnecter";
    }
  }
}
