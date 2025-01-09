class Passwordfieldstrings {
  static String labelText = "";
  static String hintText = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      labelText = 'Password';
      hintText = 'Enter your password';
    } else if (languageCode == 'fr') {
      labelText = 'Mot de passe';
      hintText = 'Entrez votre mot de passe';
    }
  }
}
