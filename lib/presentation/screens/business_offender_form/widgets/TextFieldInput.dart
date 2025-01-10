/*
File Name: <TextFieldInput.dart>
Purpose: <Provides a customizable text input field with validation for use in forms.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/messages.dart';
Widget TextFieldInput(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: SizedBox(
      width: 800, // Adjust the width as needed
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$pleaseEnterMessage $label';
          }
          return null;
        },
      ),
    ),
  );
}
