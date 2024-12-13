import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/seizure.dart'; // Import the Seizure entity
import '../constants/strings/pv_seizures_strings.dart'; // Import the strings file

class PVSeizuresSection extends StatefulWidget {
  final List<Seizure> seizures; // Use List<Seizure> instead of raw map data

  const PVSeizuresSection({super.key, required this.seizures});

  @override
  _PVSeizuresSectionState createState() => _PVSeizuresSectionState();
}

class _PVSeizuresSectionState extends State<PVSeizuresSection> {
  bool showSeizures = true;

  @override
  Widget build(BuildContext context) {
    final hasSeizures = widget.seizures.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              PVSeizuresStrings.title, // Use the title from constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            if (hasSeizures)
              TextButton(
                onPressed: () {
                  setState(() {
                    showSeizures = !showSeizures;
                  });
                },
                child: Text(
                  showSeizures
                      ? PVSeizuresStrings.hideSeizuresButton
                      : PVSeizuresStrings.showSeizuresButton,
                ),
              ),
          ],
        ),
        hasSeizures
            ? (showSeizures ? _buildSeizuresTable() : const SizedBox.shrink())
            : _buildDisabledSeizuresMessage(),
      ],
    );
  }

  Widget _buildSeizuresTable() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildSeizureRow(
              PVSeizuresStrings.seizureNumber,
              PVSeizuresStrings.amount,
              PVSeizuresStrings.quantity,
            ),
            const Divider(),
            for (var seizure in widget.seizures)
              _buildSeizureRow(seizure.seizureAmount, seizure.seizureQuantity,
                  seizure.seizedGoods),
          ],
        ),
      ),
    );
  }

  Widget _buildSeizureRow(String number, String amount, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(number, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(amount, style: const TextStyle(color: Colors.black54)),
          Text(quantity, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildDisabledSeizuresMessage() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        PVSeizuresStrings.noSeizuresMessage, // Use message from constants
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
