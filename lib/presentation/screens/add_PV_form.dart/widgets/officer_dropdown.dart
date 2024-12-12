import 'package:flutter/material.dart';

class OfficerDropdownField extends StatelessWidget {
  final String title;
  final String? selectedOfficer;
  final List<String> officerNames;
  final ValueChanged<String?> onChanged;

  const OfficerDropdownField({
    super.key,
    required this.title,
    required this.selectedOfficer,
    required this.officerNames,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedOfficer,
      hint: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFDDE5CD),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      items: officerNames.map((String officer) {
        return DropdownMenuItem<String>(
          value: officer,
          child: Text(
            officer,
            style: const TextStyle(color: Color(0xFF545837)),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null && title == "Select Officer 1") {
          return "This field is required.";
        }
        return null;
      },
    );
  }
}
