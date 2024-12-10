import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final bool isNumeric;
  final bool isRequired;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.placeholder,
    this.isNumeric = false,
    this.isRequired = false,
    this.controller,
  }) : super(key: key);

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
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return "This field is required.";
        }
        if (isNumeric && value != null && double.tryParse(value) == null) {
          return "Enter a valid number.";
        }
        return null;
      },
    );
  }
}
