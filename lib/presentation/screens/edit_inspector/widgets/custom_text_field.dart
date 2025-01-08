import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String? Function(String?)? validator; 

  const CustomTextField({super.key, 
    required this.controller,
    required this.hint,
    required this.inputType,
    this.validator, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjusted width as per the second text field
        child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: hint,
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
            contentPadding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
          validator: validator, // Use the passed validator
        ),
      ),
    );
  }
}
