import 'package:flutter/material.dart';
import 'widgets/inspector_table.dart';
import 'widgets/add_inspector_button_widget.dart';
import 'widgets/export_inspector_button_widget.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';
import 'constants/strings/inspectors_list_strings.dart';

class InspectorsListPage extends StatelessWidget {
  const InspectorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          InspectorsListStrings.inspectorsListTitle,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          const ExportInspectorButtonWidget(),
          const SizedBox(width: 10),
          const AddInspectorButtonWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child:  InspectorTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
