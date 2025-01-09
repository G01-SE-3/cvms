import 'package:flutter/material.dart';
import '../constants/strings/export_inspector_button_strings.dart';  // Import the AppStrings class

class ExportInspectorButtonWidget extends StatelessWidget {
  const ExportInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ExportInspectorButtonStrings.exportFeatureComingSoon)),  // Use the string from AppStrings
        );
      },
      icon: const Icon(
        Icons.file_download,
        size: 20,
        color: Color(0xFF344054),  // Dark icon color
      ),
      label: Text(
        ExportInspectorButtonStrings.export,  // Use the string from AppStrings
        style: const TextStyle(
          color: Color(0xFF545837),  // Dark grey color
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color(0xFF545837),  // Dark grey border
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(160, 48),
        alignment: Alignment.center,
      ),
    );
  }
}
