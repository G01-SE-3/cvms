import 'package:flutter/material.dart';
import '../constants/strings/custom_dropdown_field_strings.dart';

class CustomDropdownField extends StatelessWidget {
  final String? selectedDepartment;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownField({
    Key? key,
    required this.selectedDepartment,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

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
              child: Text(CustomDropdownFieldStrings.hr),
              value: CustomDropdownFieldStrings.hr,
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldStrings.finance),
              value: CustomDropdownFieldStrings.finance,
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldStrings.operations),
              value: CustomDropdownFieldStrings.operations,
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldStrings.it),
              value: CustomDropdownFieldStrings.it,
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldStrings.sales),
              value: CustomDropdownFieldStrings.sales,
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
