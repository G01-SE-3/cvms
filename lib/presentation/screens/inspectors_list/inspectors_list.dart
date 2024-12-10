import 'package:flutter/material.dart';
import 'widgets/inspector_table.dart';
import 'widgets/add_inspector_button.dart';
import 'widgets/export_button.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';

class InspectorsListPage extends StatelessWidget {
  const InspectorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0), // Adjust height as needed
        child: const CVMSAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Inspectors List',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const ExportButton(),
                    const SizedBox(width: 10),
                    const AddInspectorButton(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
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
