import 'package:flutter/material.dart';
import '../constants/strings/custom_dropdown_field_strings.dart';

class CustomDropdownField extends StatelessWidget {
  final String? selectedDepartment;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    super.key,
    required this.selectedDepartment,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjusted width to match the CustomTextField size
        child: DropdownButtonFormField<String>(
          value: selectedDepartment,
          items: const [
            DropdownMenuItem(
              value: CustomDropdownFieldStrings.hr,
              child: Text(CustomDropdownFieldStrings.hr),
            ),
            DropdownMenuItem(
              value: CustomDropdownFieldStrings.finance,
              child: Text(CustomDropdownFieldStrings.finance),
            ),
            DropdownMenuItem(
              value: CustomDropdownFieldStrings.operations,
              child: Text(CustomDropdownFieldStrings.operations),
            ),
            DropdownMenuItem(
              value: CustomDropdownFieldStrings.it,
              child: Text(CustomDropdownFieldStrings.it),
            ),
            DropdownMenuItem(
              value: CustomDropdownFieldStrings.sales,
              child: Text(CustomDropdownFieldStrings.sales),
            ),
          ],
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: CustomDropdownFieldStrings.labelText,
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
          validator: validator,
        ),
      ),
    );
  }
}
