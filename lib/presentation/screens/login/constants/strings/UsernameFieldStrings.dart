class Usernamefieldstrings {
  static String labelText = "";
  static String hintText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      labelText = 'User name';
      hintText = 'Enter your user name';
    } else if (languageCode == 'fr') {
      labelText = 'Nom d’utilisateur';
      hintText = 'Entrez votre nom d’utilisateur';
    }
  }
}
