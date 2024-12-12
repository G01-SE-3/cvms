import 'package:flutter/material.dart';
import 'widgets/SignUpForm.dart';
import 'widgets/LeftBackground.dart';
import 'validators/SignUpPageValidate.dart';  
import 'constants/strings/SignUpPage.dart';  




class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  List<String> existingUsernames = [SignUpPageStrings.usernamExample];  //I did provided this just to check that username is unique

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 600;
          return Row(
            children: [
              if (isLargeScreen) const LeftBackground(),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isLargeScreen ? 400 : double.infinity, 
                      ),
                      child: Form(
                        key: _formKey,
                        child: SignUpForm(
                          isPasswordVisible: _isPasswordVisible,
                          isConfirmPasswordVisible: _isConfirmPasswordVisible,
                          onPasswordVisibilityToggle: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          onConfirmPasswordVisibilityToggle: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                          usernameController: _usernameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                          validateUsername: (value) => SignUpPageValidate.validateUsername(value, existingUsernames),
                          validateEmail: SignUpPageValidate.validateEmail,
                          validatePassword: SignUpPageValidate.validatePassword,
                          onSubmit: () {
                            if (_formKey.currentState?.validate() ?? false) {

                              print(SignUpPageStrings.validatedForm);
                            } else {
                              print(SignUpPageStrings.validatedForm);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
