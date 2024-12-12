import 'package:flutter/material.dart';
import '/presentation/screens/login/LoginPage.dart';
import '/presentation/screens/sign_up/SignUpPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor now includes the named 'key' parameter
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello to CVMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(), // Passing 'key' to MyHomePage widget
    );
  }
}

