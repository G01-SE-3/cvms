import 'package:cvms/presentation/screens/Settings/constants/Strings/SettingsMenu.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/Settings/widgets/ListTile.dart';
class SettingsMenu extends StatelessWidget {
  final String? pageSelected;
  final Function(String) onPageSelected;

  const SettingsMenu({super.key, this.pageSelected, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Listtile(
          icon: Icons.person,
          title: SettingsMenuStrings.Account,
          isSelected: pageSelected == SettingsMenuStrings.Account,
          onTap: () {
            onPageSelected(SettingsMenuStrings.Account);
          },
        ),
        const Divider(),
        Listtile(
          icon: Icons.language,
          title: SettingsMenuStrings.ChangeLanguage,
          isSelected: pageSelected == SettingsMenuStrings.ChangeLanguage,
          onTap: () {
            onPageSelected(SettingsMenuStrings.ChangeLanguage);
          },
        ),
        const Divider(),
        Listtile(
          icon: Icons.logout,
          title: SettingsMenuStrings.Logout,
          isSelected: pageSelected == SettingsMenuStrings.Logout,
          onTap: () {
            onPageSelected(SettingsMenuStrings.Logout);
          },
        ),
      ],
    );
  }
}