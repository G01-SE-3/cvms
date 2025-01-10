import 'package:cvms/presentation/screens/Settings/constants/Strings/SettingsMenu.dart';
import 'package:cvms/presentation/screens/Settings/settings.dart';
import 'package:cvms/presentation/screens/Settings/widgets/Account.dart';
import 'package:cvms/presentation/screens/Settings/widgets/Languages.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String? page;

  const PageContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    // Based on the page argument, navigate to the corresponding screen.
    if (page == SettingsMenuStrings.Account) {
      return const Account(); // Account page
    } else if (page == SettingsMenuStrings.ChangeLanguage) {
      return const LanguagesPage(); // Language change page
    } else if (page == SettingsMenuStrings.Logout) {
      // Log out and navigate back to the homepage.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
      return Container(); // Empty container while redirecting
    } else {
      return const SettingsPage(); // Default settings page
    }
  }
}
