import 'package:flutter/material.dart';
import '../constants/strings/custom_dropdown_field_for_departments_strings.dart';

class CustomDropdownFieldForDepartments extends StatelessWidget {
  final String selectedDepartment;
  final ValueChanged<String?> onChanged;

  const CustomDropdownFieldForDepartments({
    required this.selectedDepartment,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjusted width to match the second dropdown field
        child: DropdownButtonFormField<String>(
          value: selectedDepartment,
          items: [
            DropdownMenuItem(
              child: Text(CustomDropdownFieldForDepartmentsStrings.hr),
              value: 'HR',
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldForDepartmentsStrings.finance),
              value: 'Finance',
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldForDepartmentsStrings.operations),
              value: 'Operations',
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldForDepartmentsStrings.it),
              value: 'IT',
            ),
            DropdownMenuItem(
              child: Text(CustomDropdownFieldForDepartmentsStrings.sales),
              value: 'Sales',
            ),
          ],
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: CustomDropdownFieldForDepartmentsStrings.labelText,
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
        ),
      ),
    );
  }
}
