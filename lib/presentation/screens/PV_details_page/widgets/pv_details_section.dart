import 'package:flutter/material.dart';
import '../constants/strings/details_strings.dart'; // Import the strings file

class PVDetailsSection extends StatelessWidget {
  final Map<String, dynamic> pvData;

  const PVDetailsSection({super.key, required this.pvData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFDDE5CD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              DetailsStrings.sectionTitle, // Use string from the constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                for (var key in [
                  DetailsStrings.pvNumber,
                  DetailsStrings.offenderName,
                  DetailsStrings.offenderCr,
                  DetailsStrings.pvIssueDate,
                  DetailsStrings.violationType,
                  DetailsStrings.inspectingOfficers,
                  DetailsStrings.totalNonFactorizationAmount,
                  DetailsStrings.totalIllegalProfit,
                  DetailsStrings.subsidizedGood,
                ]) ...[
                  _buildDetailRow(key,
                      pvData[key.toLowerCase().replaceAll(' ', '')] ?? "N/A"),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 0.8,
                    height: 10,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
