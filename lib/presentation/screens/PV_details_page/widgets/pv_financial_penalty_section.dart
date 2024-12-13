import 'package:flutter/material.dart';
import '../constants/strings/financial_penalty_strings.dart'; // Import the strings file
import 'package:cvms/domain/entities/pv/financial_penalty.dart'; // Import the FinancialPenalty class

class PVFinancialPenaltySection extends StatefulWidget {
  final FinancialPenalty?
      financialPenalty; // Use the entity instead of raw data

  const PVFinancialPenaltySection({super.key, required this.financialPenalty});

  @override
  _PVFinancialPenaltySectionState createState() =>
      _PVFinancialPenaltySectionState();
}

class _PVFinancialPenaltySectionState extends State<PVFinancialPenaltySection> {
  bool showFinancialPenalty = true;

  @override
  Widget build(BuildContext context) {
    final hasFinancialPenalty = widget.financialPenalty != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              FinancialPenaltyStrings.sectionTitle, // Use string from constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            if (hasFinancialPenalty)
              TextButton(
                onPressed: () {
                  setState(() {
                    showFinancialPenalty = !showFinancialPenalty;
                  });
                },
                child: Text(showFinancialPenalty
                    ? FinancialPenaltyStrings.hideButton // Use hide button text
                    : FinancialPenaltyStrings
                        .showButton), // Use show button text
              ),
          ],
        ),
        hasFinancialPenalty
            ? (showFinancialPenalty
                ? _buildFinancialPenaltyDetails(widget.financialPenalty!)
                : const SizedBox.shrink())
            : _buildNoFinancialPenaltyMessage(),
      ],
    );
  }

  Widget _buildFinancialPenaltyDetails(FinancialPenalty financialPenalty) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildFinancialRow(FinancialPenaltyStrings.penaltyAmount,
                financialPenalty.penaltyAmount?.toString() ?? "N/A"),
            _buildFinancialRow(FinancialPenaltyStrings.penaltyDate,
                financialPenalty.penaltyDate?.toString() ?? "N/A"),
            _buildFinancialRow(FinancialPenaltyStrings.paymentReceiptNumber,
                financialPenalty.paymentReceiptNumber ?? "N/A"),
            _buildFinancialRow(FinancialPenaltyStrings.paymentReceiptDate,
                financialPenalty.paymentReceiptDate?.toString() ?? "N/A"),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildNoFinancialPenaltyMessage() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        FinancialPenaltyStrings.noFinancialPenaltyMessage,
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
