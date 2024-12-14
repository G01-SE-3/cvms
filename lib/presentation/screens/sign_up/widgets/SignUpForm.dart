import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/SignUpFormStrings.dart';
import 'package:cvms/presentation/screens/sign_up/widgets/SignUpButton.dart';
import 'CustomTextField.dart';
import 'CustomPasswordField.dart';

class SignUpForm extends StatelessWidget {
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final Function onPasswordVisibilityToggle;
  final Function onConfirmPasswordVisibilityToggle;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? Function(String?) validateUsername;
  final String? Function(String?) validateEmail;
  final String? Function(String?) validatePassword;
  final Function onSubmit;
  final bool isLoading; 
  final String? errorMessage;

  const SignUpForm({super.key, 
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    required this.onPasswordVisibilityToggle,
    required this.onConfirmPasswordVisibilityToggle,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.validateUsername,
    required this.validateEmail,
    required this.validatePassword,
    required this.onSubmit,
    required this.isLoading,  
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          SignUpFormStrings.createAccount,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: usernameController,
          label: SignUpFormStrings.usernameLabel,
          hint: SignUpFormStrings.usernameHint,
          validator: validateUsername,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: emailController,
          label: SignUpFormStrings.emailLabel,
          hint: SignUpFormStrings.emailHint,
          validator: validateEmail,
        ),
        const SizedBox(height: 20),
        CustomPasswordField(
          controller: passwordController,
          label: SignUpFormStrings.passwordLabel,
          hint: SignUpFormStrings.passwordHint,
          isPasswordVisible: isPasswordVisible,
          onVisibilityToggle: () => onPasswordVisibilityToggle(),
          validator: validatePassword,
        ),
        const SizedBox(height: 20),
        CustomPasswordField(
          controller: confirmPasswordController,
          label: SignUpFormStrings.confirmPasswordLabel,
          hint: SignUpFormStrings.confirmPasswordHint,
          isPasswordVisible: isConfirmPasswordVisible,
          onVisibilityToggle: () => onConfirmPasswordVisibilityToggle(),
          validator: (value) {
            if (value != passwordController.text) {
              return SignUpFormStrings.passwordsDoNotMatch;
            }
            return null;
          },
        ),
        const SizedBox(height: 50),
        Signupbutton(
          onSubmit: onSubmit,
          isLoading: isLoading, 
          errorMessage: errorMessage,  
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
