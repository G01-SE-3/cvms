import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String placeholder;
  final bool isRequired;
  final DateTime? initialDate; // Optional initial date
  final Function(DateTime)? onDateSelected;

  const DateField({
    super.key,
    required this.placeholder,
    this.isRequired = false,
    this.initialDate,
    this.onDateSelected, // Callback for selected date
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();

    if (initialDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(initialDate!);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjust the width as needed
        child: TextFormField(
          readOnly: true,
          controller: dateController,
          decoration: InputDecoration(
            labelText: placeholder,
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
              initialDate: initialDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (selectedDate != null) {
              dateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              onDateSelected!(selectedDate);
            }
          },
        ),
      ),
    );
  }
}
