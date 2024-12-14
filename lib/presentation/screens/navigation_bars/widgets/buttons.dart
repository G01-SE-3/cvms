import 'package:flutter/material.dart';

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
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.white),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: onApply,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Button color (optional)
        ),
        child: const Text(
          "Apply",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
