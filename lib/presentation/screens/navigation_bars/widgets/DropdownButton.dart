import 'package:flutter/material.dart';

/// General rule for using the `dropdownButton` widget:
/// 
/// This widget creates a custom dropdown button that allows the user to select from a list of options.
/// 
/// **How to use:**
/// - Provide the `selectedValue` (currently selected option) to reflect the chosen value.
/// - Use the `items` parameter to pass the dropdown items (the options in the list).
/// - Set a `hint` text to guide the user when nothing is selected.
/// - The `onChanged` callback will be triggered when the user selects an option, allowing you to handle the selection.
/// - Optionally, you can customize the padding for the dropdown using the `padding` parameter.
///
/// Example usage:
/// ```dart
/// dropdownButton(
///   selectedValue: 'Option 1',
///   items: [
///     DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
///     DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
///   ],
///   hint: 'Select an option',
///   onChanged: (value) {
///     // Handle the selection
///   },
/// )
/// ```

Widget dropdownButton({
  required String? selectedValue,  // The current selected value in the dropdown
  required List<DropdownMenuItem<String>> items,  // List of items to be displayed in the dropdown
  required String hint,  // The hint text that appears when no value is selected
  required Function(String?) onChanged,  // Callback function when the value changes
  EdgeInsetsGeometry? padding,  // Optional padding for the dropdown button
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFBDC9AA),
      borderRadius: BorderRadius.circular(8.0),  //
    ),
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),  // Apply custom padding if provided
    child: DropdownButton<String>(
      value: selectedValue,  
      hint: Text(hint),  
      underline: const SizedBox(),  
      items: items,  
      onChanged: onChanged,  
    ),
  );
}
