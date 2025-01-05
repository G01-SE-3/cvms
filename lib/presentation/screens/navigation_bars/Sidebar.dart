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
import 'widgets/sidebar_item.dart'; // Import for accessing AuthService

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  List<Widget> sidebarItemsTop(BuildContext context) {
    return [
      sidebar_item(context, Icons.dashboard, SidebarStrings.dashboard, const HomePage()),
      sidebar_item(context, Icons.description, SidebarStrings.pvList, const PVListPage()),
      sidebar_item(context, Icons.people, SidebarStrings.inspectors, const InspectorsListPage()),
      sidebar_item(context, Icons.person, SidebarStrings.businessOffender, const BusinessOffenderList()),
      sidebar_item(context, Icons.person, SidebarStrings.individualOffender, const IndividualOffenderList()),
    ];
  }

  // Bottom menu items
  List<Widget> sidebarItemsBottom(BuildContext context) {
    return [
      sidebar_item(context, Icons.help_outline, SidebarStrings.help, const HelpPage()),
      sidebar_item(context, Icons.settings, SidebarStrings.settings, const SettingsPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF4A4A31), // Background color
        child: Column(
          children: [
            // Top space
            const SizedBox(height: 50),
            // Top menu items
            Expanded(
              child: Column(
                children: sidebarItemsTop(context),
              ),
            ),
            // Bottom menu items
            Column(
              children: [
                ...sidebarItemsBottom(context),
                // Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    SidebarStrings.logout,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    // Call signOut from AuthService to clear authentication data
                    final authService = Provider.of<AuthService>(context, listen: false);
                    await authService.signOut();

                    // Navigate to login screen and clear the navigation stack
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
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
