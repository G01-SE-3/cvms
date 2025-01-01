import 'package:flutter/material.dart';

import '../navigation_bars/GeneralAppBar.dart';
import '../navigation_bars/Sidebar.dart';
import 'widgets/SettingsMenu.dart';
import 'widgets/SettingsSubMenu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  String? _selectedPage;

  void _onPageSelected(String page) {
    setState(() {
      _selectedPage = page;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: GeneralAppBar(search: false),
      ),
      body: _selectedPage == null
          ? SettingsMenu(
              pageSelected: _selectedPage,
              onPageSelected: _onPageSelected,
            )
          : SettingsSubMenu(
              pageSelected: _selectedPage,
              onPageSelected: _onPageSelected,
            ),
      
    );
  }
}


