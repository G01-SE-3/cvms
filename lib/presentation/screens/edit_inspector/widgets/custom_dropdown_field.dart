import 'package:flutter/material.dart';

class CustomDropdownFieldForDepartments extends StatelessWidget {
  final String selectedDepartment;
  final ValueChanged<String?> onChanged;

  const CustomDropdownFieldForDepartments({
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
          DropdownMenuItem(child: Text('HR'), value: 'HR'),
          DropdownMenuItem(child: Text('Finance'), value: 'Finance'),
          DropdownMenuItem(child: Text('Operations'), value: 'Operations'),
          DropdownMenuItem(child: Text('IT'), value: 'IT'),
          DropdownMenuItem(child: Text('Sales'), value: 'Sales'),
        ],
        onChanged: onChanged, 
        decoration: InputDecoration(
          labelText: 'Assigned Department',
          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          filled: true,
          fillColor: Color(0xFFDDE5CD),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          contentPadding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a department';
          }
          return null;
        },
      ),
    );
  }
}
