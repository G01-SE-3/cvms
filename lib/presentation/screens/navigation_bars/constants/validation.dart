import 'package:flutter/material.dart';
import 'Strings/validations.dart';  // Importing validation strings for error messages

// Validates if the date range is correct (start date should not be after end date)
String? validateDateRange(DateTime? startDate, DateTime? endDate) {
  // Check if the start date is after the end date
  if (startDate != null && endDate != null && startDate.isAfter(endDate)) {
    return ValidationStrings.startDateError;  // Return error message if invalid range
  } else if (startDate == null && endDate == null) {
    return ValidationStrings.emptyFieldsError;  // Return error message if both dates are missing
  }
  return null;  // No error, valid date range
}

// Validates input (checks if it's empty or not a valid number)
String? validateInput(String input) {
  if (input.isEmpty) {
    return ValidationStrings.emptyFieldError;  // Return error message if input is empty
  } else if (double.tryParse(input) == null) {
    return ValidationStrings.invalidNumberError;  // Return error message if input is not a valid number
  }
  return null;  // No error, valid input
}

// Validates search input (checks if it's empty or not a valid number)
String? validateSearchInput(String? input) {
  if (input == null || input.isEmpty) {
    return ValidationStrings.searchInputNullError;  // Return error message if input is empty
  } else if (int.tryParse(input) == null) {
    return ValidationStrings.invalidSearchInputError;  // Return error message if input is not a valid number
  }
  return null;  // No error, valid input
}

// Shows a dialog when no PV is found
void handleNoPVFound(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(ValidationStrings.noPVFoundTitle),  // Error title from validation strings
        content: const Text(ValidationStrings.noPVFoundMessage),  // Error message from validation strings
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog when OK is pressed
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

// Shows a custom error message in a floating SnackBar
void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,  // Red background for error message
      behavior: SnackBarBehavior.floating,  // Makes the SnackBar appear in a floating manner
    ),
  );
}
