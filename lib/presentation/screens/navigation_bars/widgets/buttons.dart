import 'package:flutter/material.dart';

Widget buildActionButtons({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onApply,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: onCancel,
        child: const Text("Cancel"),
      ),
      const SizedBox(width: 10),
      ElevatedButton(
        onPressed: onApply,
        child: const Text("Apply"),
      ),
    ],
  );
}
