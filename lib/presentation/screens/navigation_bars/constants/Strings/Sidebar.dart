import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/HelpPage/helppage.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/Settings/settings.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/sidebar_item.dart';

List<Widget> sidebarItemsTop(BuildContext context) {
  return [
    sidebar_item(context, Icons.dashboard, 'Dashboard', const HomePage()),
    sidebar_item(context, Icons.description, 'PVs', const PVListPage()),
    sidebar_item(context, Icons.people, 'Inspectors',const InspectorsListPage()),
    sidebar_item(
        context, Icons.person, 'Buisness Offender', const BusinessOffenderList()),
    sidebar_item(
        context, Icons.person, 'Individual Offender', const IndividualOffenderList()),
  ];
}

// Bottom menu items
List<Widget> sidebarItemsBottom(BuildContext context) {
  return [
    sidebar_item(context, Icons.help_outline, 'Help', const HelpPage()),
    sidebar_item(context, Icons.settings, 'Settings', const SettingsPage()),
  ];
}
