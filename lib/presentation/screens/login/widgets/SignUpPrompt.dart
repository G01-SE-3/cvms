import 'package:flutter/material.dart';
import '/presentation/screens/sign_up/SignUpPage.dart';
import 'package:cvms/data/repositories/user/user_repositoty_impl.dart'; // Import the UserRepositoryImpl

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?', 
          style: TextStyle(color: Color(0xFF98A2B3)), 
        ),
        TextButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(
                  userRepository: UserRepositoryImpl(),
                ),
              ),
            );
          },
          child: const Text(
            'Sign Up',  // Text that should appear on the button
            style: TextStyle(color: Color(0xFF306238)),
          ),
        ),
      ],
    );
  }
}
