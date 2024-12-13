import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/closure.dart';
import '../../selection_globals.dart';

class ClosureSection extends StatefulWidget {
  final Function(Closure? closure)
      onClosureUpdated; // Callback to pass Closure data
  const ClosureSection({super.key, required this.onClosureUpdated});

  @override
  _ClosureSectionState createState() => _ClosureSectionState();
}

class _ClosureSectionState extends State<ClosureSection> {
  bool _canToggleSection = false; // Checkbox state
  bool _isSectionVisible = false; // Button toggle state

  final TextEditingController _closureIdController = TextEditingController();
  final TextEditingController _reopeningRequestNumberController =
      TextEditingController();
  DateTime? _closureOrderDate;
  DateTime? _reportingDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _canToggleSection,
              onChanged: (value) {
                setState(() {
                  _canToggleSection = value!;
                  if (!_canToggleSection) {
                    _isSectionVisible = false;
                    closureSelection = _isSectionVisible;
                  }
                });
                // Update the Closure state to indicate whether it's selected or not
                widget.onClosureUpdated(
                    _canToggleSection ? _buildClosureData() : null);
              },
            ),
            const Text("Enable Closure Section"),
          ],
        ),
        if (_canToggleSection)
          MaterialButton(
            onPressed: () {
              setState(() {
                _isSectionVisible = !_isSectionVisible;
                closureSelection = _isSectionVisible;
              });
            },
            child: Text(
              _isSectionVisible
                  ? "Hide Closure Section"
                  : "Show Closure Section",
            ),
          ),
        if (_isSectionVisible && _canToggleSection)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Closure Information:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Closure ID Input
              TextFormField(
                controller: _closureIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Closure ID",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFDDE5CD),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Reopening Request Number Input
              TextFormField(
                controller: _reopeningRequestNumberController,
                decoration: InputDecoration(
                  hintText: "Enter Reopening Request Number",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFDDE5CD),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Closure Order Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _closureOrderDate = selectedDate;
                    });
                    widget.onClosureUpdated(_buildClosureData());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: const Color(0xFFDDE5CD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _closureOrderDate == null
                      ? "Select Closure Order Date"
                      : "Closure Order Date: ${_closureOrderDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),

              // Reporting Date Picker
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _reportingDate = selectedDate;
                    });
                    widget.onClosureUpdated(_buildClosureData());
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: const Color(0xFFDDE5CD),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  _reportingDate == null
                      ? "Select Reporting Date"
                      : "Reporting Date: ${_reportingDate!.toLocal()}"
                          .split(' ')[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Closure? _buildClosureData() {
    if (_canToggleSection) {
      final closureId = int.tryParse(_closureIdController.text.trim()) ?? 0;
      final reopeningRequestNumber =
          int.tryParse(_reopeningRequestNumberController.text.trim()) ?? 0;

      return Closure(
        closureId: closureId,
        reopeningRequestNumber: reopeningRequestNumber.toString(),
        closureOrderDate: _closureOrderDate ?? DateTime.now(),
        reportingDate: _reportingDate ?? DateTime.now(),
      );
    }
    return null;
  }
}
