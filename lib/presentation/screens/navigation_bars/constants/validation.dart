// validators.dart
import 'package:flutter/material.dart';

String? validateDateRange(DateTime? startDate, DateTime? endDate) {
  if (startDate != null && endDate != null && startDate.isAfter(endDate)) {
    return "Start date cannot be later than end date.";
  }
  else if(startDate == null && endDate == null )
  {
         return "Input  fields cannot be empty.";
  }
  return null;
 

}


String? validateInput(String input) {
  if (input.isEmpty) {
    return "This field cannot be empty.";
  } else if (double.tryParse(input) == null) {
    return "Please enter a valid number.";
  }
  return null; 
}


String? validateSearchInput(String? input) {
  if (input == null || input.isEmpty) {
    return "Search input can't be null.";
  } else if (int.tryParse(input) == null) {
    return "Invalid input.";
  }
  return null;
}

void handleNoPVFound(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('No Results Found'),
        content: const Text('No PV found for the given number.'),
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
