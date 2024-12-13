import 'package:flutter/material.dart';
import '../constants/strings/pv_legal_proceedings_strings.dart'; // Import the strings file

class PVLegalProceedingsSection extends StatefulWidget {
  final Map<String, dynamic> pvData;

  const PVLegalProceedingsSection({super.key, required this.pvData});

  @override
  _PVLegalProceedingsSectionState createState() =>
      _PVLegalProceedingsSectionState();
}

class _PVLegalProceedingsSectionState extends State<PVLegalProceedingsSection> {
  bool showLegalProceedings = true;

  @override
  Widget build(BuildContext context) {
    final hasLegalProceedings = widget.pvData['legal_proceedings'] == "Yes";
    final legalProceedings = widget.pvData['legalproceedings'] ?? {};

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              PVLegalProceedingsStrings.title, // Use title from constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            if (hasLegalProceedings)
              TextButton(
                onPressed: () {
                  setState(() {
                    showLegalProceedings = !showLegalProceedings;
                  });
                },
                child: Text(showLegalProceedings
                    ? PVLegalProceedingsStrings.hideProceedingsButton
                    : PVLegalProceedingsStrings.showProceedingsButton),
              ),
          ],
        ),
        hasLegalProceedings
            ? (showLegalProceedings
                ? _buildLegalProceedingsDetails(legalProceedings)
                : const SizedBox.shrink())
            : _buildNoLegalProceedingsMessage(),
      ],
    );
  }

  Widget _buildLegalProceedingsDetails(Map<String, dynamic> legalProceedings) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildLegalRow(PVLegalProceedingsStrings.referralToJusticeNumber,
                legalProceedings['referraltojusticenumber'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.referralToJusticeDate,
                legalProceedings['referraltojusticedate'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.jurisdiction,
                legalProceedings['jurisdiction'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.legalProvisions,
                legalProceedings['legalprovisions'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtDecisionNumber,
                legalProceedings['courtdecisionnumber'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtDecisionDate,
                legalProceedings['courtdecisiondate'] ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtImposedFineAmount,
                legalProceedings['courtimposedfineamount'] ?? "N/A"),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalRow(String label, String value) {
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

  Widget _buildNoLegalProceedingsMessage() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        PVLegalProceedingsStrings
            .noProceedingsMessage, // Use message from constants
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
