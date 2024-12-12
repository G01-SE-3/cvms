import 'package:flutter/material.dart';
import 'widgets/inspector_table.dart';
import 'widgets/add_inspector_button.dart';
import 'widgets/export_button.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';

class InspectorsListPage extends StatelessWidget {
  const InspectorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CVMSAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inspectors List',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ExportButton(),
                    SizedBox(width: 10),
                    AddInspectorButton(),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: InspectorTable(), // InspectorTable now scrolls vertically
              ),
            ),
          ],
        ),
      ),
    );
  }
}
