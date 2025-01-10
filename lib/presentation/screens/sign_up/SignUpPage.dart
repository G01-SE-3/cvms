/*`File Name: <SignUpPage.dart>
Purpose: 
- The purpose of this file is to allow users to create a new account by providing their details.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:flutter/material.dart'; 
import 'widgets/SignUpForm.dart';
import 'widgets/LeftBackground.dart';
import 'validators/SignUpPageValidate.dart';
import 'constants/strings/SignUpPage.dart';  
import 'package:cvms/domain/repositories/user/user_repository.dart'; 
import '../../screens/login/LoginPage.dart'; 
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cvms/domain/entities/user/user.dart';  


/// This screen allows users to sign up by filling out a form.  
/// It validates user input, hashes the password, and saves the user data.  
/// Users are redirected to the login screen upon successful sign-up.  
/// 
/// Dependencies:  
/// - [UserRepository]: Handles user data storage.  
/// - [SignUpPageValidate]: Provides validation for form fields.  
 

class SignUpPage extends StatefulWidget {
  final UserRepository userRepository;  

  const SignUpPage({super.key, required this.userRepository});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool isLoading = false; 
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late final UserRepository _userRepository;

  List<String> existingUsernames = [SignUpPageStrings.usernamExample];

  @override
  void initState() {
    super.initState();
    _userRepository = widget.userRepository;
  }

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
                          isLoading: isLoading,  
                          errorMessage: errorMessage, 


                          onSubmit: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                isLoading = true;
                                errorMessage = null;
                              });

                              var bytes = utf8.encode(_passwordController.text); 
                              var digest = sha256.convert(bytes);

                              String hashedPasswordController = digest.toString();

                              final user = User(
                                username: _usernameController.text,
                                email: _emailController.text,
                                hashedPassword: hashedPasswordController,  
                              );

                              try {
                                await _userRepository.addUser(user);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                              } catch (e) {
                                // Check for the specific PostgreSQL error for duplicate username
                                if (e.toString().contains('23505')) {
                                  setState(() {
                                    errorMessage = SignUpPageStrings.usernameExists;
                                  });
                                } else {
                                  setState(() {
                                    errorMessage = SignUpPageStrings.signUpFailed;
                                  });
                                }
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          }
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
