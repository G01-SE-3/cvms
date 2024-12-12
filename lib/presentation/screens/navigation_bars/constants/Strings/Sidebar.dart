import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation bars/widgets/sidebar_item.dart';




List<Widget> sidebarItemsTop(BuildContext context) {
  return [
    sidebar_item(context, Icons.dashboard, 'Dashboard', '/dashboard'),
    sidebar_item(context, Icons.description, 'PVs', '/pvs'),
    sidebar_item(context, Icons.people, 'Inspectors', '/inspectors'),
    sidebar_item(context, Icons.person, 'Economic Operators', '/economic_operators'),
  ];
}

// Bottom menu items
List<Widget> sidebarItemsBottom(BuildContext context) {
  return [
    sidebar_item(context, Icons.help_outline, 'Help', '/help'),
    sidebar_item(context, Icons.settings, 'Settings', '/settings'),
  ];
}