import 'package:cvms/presentation/screens/Settings/constants/Strings/SettingsMenu.dart';
import 'package:cvms/presentation/screens/Settings/settings.dart';
import 'package:cvms/presentation/screens/Settings/widgets/Account.dart';
import 'package:cvms/presentation/screens/Settings/widgets/Languages.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String? page;

  const PageContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case SettingsMenuStrings.Account:
        return const Account();
      case SettingsMenuStrings.ChangeLanguage:
        return const LanguagesPage();
      
      default:
        return const SettingsPage();
    }
    
  }
}
