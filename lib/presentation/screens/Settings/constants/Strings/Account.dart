class AccountStrings {
  static String Account = "";
  static String Username = "";
  static String Email = "";
  static String ChangePassword = "";
  static String CurrentPassword = "";
  static String NewPassword = "";
  static String ConfirmNewPassword = "";
  static String Cancel = "";
  static String Confirm = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      Account = "Account";
      Username = "Username";
      Email = "Email";
      ChangePassword = "Change Password";
      CurrentPassword = "Current Password";
      NewPassword = "New Password";
      ConfirmNewPassword = "Confirm New Password";
      Cancel = "Cancel";
      Confirm = "Confirm";
    } else if (languageCode == 'fr') {
      Account = "Compte";
      Username = "Nom d'utilisateur";
      Email = "Email";
      ChangePassword = "Changer le mot de passe";
      CurrentPassword = "Mot de passe actuel";
      NewPassword = "Nouveau mot de passe";
      ConfirmNewPassword = "Confirmer le nouveau mot de passe";
      Cancel = "Annuler";
      Confirm = "Confirmer";
    }
  }
}
