import 'package:flutter/material.dart';
import '../constants/strings/financial_penalty_strings.dart'; // Import the strings file

class PVFinancialPenaltySection extends StatefulWidget {
  final Map<String, dynamic> pvData;

  const PVFinancialPenaltySection({super.key, required this.pvData});

  @override
  _PVFinancialPenaltySectionState createState() =>
      _PVFinancialPenaltySectionState();
}

class _PVFinancialPenaltySectionState extends State<PVFinancialPenaltySection> {
  bool showFinancialPenalty = true;

  @override
  Widget build(BuildContext context) {
    final hasFinancialPenalty = widget.pvData['finance_penalty'] == "Yes";
    final financialPenalty = widget.pvData['financialpenalty'] ?? {};

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
                ? _buildFinancialPenaltyDetails(financialPenalty)
                : const SizedBox.shrink())
            : _buildNoFinancialPenaltyMessage(),
      ],
    );
  }

  Widget _buildFinancialPenaltyDetails(Map<String, dynamic> financialPenalty) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildFinancialRow(
                FinancialPenaltyStrings
                    .penaltyNumber, // Use penalty number text
                financialPenalty['penaltynumber'] ?? "N/A"),
            _buildFinancialRow(
                FinancialPenaltyStrings
                    .penaltyAmount, // Use penalty amount text
                financialPenalty['penaltyamount'] ?? "N/A"),
            _buildFinancialRow(
                FinancialPenaltyStrings.penaltyDate, // Use penalty date text
                financialPenalty['penaltydate'] ?? "N/A"),
            _buildFinancialRow(
                FinancialPenaltyStrings
                    .paymentReceiptNumber, // Use receipt number text
                financialPenalty['paymentreceiptnumber'] ?? "N/A"),
            _buildFinancialRow(
                FinancialPenaltyStrings
                    .paymentReceiptDate, // Use receipt date text
                financialPenalty['paymentreceiptdate'] ?? "N/A"),
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
        FinancialPenaltyStrings
            .noFinancialPenaltyMessage, // Use no financial penalty message text
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
