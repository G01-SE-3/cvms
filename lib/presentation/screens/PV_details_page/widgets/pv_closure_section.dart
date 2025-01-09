import 'package:flutter/material.dart';
import '../constants/strings/closure_strings.dart';
import 'package:cvms/domain/entities/pv/closure.dart'; // Import the Closure entity

class PVClosureSection extends StatefulWidget {
  final Closure?
      closure; // Make it nullable, as the closure data might be absent

  const PVClosureSection({super.key, required this.closure});

  @override
  _PVClosureSectionState createState() => _PVClosureSectionState();
}

class _PVClosureSectionState extends State<PVClosureSection> {
  bool showClosure = true;

  @override
  Widget build(BuildContext context) {
    final closure = widget.closure; // Access the closure data directly

    // Check if closure is present (not null) and has necessary fields populated
    final hasClosure = closure != null &&
        (closure.reopeningRequestNumber != null ||
            closure.reportingDate != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
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
            ? (showClosure
                ? _buildClosureDetails(closure)
                : const SizedBox.shrink())
            : _buildDisabledClosureMessage(),
      ],
    );
  }

  Widget _buildClosureDetails(Closure closure) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildDetailRow(ClosureStrings.closureOrderNumber,
                closure.closureId.toString()),
            _buildDetailRow(ClosureStrings.closureOrderDate,
                closure.closureOrderDate.toString()),
            _buildDetailRow(ClosureStrings.reopeningRequestNumber,
                closure.reopeningRequestNumber ?? "N/A"),
            _buildDetailRow(ClosureStrings.reportingNumber,
                closure.reportingDate?.toString() ?? "N/A"),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildDisabledClosureMessage() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        ClosureStrings.noClosureMessage, // Use string from the constants
        style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
    );
  }
}
