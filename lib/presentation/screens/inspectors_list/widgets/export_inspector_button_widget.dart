import 'package:flutter/material.dart';
import '../constants/strings/export_inspector_button_strings.dart';  // Import the AppStrings class

class ExportInspectorButtonWidget extends StatelessWidget {
  const ExportInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ExportInspectorButtonStrings.exportFeatureComingSoon)),  // Use the string from AppStrings
        );
      },
      icon: const Icon(Icons.download, color: Colors.black),
      label: Text(
        ExportInspectorButtonStrings.export,  // Use the string from AppStrings
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
