import 'package:flutter/material.dart';
import 'inspector_details.dart';

void main() {
  runApp(InspectorDetailsApp());
}

class InspectorDetailsApp extends StatelessWidget {
  const InspectorDetailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data to pass to the InspectorDetailsPage
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InspectorDetailsPage(
        inspectorName: 'John Doe', 
        inspectorSurname: 'Smith',
        inspectorDepartment: 'Department A',
        contactNumber: '123-456-7890',
      ),
    );
  }
}
