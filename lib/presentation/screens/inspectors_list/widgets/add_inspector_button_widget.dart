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
      onPressed: () async {
        // Use Navigator.push to open AddInspectorPage and get result
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddInspectorPage()),
        );

        // If result is true, trigger your list refresh or update logic
        if (result == true) {
          // Your logic to refresh or update the list goes here
          // For example:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Inspector added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text(
        Strings.addNewInspector,  // Use the string from the Strings class
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
