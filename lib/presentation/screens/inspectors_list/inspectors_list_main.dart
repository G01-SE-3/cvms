import 'package:flutter/material.dart';
import 'inspectors_list.dart';

void main() {
  runApp(const InspectorListApp());
}

class InspectorListApp extends StatelessWidget {
  const InspectorListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: InspectorsListPage(),
    );
  }
}
