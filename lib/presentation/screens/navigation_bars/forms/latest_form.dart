import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation bars/widgets/form.dart';
import 'package:cvms/presentation/screens/navigation bars/constants/validation.dart';  
import 'package:cvms/presentation/screens/navigation bars/widgets/title.dart'; 
import 'package:cvms/presentation/screens/navigation bars/widgets/buttons.dart';

class LatestPopupForm extends StatefulWidget {
  const LatestPopupForm({super.key});

  @override
  State<LatestPopupForm> createState() => _LatestPopupFormState();
}

class _LatestPopupFormState extends State<LatestPopupForm> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText; // Store error message

  @override
  Widget build(BuildContext context) {
    // Call validateInput and check if the text is valid or not
    _errorText = validateInput(_controller.text);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 800, // Set a fixed width
          height: 250, // Set a fixed height
          decoration: BoxDecoration(
            color: const Color(0xFF8DA285), // Green background
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              buildTitle("Latest :"),
              const SizedBox(height: 20),
              buildInputField(
                controller: _controller,
                hintText: "Enter a number",
                icon: null,
                color: Colors.white,
                bordercolor: _errorText != null ? Colors.red : Colors.grey, // Set border color based on error
                isReadOnly: false,
                onIconPressed: null,
              ),
              // Display error text below the input field
              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              buildActionButtons(
                context: context,
                onCancel: () {
                  Navigator.pop(context);
                },
                onApply: () {
                  // Handle apply logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
