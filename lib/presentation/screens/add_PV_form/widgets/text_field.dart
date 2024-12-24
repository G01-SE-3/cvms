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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjust the width as needed
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: placeholder,
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: const Color(0xFFDDE5CD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green),
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
        ),
      ),
    );
  }
}
