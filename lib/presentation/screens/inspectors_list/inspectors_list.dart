import 'package:flutter/material.dart';
import 'widgets/inspector_table.dart';
import 'widgets/add_inspector_button_widget.dart';
import 'widgets/export_inspector_button_widget.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class InspectorsListPage extends StatelessWidget {
  const InspectorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Sidebar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.0), // Adjust height as needed
        child: GeneralAppBar(
            search: false, initialTabIndex: 2), // Set index for Inspectors
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Inspectors List',  
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ExportInspectorButtonWidget(),
                SizedBox(width: 10),
                AddInspectorButtonWidget(),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
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
