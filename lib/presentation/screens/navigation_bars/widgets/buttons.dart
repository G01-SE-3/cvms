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
          style: TextStyle(color: Colors.black),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: onApply,
        
        child: const Text(
          "Apply",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}
