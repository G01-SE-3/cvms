import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/buttons.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';

import '../constants/Strings/latest_form.dart'; // Import for strings related to latest popup form

/// The `LatestPopupForm` widget allows the user to input a number (for the number of latest PVs to fetch).
/// The user can apply this number to fetch the latest PVs from the controller and navigate to the `PVListPage` to display them.
/// If there are errors, an error message is shown.

class LatestPopupForm extends StatefulWidget {
  const LatestPopupForm({super.key});

  @override
  State<LatestPopupForm> createState() => _LatestPopupFormState();
}

class _LatestPopupFormState extends State<LatestPopupForm> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText; // Store error messages

  @override
  Widget build(BuildContext context) {
    final pvController = Provider.of<PVController>(context, listen: false); // Access the PV controller

    return Dialog(
      backgroundColor: Colors.transparent, // Transparent background for the dialog
      insetPadding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 800, // Set width for the dialog box
          height: 250,
          decoration: BoxDecoration(
            color: const Color(0xFF8DA285), // Background color for the dialog
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              title(LatestPopupFormStrings.title), // Title for the popup form
              const SizedBox(height: 20),
              // Input field for entering the number of latest PVs to fetch
              InputField(
                controller: _controller,
                hintText: LatestPopupFormStrings.hintText,  // Hint text for the input field
                icon: null,
                color: Colors.white,
                bordercolor: _errorText != null ? Colors.red : Colors.grey, // Show error border if any error
                isReadOnly: false,
                onIconPressed: null,
              ),
              // Display error message if there is one
              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              // Action buttons (Cancel / Apply)
              buttons(
                context: context,
                onCancel: () {
                  Navigator.pop(context); // Close the dialog on cancel
                },
                onApply: () async {
                  setState(() {
                    _errorText = validateInput(_controller.text); // Validate input
                  });
                  if (_errorText == null) {
                    try {
                      // Parse the input to an integer and fetch the latest PVs
                      int numberOfPVs = int.parse(_controller.text);

                      List<PV> latestPVs = await pvController.fetchLatestPVs(numberOfPVs);

                      Navigator.pop(context); // Close the dialog

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PVListPage(
                            searchResults: latestPVs, // Show filtered PVs on a new page
                          ),
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        _errorText = '${LatestPopupFormStrings.errorMessage} ${e.toString()}'; // Show error message if fetching fails
                      });
                    }
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
