import 'package:flutter/material.dart';
import 'add_inspector.dart';

void main() {
  runApp(const AddInspectorApp());
}

class AddInspectorApp extends StatelessWidget {
  const AddInspectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Inspector',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AddInspectorPage(),
    );
  }
}
