class AddPVStrings {
  static String pageTitle = "";
  static String enterPVNumber = "";
  static String seeEODetails = "";
  static String addBusinessOffender = "";
  static String addIndividualOffender = "";
  static String selectPVDate = "";
  static String enterViolationType = "";
  static String noInspectorsFound = "";
  static String totalNonFactorizationAmount = "";
  static String totalIllegalProfit = "";
  static String enterSubsidizedGood = "";
  static String clear = "";
  static String save = "";
  static String pvSuccessfullyAdded = "";
  static String errorAddingPV = "";
  static String reqField = "";
  static String hideDetails = "";
  static String showDetails = "";
  static String selectOfficer = "";
  static String validNum = "";
  static String rcNum = "";
  static String nonFoundEO = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      pageTitle = "Add PV";
      enterPVNumber = "Enter PV Number";
      seeEODetails = "See EO Details";
      addBusinessOffender = "Add Business Offender";
      addIndividualOffender = "Add Individual Offender";
      selectPVDate = "Select PV Date";
      enterViolationType = "Enter Violation Type";
      noInspectorsFound = "No inspectors found";
      totalNonFactorizationAmount = "Total Non-Factorization Amount";
      totalIllegalProfit = "Total Illegal Profit";
      enterSubsidizedGood = "Enter Subsidized Good";
      clear = "Clear";
      save = "Save";
      pvSuccessfullyAdded = "PV successfully added!";
      errorAddingPV =
          "Oops! Something went wrong. Please check your input and try again.";
      reqField = "This field is required.";
      hideDetails = "Hide details";
      showDetails = "Show details";
      selectOfficer = "Select Officer 1";
      validNum = "Enter a valid number";
      rcNum = "Enter RC number";
      nonFoundEO = "Non-existing economic operator";
    } else if (languageCode == 'fr') {
      pageTitle = "Ajouter PV";
      enterPVNumber = "Entrer le numéro PV";
      seeEODetails = "Voir les détails EO";
      addBusinessOffender = "Ajouter un contrevenant commercial";
      addIndividualOffender = "Ajouter un contrevenant individuel";
      selectPVDate = "Sélectionner la date PV";
      enterViolationType = "Entrer le type de violation";
      noInspectorsFound = "Aucun inspecteur trouvé";
      totalNonFactorizationAmount = "Montant total de non-facturation";
      totalIllegalProfit = "Profit illégal total";
      enterSubsidizedGood = "Entrer le bien subventionné";
      clear = "Effacer";
      save = "Enregistrer";
      pvSuccessfullyAdded = "PV ajouté avec succès!";
      errorAddingPV =
          "Oups! Quelque chose s'est mal passé. Veuillez vérifier vos données et réessayer.";
      reqField = "Ce champ est obligatoire.";
      hideDetails = "Cacher les détails";
      showDetails = "Afficher les détails";
      selectOfficer = "Sélectionner l'officier 1";
      validNum = "Entrez un numéro valide";
      rcNum = "Entrez le numéro RC";
      nonFoundEO = "Opérateur économique non existant";
    }
  }
}
