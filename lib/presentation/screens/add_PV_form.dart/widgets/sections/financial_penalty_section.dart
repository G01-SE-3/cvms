import 'package:flutter/material.dart';
import '../price_field.dart';
import 'package:cvms/domain/entities/pv/financial_penalty.dart';
import '../../selection_globals.dart';
import 'package:flutter/material.dart';
import '../price_field.dart';
import 'package:cvms/data/models/pv/financial_penalty_model.dart';

class FinancialPenaltySection extends StatefulWidget {
  final Function(FinancialPenalty? penalty) onPenaltyUpdated;
  const FinancialPenaltySection({super.key, required this.onPenaltyUpdated});

  @override
  _FinancialPenaltySectionState createState() =>
      _FinancialPenaltySectionState();
}

class _FinancialPenaltySectionState extends State<FinancialPenaltySection> {
  bool _canToggleSection = false;
  bool _isSectionVisible = false;

  final TextEditingController _penaltyAmountController =
      TextEditingController();
  final TextEditingController _penaltyIdController = TextEditingController();
  final TextEditingController _paymentReceiptNumberController =
      TextEditingController();

  DateTime? _penaltyDate;
  DateTime? _paymentReceiptDate;

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
                    financialPenaltySelection = _isSectionVisible;
                  }
                });
                widget.onPenaltyUpdated(
                    _canToggleSection ? _buildFinancialPenaltyData() : null);
              },
            ),
            const Text("Enable Financial Penalty Section"),
          ],
        ),
        if (_canToggleSection)
          MaterialButton(
            onPressed: () {
              setState(() {
                _isSectionVisible = !_isSectionVisible;
                financialPenaltySelection = _isSectionVisible;
              });
            },
            child: Text(
              _isSectionVisible
                  ? "Hide Financial Penalty Section"
                  : "Show Financial Penalty Section",
            ),
          ),
        if (_isSectionVisible && _canToggleSection)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Penalty Amount
              PriceField(
                placeholder: "Enter penalty amount",
                controller: _penaltyAmountController,
                isRequired: false,
              ),
              const SizedBox(height: 12),

              // Penalty ID
              TextFormField(
                controller: _penaltyIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Penalty ID",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFDDE5CD),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Penalty Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _penaltyDate = selectedDate;
                    });
                    widget.onPenaltyUpdated(_buildFinancialPenaltyData());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: const Color(0xFFDDE5CD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _penaltyDate == null
                      ? "Select Penalty Date"
                      : "Penalty Date: ${_penaltyDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),

              // Payment Receipt Number
              TextFormField(
                controller: _paymentReceiptNumberController,
                decoration: InputDecoration(
                  hintText: "Enter Payment Receipt Number",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFDDE5CD),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Payment Receipt Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _paymentReceiptDate = selectedDate;
                    });
                    widget.onPenaltyUpdated(_buildFinancialPenaltyData());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: const Color(0xFFDDE5CD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _paymentReceiptDate == null
                      ? "Select Payment Receipt Date"
                      : "Payment Receipt Date: ${_paymentReceiptDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
      ],
    );
  }

  // Method to build and return the FinancialPenalty data
  FinancialPenalty? _buildFinancialPenaltyData() {
    if (_canToggleSection) {
      final penaltyAmount =
          double.tryParse(_penaltyAmountController.text.trim()) ?? 0.0;
      final penaltyId = int.tryParse(_penaltyIdController.text.trim()) ?? 0;
      final paymentReceiptNumber = _paymentReceiptNumberController.text.trim();

      return FinancialPenalty(
        penaltyAmount: penaltyAmount,
        penaltyDate: _penaltyDate ?? DateTime.now(),
        penaltyId: penaltyId,
        paymentReceiptNumber:
            paymentReceiptNumber.isEmpty ? null : paymentReceiptNumber,
        paymentReceiptDate: _paymentReceiptDate,
      );
    }
    return null;
  }
}
