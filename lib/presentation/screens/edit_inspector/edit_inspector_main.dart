import 'package:flutter/material.dart';
import 'edit_inspector.dart';

void main() {
  runApp(const EditInspectorApp());
}

class EditInspectorApp extends StatelessWidget {
  const EditInspectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
