/*
File Name: inspectors_list_page.dart
Purpose: Displays a list of inspectors with options to add new inspectors or export the list of inspectors. 
         Includes a sidebar for navigation and a customized app bar.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/



import 'package:flutter/material.dart';
import 'widgets/inspector_table.dart';
import 'widgets/add_inspector_button_widget.dart';
import 'widgets/export_inspector_button_widget.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';



/// Represents the page that displays a list of inspectors.
/// This screen shows a table of inspectors and provides options to add new inspectors 
/// or export the list of inspectors. The page includes an app bar with navigation options 
/// and a sidebar menu for additional navigation.
/// 
/// Dependencies:
/// - [GeneralAppBar] for the app's header and navigation bar.
/// - [Sidebar] for providing side navigation options.
/// - [InspectorTable] for displaying a list of inspectors in a tabular format.
/// - [AddInspectorButtonWidget] and [ExportInspectorButtonWidget] for adding new inspectors 
///   or exporting the inspectors' data.
/// 
/// Features:
/// - Displays a list of inspectors with options to add or export data.
/// - Includes a sidebar for navigation and a customized app bar for the current page.
/// - The inspector list is scrollable and displayed inside a table format.




class InspectorsListPage extends StatelessWidget {
  const InspectorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0), // Adjust height as needed
        child: GeneralAppBar(
            search: false, initialTabIndex: 2), // Set index for Inspectors
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Inspectors List',  
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const ExportInspectorButtonWidget(),
                const SizedBox(width: 10),
                const AddInspectorButtonWidget(),
              ],
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: SingleChildScrollView(
                child: InspectorTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
