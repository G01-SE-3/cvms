import 'package:cvms/presentation/screens/login/widgets/LoginPageForm.dart';
import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 600;
          return Center(
            child: Container(
              color: isLargeScreen ? const Color(0xFF545837) : Colors.transparent,
              child: Center(
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const LoginPageForm()
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
