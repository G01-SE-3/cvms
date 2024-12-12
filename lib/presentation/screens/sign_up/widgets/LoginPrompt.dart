import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/LoginPromptStrings.dart';


class Loginprompt extends StatelessWidget {
  final Function onSubmit;

  // ignore: use_super_parameters
  const Loginprompt({required this.onSubmit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => onSubmit(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7E9A77),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          ),
          child: const Text(
            AccountCreationButtonStrings.createAccountButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AccountCreationButtonStrings.haveAccount,
              style: TextStyle(
                color: Color(0xFF98A2B3),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                AccountCreationButtonStrings.login,
                style: TextStyle(
                  color: Color(0xFF306238),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


