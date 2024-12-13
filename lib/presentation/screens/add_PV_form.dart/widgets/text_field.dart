import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final bool isNumeric;
  final bool isRequired;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.placeholder,
    this.isNumeric = false,
    this.isRequired = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFDDE5CD),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Color(0xFF545837)),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        // If the field is required, check for empty values
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return "This field is required.";
        }
        // If it's numeric, ensure the input is a valid number
        if (isNumeric && value != null && value.trim().isNotEmpty) {
          if (double.tryParse(value) == null) {
            return "Enter a valid number.";
          }
        }
        return null;
      },
    );
  }
}
