import 'package:flutter/material.dart';
import '../constants/strings/pv_national_card_strings.dart'; // Import the strings file

class PVNationalCardSection extends StatefulWidget {
  final Map<String, dynamic> pvData;

  PVNationalCardSection({required this.pvData});

  @override
  _PVNationalCardSectionState createState() => _PVNationalCardSectionState();
}

class _PVNationalCardSectionState extends State<PVNationalCardSection> {
  bool showNationalCardDetails = true;

  @override
  Widget build(BuildContext context) {
    final hasNationalCard =
        widget.pvData['national_card_registration'] == "Yes";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              PVNationalCardStrings.title, // Use title from constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Spacer(),
            if (hasNationalCard)
              TextButton(
                onPressed: () {
                  setState(() {
                    showNationalCardDetails = !showNationalCardDetails;
                  });
                },
                child: Text(
                  showNationalCardDetails
                      ? PVNationalCardStrings.hideDetailsButton
                      : PVNationalCardStrings.showDetailsButton,
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (hasNationalCard && showNationalCardDetails)
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: _buildNationalCardDetails(),
            ),
          )
        else if (!hasNationalCard)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              PVNationalCardStrings
                  .noNationalCardMessage, // Use message from constants
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNationalCardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(PVNationalCardStrings.registrationDate,
            widget.pvData['registrationdate']),
        _buildDetailRow(PVNationalCardStrings.registrationNumber,
            widget.pvData['registrationnumber']),
      ],
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.black54)),
          Text(value ?? "N/A", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
