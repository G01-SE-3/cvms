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
        width: 800, // Set a fixed width
        height: 250,
        color: const Color(0xFF8DA285),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title("Filtering by Date :"),
            const SizedBox(height: 20),
            Row(
              children: [
                InputField(
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
                        _errorText = null; // Reset error text when date is picked
                      });
                      _errorText = validateDateRange(_startDate, _endDate); // Validate date range
                    },
                  ),
                ),
                const SizedBox(width: 10),
                InputField(
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
            buttons(
              context: context,
              onCancel: () {
                Navigator.pop(context);
              },
              onApply: () async {
                setState(() {
                  _errorText = validateDateRange(_startDate, _endDate); 
                });
                if (_errorText == null) {
                  try {
                   
                    List<PV> filteredPVs = await pvController.fetchPVsByDate(_startDate!, _endDate!);

                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PVListPage(searchResults: filteredPVs),
                      ),
                    );
                  } catch (e) {
                    setState(() {
                      _errorText = 'Error fetching PVs: ${e.toString()}';
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
