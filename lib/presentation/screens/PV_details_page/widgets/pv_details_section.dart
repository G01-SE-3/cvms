import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import '../constants/strings/details_strings.dart';

class PVDetailsSection extends StatelessWidget {
  final PV pv;

  const PVDetailsSection({super.key, required this.pv});

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
                _buildDetailRow(
                    DetailsStrings.pvNumber, pv.pvNumber.toString()),
                _buildDetailRow(DetailsStrings.offenderName,
                    pv.offender?.name ?? "N/A"), // TO BE UPDATED
                _buildDetailRow(DetailsStrings.offenderCr,
                    pv.offender?.name ?? "N/A"), // TO BE UPDATED
                _buildDetailRow(
                    DetailsStrings.pvIssueDate, pv.issueDate.toString()),
                _buildDetailRow(DetailsStrings.violationType, pv.violationType),
                _buildDetailRow(
                    DetailsStrings.inspectingOfficers,
                    pv.inspectors
                        .map((e) => "${e.inspectorName} ${e.inspectorSurname}")
                        .join(", ")), // TO BE UPDATED
                _buildDetailRow(DetailsStrings.totalNonFactorizationAmount,
                    pv.totalNonFixed?.toString() ?? "N/A"),
                _buildDetailRow(DetailsStrings.totalIllegalProfit,
                    pv.totalReparationAmount?.toString() ?? "N/A"),
                _buildDetailRow(
                    DetailsStrings.subsidizedGood,
                    pv.subsidizedGood != null
                        ? pv.subsidizedGood.toString()
                        : "N/A"),
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
