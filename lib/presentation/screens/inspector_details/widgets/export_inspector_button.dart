import 'package:flutter/material.dart';
import '../constants/strings/export_inspector_button_strings.dart'; 

class ExportInspectorButtonWidget extends StatelessWidget {
  const ExportInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Export functionality
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: const Color(0xFF7E9A77),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(ExportInspectorButtonWidgetStrings.exportButtonText),
    );
  }
}
