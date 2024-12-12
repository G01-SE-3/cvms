import 'package:cvms/presentation/screens/login/constants/strings/PasswordFieldStrings.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/login/validators/LoginValidate.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({required this.controller, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: Passwordfieldstrings.labelText,
        hintText: Passwordfieldstrings.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF306238)), 
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF306238),
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      obscureText: !_isPasswordVisible,
      validator: Validation.validatePassword,
    );
  }
}
