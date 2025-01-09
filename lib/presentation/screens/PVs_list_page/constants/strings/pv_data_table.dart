class PVDetailsLabels {
  static String pvNumberLabel = "";
  static String offenderRCLabel = "";
  static String offenderNameLabel = "";
  static String pvIssueDateLabel = "";
  static String violationTypeLabel = "";
  static String inspectingOfficersLabel = "";
  static String editLabel = "";
  static String deleteLabel = "";
  static String deleteDialogTitle = "";
  static String deleteDialogContent = "";
  static String cancelLabel = "";
  static String deleteLabelDialog = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      pvNumberLabel = 'PV Number';
      offenderRCLabel = 'Offender RC number';
      offenderNameLabel = 'Offender Name';
      pvIssueDateLabel = 'PV Issue Date';
      violationTypeLabel = 'Violation Type';
      inspectingOfficersLabel = 'Inspecting Officers';
      editLabel = 'Edit';
      deleteLabel = 'Delete';
      deleteDialogTitle = 'Delete PV';
      deleteDialogContent = 'Are you sure you want to delete this PV?';
      cancelLabel = 'Cancel';
      deleteLabelDialog = 'Delete';
    } else if (languageCode == 'fr') {
      pvNumberLabel = 'Numéro de PV';
      offenderRCLabel = 'Numéro RC du contrevenant';
      offenderNameLabel = 'Nom du contrevenant';
      pvIssueDateLabel = 'Date d\'émission du PV';
      violationTypeLabel = 'Type de violation';
      inspectingOfficersLabel = 'Agents inspecteurs';
      editLabel = 'Modifier';
      deleteLabel = 'Supprimer';
      deleteDialogTitle = 'Supprimer le PV';
      deleteDialogContent = 'Êtes-vous sûr de vouloir supprimer ce PV ?';
      cancelLabel = 'Annuler';
      deleteLabelDialog = 'Supprimer';
    }
  }
}
