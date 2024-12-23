import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(), 
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: GeneralAppBar(search: false),
      ),
      body: Center(
        child: Text(
          'Settings Page Placeholder',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
