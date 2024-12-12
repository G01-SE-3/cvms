import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
  final String placeholder;
  final bool isRequired;
  final TextEditingController? controller;

  const PriceField({
    super.key,
    required this.placeholder,
    this.isRequired = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFDDE5CD),
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixText: "DZD",
        suffixStyle: const TextStyle(color: Color(0xFF545837)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Color(0xFF545837)),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return "This field is required.";
        }
        if (value != null && double.tryParse(value) == null) {
          return "Enter a valid number.";
        }
        return null;
      },
    );
  }
}
