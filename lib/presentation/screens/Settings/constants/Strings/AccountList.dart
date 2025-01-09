class ListWidgetStrings {
  static String username = "";
  static String email = "";
  static String password = "";
  static String hiddenPassword = "";
  static String editButtonText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      username = "Username";
      email = "Email";
      password = "Password";
      hiddenPassword = "********";
      editButtonText = "Edit";
    } else if (languageCode == 'fr') {
      username = "Nom d'utilisateur";
      email = "Email";
      password = "Mot de passe";
      hiddenPassword = "********";
      editButtonText = "Modifier";
    }
  }
}
