import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final String? Function(String?)? validator; 

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.inputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          filled: true,
          fillColor: const Color(0xFFDDE5CD),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: validator, 
      ),
    );
  }
}
