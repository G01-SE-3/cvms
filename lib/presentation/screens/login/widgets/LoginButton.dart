import 'package:cvms/presentation/screens/login/constants/strings/LoginButtonStrings.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7E9A77),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: const Text(
        Loginbuttonstrings.LoginLabel,
        style: TextStyle(color: Colors.white), 
      ),
    );
  }
}
