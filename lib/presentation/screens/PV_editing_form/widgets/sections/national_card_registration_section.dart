import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/national_card_reg.dart';
import '../../selection_globals.dart';

class NationalCardRegistrationSection extends StatefulWidget {
  final Function(NationalCardRegistration)
      onNationalCardRegistrationUpdated; // Callback
  final NationalCardRegistration?
      initialNationalCardRegistrationData; // Added for initial data

  const NationalCardRegistrationSection({
    super.key,
    required this.onNationalCardRegistrationUpdated,
    this.initialNationalCardRegistrationData,
  });

  @override
  _NationalCardRegistrationSectionState createState() =>
      _NationalCardRegistrationSectionState();
}

class _NationalCardRegistrationSectionState
    extends State<NationalCardRegistrationSection> {
  bool _canToggleSection = false; // Checkbox state
  bool _isSectionVisible = false; // Button toggle state

  final TextEditingController _nationalCardRegIdController =
      TextEditingController();
  DateTime? _nationalCardIssueDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialNationalCardRegistrationData != null) {
      _canToggleSection = true;
      _isSectionVisible = true;
      nationalCardRegistrationSelection = _isSectionVisible;

      _nationalCardRegIdController.text = widget
          .initialNationalCardRegistrationData!.nationalCardRegId
          .toString();
      _nationalCardIssueDate =
          widget.initialNationalCardRegistrationData!.nationalCardIssueDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _canToggleSection,
              onChanged: (value) {
                setState(() {
                  _canToggleSection = value!;
                  if (!_canToggleSection) {
                    _isSectionVisible = false;
                    nationalCardRegistrationSelection = _isSectionVisible;
                    // Clear controllers if disabling the section
                    _nationalCardRegIdController.clear();
                    _nationalCardIssueDate = null;
                  }
                  widget.onNationalCardRegistrationUpdated(
                      _buildNationalCardRegistrationData()); // Update on toggle
                });
              },
            ),
            const Text("Enable National Card Registration Section"),
          ],
        ),
        if (_canToggleSection)
          MaterialButton(
            onPressed: () {
              setState(() {
                _isSectionVisible = !_isSectionVisible;
                nationalCardRegistrationSelection = _isSectionVisible;
              });
            },
            child: Text(
              _isSectionVisible
                  ? "Hide National Card Registration Section"
                  : "Show National Card Registration Section",
            ),
          ),
        if (_isSectionVisible && _canToggleSection)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // National Card Registration ID
              TextFormField(
                controller: _nationalCardRegIdController,
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration(
                    "Enter National Card Registration ID"),
              ),
              const SizedBox(height: 12),

              // National Card Issue Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _nationalCardIssueDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _nationalCardIssueDate = selectedDate;
                    });
                    widget.onNationalCardRegistrationUpdated(
                        _buildNationalCardRegistrationData()); // Update on date change
                  }
                },
                style: _buildDatePickerStyle(),
                child: Text(
                  _nationalCardIssueDate == null
                      ? "Select National Card Issue Date"
                      : "Issue Date: ${_nationalCardIssueDate!.toLocal()}"
                          .split(' ')[0],
                ),
              ),
            ],
          ),
      ],
    );
  }

  // Method to build the input decoration for TextFormField
  InputDecoration _buildInputDecoration(String placeholder) {
    return InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFDDE5CD),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Method to build the style for date picker buttons
  ButtonStyle _buildDatePickerStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      backgroundColor: const Color(0xFFDDE5CD),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // Method to build the NationalCardRegistration data
  NationalCardRegistration _buildNationalCardRegistrationData() {
    return NationalCardRegistration(
      nationalCardRegId:
          int.tryParse(_nationalCardRegIdController.text.trim()) ?? 0,
      nationalCardIssueDate: _nationalCardIssueDate ?? DateTime.now(),
    );
  }
}
