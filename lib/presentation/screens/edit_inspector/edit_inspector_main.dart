import 'package:flutter/material.dart';
import 'edit_inspector_page.dart';

void main() {
  runApp(const EditInspectorApp());
}

class EditInspectorApp extends StatelessWidget {
  const EditInspectorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditInspectorPage(
        inspectorNumber: '12345', 
        inspectorName: 'John',
        inspectorSurname: 'Doe',
        inspectorBadgeNumber: 'AB-9876',
        assignedDepartment: 'HR',
        contactNumber: '0123456789',
      ),
    );
  }
}
