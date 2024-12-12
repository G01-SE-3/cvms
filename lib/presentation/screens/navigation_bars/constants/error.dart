import 'package:flutter/material.dart';

Widget buildErrorText(String? errorText) {
  if (errorText != null) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        errorText,
        style: const TextStyle(color: Colors.red),
      ),
    );
  } else {
    return const SizedBox.shrink(); // Return an empty space if there's no error
  }
}
