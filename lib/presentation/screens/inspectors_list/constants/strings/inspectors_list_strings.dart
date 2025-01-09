class InspectorsListStrings {
  static String inspectorsListTitle = "";
  static String edit = "";
  static String delete = "";
  static String cancel = "";
  static String deleteInspector = "";
  static String areYouSureDelete = "";
  static String export = "";
  static String addInspector = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      inspectorsListTitle = "Inspectors List";
      edit = "Edit";
      delete = "Delete";
      cancel = "Cancel";
      deleteInspector = "Delete Inspector";
      areYouSureDelete = "Are you sure you want to delete this inspector?";
      export = "Export";
      addInspector = "Add Inspector";
    } else if (languageCode == 'fr') {
      inspectorsListTitle = "Liste des Inspecteurs";
      edit = "Modifier";
      delete = "Supprimer";
      cancel = "Annuler";
      deleteInspector = "Supprimer l'Inspecteur";
      areYouSureDelete = "Êtes-vous sûr de vouloir supprimer cet inspecteur ?";
      export = "Exporter";
      addInspector = "Ajouter un Inspecteur";
    }
  }
}
