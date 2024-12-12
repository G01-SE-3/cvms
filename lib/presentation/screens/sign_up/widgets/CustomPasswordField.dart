import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPasswordVisible;
  final VoidCallback onVisibilityToggle;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    required this.label,
    required this.hint,
    required this.isPasswordVisible,
    required this.onVisibilityToggle,
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF306238),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF306238),
          ),
          onPressed: onVisibilityToggle,
        ),
      ),
      obscureText: !isPasswordVisible,
      validator: validator,
    );
  }
}
