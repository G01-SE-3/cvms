import 'package:flutter/material.dart';

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
          DropdownMenuItem(value: 'HR', child: Text('HR')),
          DropdownMenuItem(value: 'Finance', child: Text('Finance')),
          DropdownMenuItem(value: 'Operations', child: Text('Operations')),
          DropdownMenuItem(value: 'IT', child: Text('IT')),
          DropdownMenuItem(value: 'Sales', child: Text('Sales')),
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
