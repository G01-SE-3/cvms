import 'package:flutter/material.dart';
import 'Strings/validations.dart';
 

String? validateDateRange(DateTime? startDate, DateTime? endDate) {
  if (startDate != null && endDate != null && startDate.isAfter(endDate)) {
    return ValidationStrings.startDateError;  // Use the string from ValidationStrings
  } else if (startDate == null && endDate == null) {
    return ValidationStrings.emptyFieldsError;  // Use the string from ValidationStrings
  }
  return null;
}

String? validateInput(String input) {
  if (input.isEmpty) {
    return ValidationStrings.emptyFieldError;  // Use the string from ValidationStrings
  } else if (double.tryParse(input) == null) {
    return ValidationStrings.invalidNumberError;  // Use the string from ValidationStrings
  }
  return null; 
}

String? validateSearchInput(String? input) {
  if (input == null || input.isEmpty) {
    return ValidationStrings.searchInputNullError;  // Use the string from ValidationStrings
  } else if (int.tryParse(input) == null) {
    return ValidationStrings.invalidSearchInputError;  // Use the string from ValidationStrings
  }
  return null;
}

void handleNoPVFound(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(ValidationStrings.noPVFoundTitle),  // Use the string from ValidationStrings
        content: Text(ValidationStrings.noPVFoundMessage),  // Use the string from ValidationStrings
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red, // Red background for the SnackBar
      behavior: SnackBarBehavior.floating,
    ),
  );
}
