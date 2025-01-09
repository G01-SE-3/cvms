import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/presentation/screens/login/constants/strings/LoginButtonStrings.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:cvms/services/auth_service.dart';

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

  // Function to hash the password
  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    // Access AuthService using Provider
    final authService = Provider.of<AuthService>(context, listen: false);

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

            String hashedPassword = _hashPassword(password);

            bool isValid = false;

            try {
              isValid = await widget.userRepository.checkUserCredentials(
                username,
                hashedPassword,
              );
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
              await authService.signIn(username);

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
              : Text(
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
