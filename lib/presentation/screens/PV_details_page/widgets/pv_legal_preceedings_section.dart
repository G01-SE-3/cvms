import 'package:flutter/material.dart';
import '../constants/strings/pv_legal_proceedings_strings.dart'; // Import the strings file
import 'package:cvms/domain/entities/pv/legal_proceedings.dart'; // Import the LegalProceedings class

class PVLegalProceedingsSection extends StatefulWidget {
  final LegalProceedings?
      legalProceedings; // Use the entity instead of raw data

  const PVLegalProceedingsSection({super.key, required this.legalProceedings});

  @override
  _PVLegalProceedingsSectionState createState() =>
      _PVLegalProceedingsSectionState();
}

class _PVLegalProceedingsSectionState extends State<PVLegalProceedingsSection> {
  bool showLegalProceedings = true;

  @override
  Widget build(BuildContext context) {
    final hasLegalProceedings = widget.legalProceedings != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
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
                ? _buildLegalProceedingsDetails(widget.legalProceedings!)
                : const SizedBox.shrink())
            : _buildNoLegalProceedingsMessage(),
      ],
    );
  }

  Widget _buildLegalProceedingsDetails(LegalProceedings legalProceedings) {
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
                legalProceedings.referralToJusticeNumber ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.referralToJusticeDate,
                legalProceedings.referralToJusticeDate?.toString() ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.jurisdiction,
                legalProceedings.jurisdiction ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.legalProvisions,
                legalProceedings.legalProvisions ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtDecisionNumber,
                legalProceedings.courtDecisionNumber ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtDecisionDate,
                legalProceedings.courtDecisionDate?.toString() ?? "N/A"),
            _buildLegalRow(PVLegalProceedingsStrings.courtImposedFineAmount,
                legalProceedings.courtImposedFineAmount?.toString() ?? "N/A"),
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
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        PVLegalProceedingsStrings
            .noProceedingsMessage, // Use message from constants
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
