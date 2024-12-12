import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/login/constants/strings/ForgotPasswordStrings.dart';


class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          Forgotpasswordstrings.ForgotPassword,
          style: TextStyle(color: Color(0xFF306238)),
        ),
      ),
    );
  }
}
