class DeleteInspectorButtonStrings {
  static String deleteInspector = "";
  static String areYouSureDelete = "";
  static String cancel = "";
  static String delete = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      deleteInspector = "Delete Inspector";
      areYouSureDelete = "Are you sure you want to delete this inspector?";
      cancel = "Cancel";
      delete = "Delete";
    } else if (languageCode == 'fr') {
      deleteInspector = "Supprimer l'Inspecteur";
      areYouSureDelete = "Êtes-vous sûr de vouloir supprimer cet inspecteur ?";
      cancel = "Annuler";
      delete = "Supprimer";
    }
  }
}
