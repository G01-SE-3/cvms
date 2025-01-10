import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';

// the app's routes
class AppRoutes {
  static const String pvs = '/pvs';
  static const String inspectors = '/inspectors';
  static const String businessOffender = '/business_offender';
  static const String individualOffender = '/individual_offender';

  // Method to get the routes
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      pvs: (context) => const PVListPage(),
      inspectors: (context) => const InspectorsListPage(),
      businessOffender: (context) => const BusinessOffenderList(),
      individualOffender: (context) => const IndividualOffenderList(),
    };
  }
}
