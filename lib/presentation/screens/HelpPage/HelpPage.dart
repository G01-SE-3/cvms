import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:flutter/material.dart';

import '../navigation_bars/Sidebar.dart';

class HelpPage extends StatelessWidget {
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
          'Help Page Placeholder',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
