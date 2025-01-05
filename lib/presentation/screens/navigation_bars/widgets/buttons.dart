import 'package:flutter/material.dart';
import '../constants/Strings/buttons.dart';  // Import the ButtonStrings class

Widget buttons({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onApply,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: onCancel,
        child: Text(
          ButtonStrings.cancel,  // Using ButtonStrings for the cancel text
          style: const TextStyle(color: Colors.black),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: onApply,
        child: Text(
          ButtonStrings.apply,  // Using ButtonStrings for the apply text
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}
