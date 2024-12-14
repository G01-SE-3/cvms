import 'package:flutter/material.dart';

// Function to create the input field widget
Widget InputField({
  required TextEditingController controller,
  required String hintText,
  IconData? icon, // Make the icon parameter nullable
  required Color color,
   required Color bordercolor,
  required bool isReadOnly,
  required VoidCallback? onIconPressed,
}) {
  return Expanded(
    child: TextField(
      controller: controller,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: bordercolor),
        ),
        suffixIcon: icon != null
            ? IconButton(
                icon: Icon(icon),
                onPressed: onIconPressed,
              )
            : null, // If no icon is passed, no suffixIcon is displayed
      ),
    ),
  );
}