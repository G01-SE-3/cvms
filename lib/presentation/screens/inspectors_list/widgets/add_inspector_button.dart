import 'package:flutter/material.dart';
import '../../add_inspector/add_inspector.dart';

class AddInspectorButton extends StatelessWidget {
  const AddInspectorButton({super.key});

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
          MaterialPageRoute(builder: (context) => const AddInspectorPage()),
        );
      },
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text(
        'Add New Inspector',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
