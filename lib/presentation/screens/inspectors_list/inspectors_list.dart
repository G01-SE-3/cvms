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
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
