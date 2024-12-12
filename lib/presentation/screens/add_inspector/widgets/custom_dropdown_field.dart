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
    return SizedBox(
      width: 500,
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