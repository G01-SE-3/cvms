import 'package:flutter/material.dart';

void selectDate(
  BuildContext context,
  TextEditingController controller,
  bool isStartDate,
  Function(DateTime) onDateSelected,
) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    onDateSelected(pickedDate);
    controller.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
  }
}
