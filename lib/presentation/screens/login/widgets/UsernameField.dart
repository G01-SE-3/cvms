import 'package:cvms/presentation/screens/login/constants/strings/UsernameFieldStrings.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/login/validators/LoginValidate.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: Usernamefieldstrings.labelText,
        hintText: Usernamefieldstrings.hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF306238)),
        ),
      ),
      //validator: Validation.validateEmail,
    );
  }
}
