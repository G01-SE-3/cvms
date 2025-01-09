import 'package:flutter/material.dart';
import 'UsernameField.dart';
import 'PasswordField.dart';
import 'ForgotPasswordButton.dart';
import 'SignUpPrompt.dart';
import '../constants/strings/LoginPageStrings.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import 'LoginButton.dart';

class LoginPageForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final UserRepository userRepository;

  const LoginPageForm({
    required this.usernameController,
    required this.passwordController,
    required this.userRepository,
    super.key,
  });

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LoginPageStrings.loginToAccountLabel,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          UsernameField(controller: widget.usernameController),
          const SizedBox(height: 20),
          PasswordField(controller: widget.passwordController),
          const SizedBox(height: 10),
          const ForgotPasswordButton(),
          const SizedBox(height: 20),
          LoginButton(
            usernameController: widget.usernameController,
            passwordController: widget.passwordController,
            userRepository: widget.userRepository,
            formKey: _formKey,
          ),
          const SizedBox(height: 10),
          const SignUpPrompt(),
        ],
      ),
    );
  }
}
