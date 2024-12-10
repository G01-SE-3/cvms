import 'package:flutter/material.dart';

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
          DropdownMenuItem(child: Text('HR'), value: 'HR'),
          DropdownMenuItem(child: Text('Finance'), value: 'Finance'),
          DropdownMenuItem(child: Text('Operations'), value: 'Operations'),
          DropdownMenuItem(child: Text('IT'), value: 'IT'),
          DropdownMenuItem(child: Text('Sales'), value: 'Sales'),
        ],
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: "Department",
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
