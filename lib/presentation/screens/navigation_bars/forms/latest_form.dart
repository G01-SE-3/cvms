import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/buttons.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';

import '../constants/Strings/latest_form.dart'; // Import the new class

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
    final pvController = Provider.of<PVController>(context, listen: false);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 800,
          height: 250,
          decoration: BoxDecoration(
            color: const Color(0xFF8DA285),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              title(LatestPopupFormStrings.title), // Using LatestPopupFormStrings for the title
              const SizedBox(height: 20),
              InputField(
                controller: _controller,
                hintText: LatestPopupFormStrings.hintText,  // Using LatestPopupFormStrings for the hint text
                icon: null,
                color: Colors.white,
                bordercolor: _errorText != null ? Colors.red : Colors.grey,
                isReadOnly: false,
                onIconPressed: null,
              ),
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
                onApply: () async {
                  setState(() {
                    _errorText = validateInput(_controller.text);
                  });
                  if (_errorText == null) {
                    try {
                      int numberOfPVs = int.parse(_controller.text);

                      List<PV> latestPVs = await pvController.fetchLatestPVs(numberOfPVs);

                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PVListPage(
                            searchResults: latestPVs,
                          ),
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        _errorText = '${LatestPopupFormStrings.errorMessage} ${e.toString()}';  // Using LatestPopupFormStrings for the error message
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
