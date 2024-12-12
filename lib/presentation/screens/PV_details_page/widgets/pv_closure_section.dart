import 'package:flutter/material.dart';
import '../constants/strings/closure_strings.dart';

class PVClosureSection extends StatefulWidget {
  final Map<String, dynamic> pvData;

  const PVClosureSection({super.key, required this.pvData});

  @override
  _PVClosureSectionState createState() => _PVClosureSectionState();
}

class _PVClosureSectionState extends State<PVClosureSection> {
  bool showClosure = true;

  @override
  Widget build(BuildContext context) {
    final hasClosure = widget.pvData['closure'] == "Yes";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              ClosureStrings.sectionTitle, // Use string from the constants
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            if (hasClosure)
              TextButton(
                onPressed: () {
                  setState(() {
                    showClosure = !showClosure;
                  });
                },
                child: Text(showClosure
                    ? ClosureStrings
                        .hideClosure // Use string from the constants
                    : ClosureStrings
                        .showClosure), // Use string from the constants
              ),
          ],
        ),
        hasClosure
            ? (showClosure ? _buildClosureDetails() : const SizedBox.shrink())
            : _buildDisabledClosureMessage(),
      ],
    );
  }

  Widget _buildClosureDetails() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildDetailRow(ClosureStrings.closureOrderNumber,
                widget.pvData['closureordernumber']),
            _buildDetailRow(ClosureStrings.closureOrderDate,
                widget.pvData['closureorderdate']),
            _buildDetailRow(ClosureStrings.reopeningRequestNumber,
                widget.pvData['reopeningrequestnumber']),
            _buildDetailRow(ClosureStrings.reportingNumber,
                widget.pvData['reportingnumber']),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, dynamic value) {
    final displayValue = value != null ? value.toString() : "N/A";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style:
                const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          Text(
            displayValue,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildDisabledClosureMessage() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        ClosureStrings.noClosureMessage, // Use string from the constants
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
