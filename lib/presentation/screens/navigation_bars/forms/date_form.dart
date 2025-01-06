import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/data_picker.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/buttons.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';

import '../constants/Strings/date_form.dart'; // Import for strings related to date filter

/// The `DateFilterPopup` widget allows the user to filter PVs by selecting a start and end date.
/// It displays a date picker for both fields and validates the date range before applying the filter.
/// If the dates are valid, it fetches filtered PVs and navigates to the PV list page.
/// 
/// **Date Selection Logic:**
/// - When a user picks a date, it's validated to ensure the range is valid (start date before end date).
/// - If the dates are valid, the `onApply` function fetches the filtered list of PVs from the `pvController`.
/// - If any errors occur, an error message is displayed.
///
/// **Widgets Used:**
/// - `InputField`: For selecting the start and end date using a calendar icon.
/// - `buttons`: For canceling or applying the filter.
/// - `PVListPage`: Displays filtered PVs based on the date range selected.

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
    final pvController = Provider.of<PVController>(context, listen: false);

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 800, // Set a fixed width for the dialog
        height: 250,
        color: const Color(0xFF8DA285),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title(DateFilterStrings.filteringByDate),
            const SizedBox(height: 20),
            Row(
              children: [
                // Start Date input field
                InputField(
                  controller: _startDateController,
                  hintText: DateFilterStrings.startDate,  
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
                        _errorText = null; // Reset error text when date is picked
                      });
                      _errorText = validateDateRange(_startDate, _endDate); // Validate date range
                    },
                  ),
                ),
                const SizedBox(width: 10),
                // End Date input field
                InputField(
                  controller: _endDateController,
                  hintText: DateFilterStrings.endDate, 
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
                        _errorText = null; // Reset error text when date is picked
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
            // Action buttons (Cancel / Apply)
            buttons(
              context: context,
              onCancel: () {
                Navigator.pop(context); // Close the popup
              },
              onApply: () async {
                setState(() {
                  _errorText = validateDateRange(_startDate, _endDate); 
                });
                if (_errorText == null) {
                  try {
                    // Fetch filtered PVs by the selected date range
                    List<PV> filteredPVs = await pvController.fetchPVsByDate(_startDate!, _endDate!);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PVListPage(searchResults: filteredPVs),
                      ),
                    );
                  } catch (e) {
                    setState(() {
                      _errorText = '${DateFilterStrings.errorMessage} ${e.toString()}';  
                    });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
