class SignUpPageStrings {
  static String usernameRequired = '';
  static String usernameExists = '';
  static String emailRequired = '';
  static String emailInvalid = '';
  static String passwordRequired = '';
  static String passwordTooShort = '';
  static String usernamExample = '';
  static String passwordStrength = '';
  static String validatedForm = '';
  static String notValidatedForm = '';
  static String signUpFailed = '';

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      usernameRequired = 'Username is required.';
      usernameExists = 'Username already exists';
      emailRequired = 'Email is required.';
      emailInvalid = 'Invalid email format.';
      passwordRequired = 'Password is required.';
      passwordTooShort = 'Password must be at least 6 characters.';
      usernamExample = 'user';
      passwordStrength =
          'Password must contain at least one uppercase letter and one special character/number.';
      validatedForm = 'Form is valid, submitting data.';
      notValidatedForm = 'Form is invalid, please check your information';
      signUpFailed = 'Unexpected error occurred, please try again later';
    } else if (languageCode == 'fr') {
      usernameRequired = 'Le nom d’utilisateur est requis.';
      usernameExists = 'Le nom d’utilisateur existe déjà';
      emailRequired = 'L’email est requis.';
      emailInvalid = 'Format d’email invalide.';
      passwordRequired = 'Le mot de passe est requis.';
      passwordTooShort = 'Le mot de passe doit contenir au moins 6 caractères.';
      usernamExample = 'utilisateur';
      passwordStrength =
          'Le mot de passe doit contenir au moins une lettre majuscule et un caractère spécial/un nombre.';
      validatedForm = 'Le formulaire est valide, envoi des données.';
      notValidatedForm =
          'Le formulaire est invalide, veuillez vérifier vos informations';
      signUpFailed = 'Erreur inattendue, veuillez réessayer plus tard';
    }
  }
}
