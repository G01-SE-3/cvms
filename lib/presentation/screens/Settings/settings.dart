/*
File Name: settings_page.dart
Purpose: This file defines the SettingsPage UI for the app. It serves as a navigation point for the user to access 
the settings menu and corresponding submenus.
Authors: 
- Team Member 1 [hiba.ayadi@ensia.edu.dz]


Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved.
*/

import 'package:flutter/material.dart';

import '../navigation_bars/GeneralAppBar.dart';
import '../navigation_bars/Sidebar.dart';
import 'widgets/SettingsMenu.dart';
import 'widgets/SettingsSubMenu.dart';

/// Represents the settings page of the app.
/// This page allows users to navigate through various settings options and their submenus.
/// 
/// Dependencies:
/// - [GeneralAppBar]: Custom app bar for the settings page.
/// - [Sidebar]: Drawer component for navigation.
/// - [SettingsMenu]: Displays the main settings options.
/// - [SettingsSubMenu]: Displays submenu options for a selected setting.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /// Stores the currently selected settings page option.
  String? _selectedPage;

  /// Updates the state with the newly selected settings page.
  /// 
  /// [page]: The identifier of the selected page.
  void _onPageSelected(String page) {
    setState(() {
      _selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Builds the UI for the SettingsPage.
    /// 
    /// Displays the [SettingsMenu] when no page is selected, and [SettingsSubMenu]
    /// when a specific page is selected.
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
