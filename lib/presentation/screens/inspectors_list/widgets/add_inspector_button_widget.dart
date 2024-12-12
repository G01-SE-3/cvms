import 'package:flutter/material.dart';
import '../../add_inspector/add_inspector_page.dart';
import '../constants/strings/add_inspector_button_strings.dart'; 

class AddInspectorButtonWidget extends StatelessWidget {
  const AddInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        backgroundColor: const Color(0xFF6C845E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddInspectorPage()),
        );
      },
      icon: const Icon(Icons.add, color: Colors.white),
      label: Text(
        Strings.addNewInspector,  // Use the string from the Strings class
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
