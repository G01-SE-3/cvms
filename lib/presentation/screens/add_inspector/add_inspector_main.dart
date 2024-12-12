import 'package:flutter/material.dart';
import 'add_inspector_page.dart';

void main() {
  runApp(const AddInspectorApp());
}

class AddInspectorApp extends StatelessWidget {
  const AddInspectorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Inspector',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AddInspectorPage(),
    );
  }
}
