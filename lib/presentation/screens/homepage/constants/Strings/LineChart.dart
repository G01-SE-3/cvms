class LineChartStrings {
  static String noDataAvailable = "";
  static String january = "";
  static String february = "";
  static String march = "";
  static String april = "";
  static String may = "";
  static String june = "";
  static String july = "";
  static String august = "";
  static String september = "";
  static String october = "";
  static String november = "";
  static String december = "";

  /// Load strings dynamically based on the selected language
  static void loadLanguage(String languageCode) {
    if (languageCode == 'en') {
      noDataAvailable = "No data available for the chart";
      january = 'Jan';
      february = 'Feb';
      march = 'Mar';
      april = 'Apr';
      may = 'May';
      june = 'Jun';
      july = 'Jul';
      august = 'Aug';
      september = 'Sep';
      october = 'Oct';
      november = 'Nov';
      december = 'Dec';
    } else if (languageCode == 'fr') {
      noDataAvailable = "Aucune donnée disponible pour le graphique";
      january = 'Janv';
      february = 'Févr';
      march = 'Mars';
      april = 'Avr';
      may = 'Mai';
      june = 'Juin';
      july = 'Juil';
      august = 'Août';
      september = 'Sept';
      october = 'Oct';
      november = 'Nov';
      december = 'Déc';
    }
  }
}
