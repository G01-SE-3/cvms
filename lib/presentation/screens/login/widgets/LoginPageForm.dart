import 'package:flutter/material.dart';
import 'UsernameField.dart';
import 'PasswordField.dart';
import 'ForgotPasswordButton.dart';
import 'SignUpPrompt.dart';
import '../constants/strings/LoginPageStrings.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            LoginPageStrings.loginToAccountLabel,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          UsernameField(controller: _usernameController),
          const SizedBox(height: 20),
          PasswordField(controller: _passwordController),
          const SizedBox(height: 10),
          const ForgotPasswordButton(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7E9A77), 
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            ),
            child: const Text(
              LoginPageStrings.login,
              style: TextStyle(color: Colors.white), 
            ),
          ),
          const SizedBox(height: 10),
          const SignUpPrompt(),
        ],
      ),
    );
  }
}
