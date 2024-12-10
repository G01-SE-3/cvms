import 'package:flutter/material.dart';
import '../price_field.dart';

class FinancialPenaltySection extends StatefulWidget {
  const FinancialPenaltySection({Key? key}) : super(key: key);

  @override
  _FinancialPenaltySectionState createState() =>
      _FinancialPenaltySectionState();
}

class _FinancialPenaltySectionState extends State<FinancialPenaltySection> {
  bool _isSectionVisible = false;
  final TextEditingController _penaltyAmountController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isSectionVisible = !_isSectionVisible;
            });
          },
          child: Text(_isSectionVisible
              ? "Hide Financial Penalty Section"
              : "Show Financial Penalty Section"),
        ),
        if (_isSectionVisible)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              PriceField(
                placeholder: "Enter penalty amount",
                controller: _penaltyAmountController,
                isRequired: false,
              ),
            ],
          ),
      ],
    );
  }
}
