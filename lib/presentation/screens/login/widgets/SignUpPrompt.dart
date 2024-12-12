import 'package:cvms/presentation/screens/login/constants/strings/SignUpPromptStrings.dart';
import 'package:flutter/material.dart';
import '/presentation/screens/sign_up/SignUpPage.dart';



class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          SignUpPromptStrings.haveAccountLabel, 
          style: TextStyle(color: Color(0xFF98A2B3)), 
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: const Text(
             SignUpPromptStrings.signUpLabel,  //sign up
            style: TextStyle(color: Color(0xFF306238)),
          ),
        ),
      ],
    );
  }
}
