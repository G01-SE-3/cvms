import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String placeholder;
  final bool isRequired;
  final Function(DateTime)? onDateSelected;

  const DateField({
    super.key,
    required this.placeholder,
    this.isRequired = false,
    this.onDateSelected, // Callback for selected date
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(
        text: onDateSelected != null && onDateSelected != null
            ? DateFormat('yyyy-MM-dd').format(DateTime.now())
            : null,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFDDE5CD),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Color(0xFF545837)),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return "This field is required.";
        }
        return null;
      },
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (selectedDate != null) {
          if (onDateSelected != null) {
            onDateSelected!(selectedDate);
          }
        }
      },
    );
  }
}
