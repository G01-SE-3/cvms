import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/legal_proceedings.dart';
import '../../selection_globals.dart';

class LegalProceedingsSection extends StatefulWidget {
  final Function(LegalProceedings) onLegalProceedingsUpdated; // Callback
  final LegalProceedings? initialLegalProceedingsData; // Added for initial data

  const LegalProceedingsSection({
    super.key,
    required this.onLegalProceedingsUpdated,
    this.initialLegalProceedingsData,
  });

  @override
  _LegalProceedingsSectionState createState() =>
      _LegalProceedingsSectionState();
}

class _LegalProceedingsSectionState extends State<LegalProceedingsSection> {
  bool _canToggleSection = false; // Checkbox state
  bool _isSectionVisible = false; // Button toggle state

  final TextEditingController _referralToJusticeNumberController =
      TextEditingController();
  final TextEditingController _jurisdictionController = TextEditingController();
  final TextEditingController _legalProvisionsController =
      TextEditingController();
  final TextEditingController _courtDecisionNumberController =
      TextEditingController();
  final TextEditingController _courtImposedFineAmountController =
      TextEditingController();

  DateTime? _referralToJusticeDate;
  DateTime? _courtDecisionDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialLegalProceedingsData != null) {
      _canToggleSection = true;
      _isSectionVisible = true;
      leagalProceedingsSelection = _isSectionVisible;

      _referralToJusticeNumberController.text =
          widget.initialLegalProceedingsData!.referralToJusticeNumber ?? "";
      _referralToJusticeDate =
          widget.initialLegalProceedingsData!.referralToJusticeDate;
      _jurisdictionController.text =
          widget.initialLegalProceedingsData!.jurisdiction ?? "";
      _legalProvisionsController.text =
          widget.initialLegalProceedingsData!.legalProvisions ?? "";
      _courtDecisionNumberController.text =
          widget.initialLegalProceedingsData!.courtDecisionNumber ?? "";
      _courtDecisionDate =
          widget.initialLegalProceedingsData!.courtDecisionDate;
      _courtImposedFineAmountController.text = widget
              .initialLegalProceedingsData!.courtImposedFineAmount
              ?.toString() ??
          "";
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
                    leagalProceedingsSelection = _isSectionVisible;
                    // Clear controllers if disabling the section
                    _referralToJusticeNumberController.clear();
                    _jurisdictionController.clear();
                    _legalProvisionsController.clear();
                    _courtDecisionNumberController.clear();
                    _referralToJusticeDate = null;
                    _courtDecisionDate = null;
                    _courtImposedFineAmountController.clear();
                  }
                  widget
                      .onLegalProceedingsUpdated(_buildLegalProceedingsData());
                });
              },
            ),
            const Text("Enable Legal Proceedings Section"),
          ],
        ),
        if (_canToggleSection)
          MaterialButton(
            onPressed: () {
              setState(() {
                _isSectionVisible = !_isSectionVisible;
                leagalProceedingsSelection = _isSectionVisible;
              });
            },
            child: Text(
              _isSectionVisible
                  ? "Hide Legal Proceedings Section"
                  : "Show Legal Proceedings Section",
            ),
          ),
        if (_isSectionVisible && _canToggleSection)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Referral to Justice Number
              TextFormField(
                controller: _referralToJusticeNumberController,
                decoration:
                    _buildInputDecoration("Enter Referral to Justice Number"),
              ),
              const SizedBox(height: 12),

              // Referral to Justice Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _referralToJusticeDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _referralToJusticeDate = selectedDate;
                    });
                    widget.onLegalProceedingsUpdated(
                        _buildLegalProceedingsData());
                  }
                },
                style: _buildDatePickerStyle(),
                child: Text(
                  _referralToJusticeDate == null
                      ? "Select Referral to Justice Date"
                      : "Referral Date: ${_referralToJusticeDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),

              // Jurisdiction
              TextFormField(
                controller: _jurisdictionController,
                decoration: _buildInputDecoration("Enter Jurisdiction"),
              ),
              const SizedBox(height: 12),

              // Legal Provisions
              TextFormField(
                controller: _legalProvisionsController,
                decoration: _buildInputDecoration("Enter Legal Provisions"),
              ),
              const SizedBox(height: 12),

              // Court Decision Number
              TextFormField(
                controller: _courtDecisionNumberController,
                decoration:
                    _buildInputDecoration("Enter Court Decision Number"),
              ),
              const SizedBox(height: 12),

              // Court Decision Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _courtDecisionDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _courtDecisionDate = selectedDate;
                    });
                    widget.onLegalProceedingsUpdated(
                        _buildLegalProceedingsData());
                  }
                },
                style: _buildDatePickerStyle(),
                child: Text(
                  _courtDecisionDate == null
                      ? "Select Court Decision Date"
                      : "Court Decision Date: ${_courtDecisionDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),

              // Court Imposed Fine Amount
              TextFormField(
                controller: _courtImposedFineAmountController,
                keyboardType: TextInputType.number,
                decoration:
                    _buildInputDecoration("Enter Court Imposed Fine Amount"),
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

  // Method to build the LegalProceedings data
  LegalProceedings _buildLegalProceedingsData() {
    return LegalProceedings(
      referralToJusticeNumber: _referralToJusticeNumberController.text.trim(),
      referralToJusticeDate: _referralToJusticeDate,
      jurisdiction: _jurisdictionController.text.trim(),
      legalProvisions: _legalProvisionsController.text.trim(),
      courtDecisionNumber: _courtDecisionNumberController.text.trim(),
      courtDecisionDate: _courtDecisionDate,
      courtImposedFineAmount:
          double.tryParse(_courtImposedFineAmountController.text.trim()) ?? 0.0,
    );
  }
}
