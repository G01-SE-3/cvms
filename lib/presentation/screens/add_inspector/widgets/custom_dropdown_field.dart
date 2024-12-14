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
    return SizedBox(
      width: 500,
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
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          filled: true,
          fillColor: const Color(0xFFDDE5CD),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }
}