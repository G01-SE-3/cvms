import 'package:flutter/material.dart';
import '../constants/strings/delete_inspector_button_strings.dart';  
class DeleteInspectorButtonWidget extends StatelessWidget {
  const DeleteInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Delete functionality
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFFCF4CF),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(DeleteInspectorButtonWidgetStrings.deleteButtonText),
    );
  }
}
