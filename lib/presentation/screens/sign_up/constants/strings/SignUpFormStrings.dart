class SignUpFormStrings {
  static String createAccount = "";
  static String usernameLabel = "";
  static String usernameHint = "";
  static String emailLabel = "";
  static String emailHint = "";
  static String passwordLabel = "";
  static String passwordHint = "";
  static String confirmPasswordLabel = "";
  static String confirmPasswordHint = "";
  static String passwordsDoNotMatch = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      createAccount = 'Create an account';
      usernameLabel = 'Username';
      usernameHint = 'Enter your username';
      emailLabel = 'Email';
      emailHint = 'Enter your email';
      passwordLabel = 'Password';
      passwordHint = 'Enter your password';
      confirmPasswordLabel = 'Confirm Password';
      confirmPasswordHint = 'Confirm your password';
      passwordsDoNotMatch = 'Passwords do not match';
    } else if (languageCode == 'fr') {
      createAccount = 'Créer un compte';
      usernameLabel = 'Nom d’utilisateur';
      usernameHint = 'Entrez votre nom d’utilisateur';
      emailLabel = 'Email';
      emailHint = 'Entrez votre email';
      passwordLabel = 'Mot de passe';
      passwordHint = 'Entrez votre mot de passe';
      confirmPasswordLabel = 'Confirmer le mot de passe';
      confirmPasswordHint = 'Confirmez votre mot de passe';
      passwordsDoNotMatch = 'Les mots de passe ne correspondent pas';
    }
  }
}
