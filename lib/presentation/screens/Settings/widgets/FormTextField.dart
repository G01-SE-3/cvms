import 'package:flutter/material.dart';

Widget FormTextField({
    required TextEditingController controller,
    required String label,
    String? errorText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
      ),
    );
  }