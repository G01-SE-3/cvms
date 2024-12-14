import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/LoginPromptStrings.dart';

class Signupbutton extends StatelessWidget {
  final Function onSubmit;
  final bool isLoading;  
  final String? errorMessage;  

  const Signupbutton({
    required this.onSubmit,
    required this.isLoading, 
    this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            if (!isLoading) {
              onSubmit(); 
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7E9A77),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  AccountCreationButtonStrings.createAccountButton,
                  style: TextStyle(color: Colors.white),
                ),
        ),
        if (errorMessage != null) 
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
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
