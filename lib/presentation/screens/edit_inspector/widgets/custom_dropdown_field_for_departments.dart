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
    return SizedBox(
      width: 500,
      child: DropdownButtonFormField<String>(
        value: selectedDepartment,
        items: const [
          DropdownMenuItem(value: 'HR', child: Text(CustomDropdownFieldForDepartmentsStrings.hr)),
          DropdownMenuItem(value: 'Finance', child: Text(CustomDropdownFieldForDepartmentsStrings.finance)),
          DropdownMenuItem(value: 'Operations', child: Text(CustomDropdownFieldForDepartmentsStrings.operations)),
          DropdownMenuItem(value: 'IT', child: Text(CustomDropdownFieldForDepartmentsStrings.it)),
          DropdownMenuItem(value: 'Sales', child: Text(CustomDropdownFieldForDepartmentsStrings.sales)),
        ],
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: CustomDropdownFieldForDepartmentsStrings.labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          filled: true,
          fillColor: const Color(0xFFDDE5CD),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          contentPadding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}