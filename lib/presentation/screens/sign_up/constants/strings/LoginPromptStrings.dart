class AccountCreationButtonStrings {
  static String createAccountButton = "";
  static String haveAccount = "";
  static String login = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      createAccountButton = 'Create account';
      haveAccount = 'Already have an account?';
      login = 'login';
    } else if (languageCode == 'fr') {
      createAccountButton = 'Créer un compte';
      haveAccount = 'Vous avez déjà un compte ?';
      login = 'connexion';
    }
  }
}
