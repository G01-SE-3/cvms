import 'package:flutter/material.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 600;
          return Row(
            children: [
              // Left background - reduced width
              if (isLargeScreen)
                Expanded(
                  flex: 1, // Reduced to 1/3 width
                  child: Container(
                    color: const Color(0xFF545837), // Dark Olive Background
                    child: const Center(
                      child: Text(
                        "Welcome.",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              // Right content
              Expanded(
                flex: 2, // Increased to occupy 2/3 width
                child: Center(
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Create an account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        const TextField(
                          decoration: InputDecoration(
                            labelText: "Username", 
                            hintText: "Enter your username", 
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF306238), 
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const TextField(
                          decoration: InputDecoration(
                            labelText: "Email", 
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF306238), 
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          decoration: InputDecoration(
                            labelText: "Password", 
                            hintText: "Enter your password",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF306238), 
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF306238), 
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible,
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Confirm your password",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF306238), // Border color
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF306238), 
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isConfirmPasswordVisible,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7E9A77), 
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ),
                          child: const Text(
                           "Create account",
                          style: TextStyle(color: Colors.white), 
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already Have An Account?",
                              style: TextStyle(
                                color: Color(0xFF98A2B3), 
                              ),
                            ),
                            TextButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  color: Color(0xFF306238), 
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
