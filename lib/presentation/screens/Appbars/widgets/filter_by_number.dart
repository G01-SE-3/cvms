import 'package:flutter/material.dart';




class LatestPopupForm extends StatefulWidget {
  const LatestPopupForm({super.key});

  @override
  State<LatestPopupForm> createState() => _LatestPopupFormState();
}

class _LatestPopupFormState extends State<LatestPopupForm> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  void _validateAndApply() {
    final input = _controller.text;

    if (input.isEmpty) {
      setState(() {
        _errorMessage = "This field cannot be empty.";
      });
    } else if (double.tryParse(input) == null) {
      setState(() {
        _errorMessage = "Please enter a valid number.";
      });
    } else {
      // Input is valid, perform your action here
      setState(() {
        _errorMessage = null; // Clear error
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF8DA285), // Green background
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Latest :",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter a number",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorText: _errorMessage, // Show error message if validation fails
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _validateAndApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: Colors.black, // Button text color
                    ),
                    child: const Text("Apply"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
