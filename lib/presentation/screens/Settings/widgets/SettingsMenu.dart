import 'package:cvms/presentation/screens/Settings/constants/Strings/SettingsMenu.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/Settings/widgets/ListTile.dart';
import 'package:provider/provider.dart';

import '../../../../services/auth_service.dart';

class SettingsMenu extends StatelessWidget {
  final String? pageSelected;
  final Function(String) onPageSelected;

  const SettingsMenu({super.key, this.pageSelected, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Account section
        Listtile(
          icon: Icons.person,
          title: SettingsMenuStrings.Account,
          isSelected: pageSelected == SettingsMenuStrings.Account,
          onTap: () {
            onPageSelected(SettingsMenuStrings.Account); // Navigate to Account page
          },
        ),
        const Divider(),

        // Language section
        Listtile(
          icon: Icons.language,
          title: SettingsMenuStrings.ChangeLanguage,
          isSelected: pageSelected == SettingsMenuStrings.ChangeLanguage,
          onTap: () {
            onPageSelected(SettingsMenuStrings.ChangeLanguage); // Navigate to Language page
          },
        ),
        const Divider(),

        // Logout section
        Listtile(
          icon: Icons.logout,
          title: SettingsMenuStrings.Logout,
          isSelected: pageSelected == SettingsMenuStrings.Logout,
          onTap: () async {
            // Sign out the user using AuthService
            final authService = Provider.of<AuthService>(context, listen: false);
            await authService.signOut();

            // Navigate to Login page and clear the navigation stack
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false, // Removes all previous routes from the stack
            );
          },
        ),
      ],
    );
  }
}
