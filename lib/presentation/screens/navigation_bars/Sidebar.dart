import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/Sidebar.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';
import 'package:provider/provider.dart';

import '../HelpPage/HelpPage.dart';
import '../Settings/settings.dart';
import 'widgets/sidebar_item.dart';
/*
File Name: sidebar.dart
Purpose: This file defines the `Sidebar` widget, which displays a sidebar navigation menu for the app.
The sidebar includes top and bottom menu items for navigation, as well as a logout option that clears authentication data.
Authors: 
- Team Member 1 [hiba.ayadi@ensia.edu.dz]


Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  // Top menu items
  List<Widget> sidebarItemsTop(BuildContext context) {
    return [
      sidebar_item(
          context, Icons.dashboard, SidebarStrings.dashboard, const HomePage()),
      sidebar_item(context, Icons.description, SidebarStrings.pvList,
          const PVListPage()),
      sidebar_item(context, Icons.people, SidebarStrings.inspectors,
          const InspectorsListPage()),
      sidebar_item(context, Icons.person, SidebarStrings.businessOffender,
          const BusinessOffenderList()),
      sidebar_item(context, Icons.person, SidebarStrings.individualOffender,
          const IndividualOffenderList()),
    ];
  }

  // Bottom menu items
  List<Widget> sidebarItemsBottom(BuildContext context) {
    return [
      sidebar_item(
          context, Icons.help_outline, SidebarStrings.help, const HelpPage()),
      sidebar_item(context, Icons.settings, SidebarStrings.settings,
          const SettingsPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF4A4A31),
        child: Column(
          children: [
            const SizedBox(height: 50), // Space at the top of the sidebar
            // Top menu items
            Expanded(
              child: Column(
                children: sidebarItemsTop(context),
              ),
            ),
            // Bottom menu items and logout button
            Column(
              children: [
                ...sidebarItemsBottom(context),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    SidebarStrings.logout,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    // Call signOut from AuthService to clear authentication data
                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    await authService.signOut();

                    // Navigate to login screen and clear the navigation stack
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
