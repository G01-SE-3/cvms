import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/form.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/data_picker.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/error.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/buttons.dart';

class DateFilterPopup extends StatefulWidget {
  const DateFilterPopup({super.key});

  @override
  State<DateFilterPopup> createState() => _DateFilterPopupState();
}

class _DateFilterPopupState extends State<DateFilterPopup> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 800, // Set a fixed width
        height: 250,
        color: const Color(0xFF8DA285),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle("Filtering by Date :"),
            const SizedBox(height: 20),
            Row(
              children: [
                buildInputField(
                  controller: _startDateController,
                  hintText: "Start Date",
                  icon: Icons.calendar_today,
                  color: const Color(0x00ffffff),
                  bordercolor: _errorText != null ? Colors.red : Colors.grey,
                  isReadOnly: true,
                  onIconPressed: () => selectDate(
                    context,
                    _startDateController,
                    true,
                    (pickedDate) {
                      setState(() {
                        _startDate = pickedDate;
                        _errorText = null;
                      });
                      _errorText = validateDateRange(_startDate, _endDate);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                buildInputField(
                  controller: _endDateController,
                  hintText: "End Date",
                  icon: Icons.calendar_today,
                  color: const Color(0x00ffffff),
                  bordercolor: _errorText != null ? Colors.red : Colors.grey,
                  isReadOnly: true,
                  onIconPressed: () => selectDate(
                    context,
                    _endDateController,
                    false,
                    (pickedDate) {
                      setState(() {
                        _endDate = pickedDate;
                        _errorText = null;
                      });
                      _errorText = validateDateRange(_startDate, _endDate);
                    },
                  ),
                ),
              ],
            ),
            // Display error message if validation fails
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
                if (_errorText == null) {
                  Navigator.pop(context);
                  // Implement page-specific logic for Apply button here
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
