import 'package:flutter/material.dart';
import '../constants/strings/custom_dropdown_field_for_departments_strings.dart';

class CustomDropdownFieldForDepartments extends StatelessWidget {
  final String selectedDepartment;
  final ValueChanged<String?> onChanged;

  const CustomDropdownFieldForDepartments({super.key, 
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
          items: const [
            DropdownMenuItem(
              value: 'HR',
              child: Text(CustomDropdownFieldForDepartmentsStrings.hr),
            ),
            DropdownMenuItem(
              value: 'Finance',
              child: Text(CustomDropdownFieldForDepartmentsStrings.finance),
            ),
            DropdownMenuItem(
              value: 'Operations',
              child: Text(CustomDropdownFieldForDepartmentsStrings.operations),
            ),
            DropdownMenuItem(
              value: 'IT',
              child: Text(CustomDropdownFieldForDepartmentsStrings.it),
            ),
            DropdownMenuItem(
              value: 'Sales',
              child: Text(CustomDropdownFieldForDepartmentsStrings.sales),
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
