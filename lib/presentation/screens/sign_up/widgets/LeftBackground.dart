import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/LeftBackgroundStrings.dart';

class LeftBackground extends StatelessWidget {
  const LeftBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color(0xFF545837),
        child: Center(
          child: Text(
            LeftBackgroundStrings.welcomeMessage,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
