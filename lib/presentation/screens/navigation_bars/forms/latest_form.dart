import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/buttons.dart';


class LatestPopupForm extends StatefulWidget {
  const LatestPopupForm({super.key});

  @override
  State<LatestPopupForm> createState() => _LatestPopupFormState();
}
class _LatestPopupFormState extends State<LatestPopupForm> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText; 

  @override
  Widget build(BuildContext context) {
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
              title("Latest :"),
              const SizedBox(height: 20),
              InputField(
                controller: _controller,
                hintText: "Enter a number",
                icon: null,
                color: Colors.white,
                bordercolor: _errorText != null
                    ? Colors.red
                    : Colors.grey, // Set border color based on error
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
              buttons(
                context: context,
                onCancel: () {
                  Navigator.pop(context);
                },
                onApply: () {
                  // Call validateInput here when the Apply button is pressed
                  setState(() {
                    _errorText = validateInput(_controller.text);
                  });
                  if (_errorText == null) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
