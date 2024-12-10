import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final String placeholder;
  final bool isRequired;
  final TextEditingController? controller;

  const DateField({
    Key? key,
    required this.placeholder,
    this.isRequired = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFDDE5CD),
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
          controller?.text = "${selectedDate.toLocal()}".split(' ')[0];
        }
      },
    );
  }
}
