import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/login/constants/strings/LoginButtonStrings.dart';
import '../../../../domain/repositories/user/user_repository.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final UserRepository userRepository;
  final GlobalKey<FormState> formKey;

  const LoginButton({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.userRepository,
    required this.formKey,
  });

  @override
  LoginButtonState createState() => LoginButtonState();
}

class LoginButtonState extends State<LoginButton> {
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            // Validate the form
            if (!widget.formKey.currentState!.validate()) {
              return;
            }

            setState(() {
              isLoading = true;
              errorMessage = null;
            });

            final username = widget.usernameController.text;
            final password = widget.passwordController.text;

            bool isValid = false;

            try {
              isValid = await widget.userRepository
                  .checkUserCredentials(username, password);
            } catch (e) {
              setState(() {
                isLoading = false;
                errorMessage = Loginbuttonstrings.LoginFailed;
              });
              return;
            }

            if (!mounted) return;

            setState(() {
              isLoading = false;
            });

            if (isValid) {
              if (mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            } else {
              setState(() {
                errorMessage = Loginbuttonstrings.LoginFailed;
              });
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
                  Loginbuttonstrings.LoginLabel,
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
      ],
    );
  }
}
