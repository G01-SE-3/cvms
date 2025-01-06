import 'package:flutter/material.dart';

/// This function allows the user to select a date from a date picker.
/// It updates the controller with the selected date and passes the selected date to the callback.
void selectDate(
  BuildContext context,
  TextEditingController controller,
  bool isStartDate, // Used to differentiate start and end dates (though not used in this function)
  Function(DateTime) onDateSelected, // Callback that gets called when a date is selected
) async {
  // Show the date picker with initial date, first date, and last date
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Default to current date
    firstDate: DateTime(2000), // Earliest selectable date
    lastDate: DateTime(2100), // Latest selectable date
  );

  // If a date is picked, update the controller text and call the callback
  if (pickedDate != null) {
    onDateSelected(pickedDate); // Pass the selected date to the callback
    // Format the selected date and update the controller's text
    controller.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
  }
}
