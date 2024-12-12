import 'package:flutter/material.dart';
import 'inspectors_list.dart';

void main() {
  runApp(const InspectorListApp());
}

class InspectorListApp extends StatelessWidget {
  const InspectorListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: const InspectorsListPage(),
    );
  }
}
