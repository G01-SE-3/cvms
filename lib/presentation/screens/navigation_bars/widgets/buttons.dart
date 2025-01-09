import 'package:flutter/material.dart';
import '../constants/Strings/buttons.dart'; // Import the ButtonStrings class

/// General rule for using `buttons` widget:
///
/// To include this `buttons` widget in your code:
/// 1. Pass the `context`, `onCancel` and `onApply` callbacks to the widget.
/// 2. `onCancel` and `onApply` are functions that will be triggered when the respective buttons are pressed.
/// 3. You can customize the look and behavior based on your specific needs.
///
/// Example usage:
/// ```dart
/// buttons(
///   context: context,
///   onCancel: () {
///     // Handle cancel action
///   },
///   onApply: () {
///     // Handle apply action
///   },
/// ),
/// ```
Widget buttons({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onApply,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
    children: [
      TextButton(
        onPressed:
            onCancel, // Execute onCancel when the Cancel button is pressed
        child: Text(
          ButtonStrings.cancel,
          style: TextStyle(color: Colors.black),
        ),
      ),
      const SizedBox(width: 10), // Space between the buttons
      ElevatedButton(
        onPressed: onApply, // Execute onApply when the Apply button is pressed
        child: Text(
          ButtonStrings.apply,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}
