import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/closure.dart';
import '../../selection_globals.dart';

class ClosureSection extends StatefulWidget {
  final Closure? closure; // Optional Closure object for editing
  final Function(Closure? closure)
      onClosureUpdated; // Callback to pass Closure data

  const ClosureSection({
    Key? key,
    this.closure,
    required this.onClosureUpdated,
  }) : super(key: key);

  @override
  _ClosureSectionState createState() => _ClosureSectionState();
}

class _ClosureSectionState extends State<ClosureSection> {
  late bool _canToggleSection; // Checkbox state
  bool _isSectionVisible = false; // Button toggle state

  late TextEditingController _closureIdController;
  late TextEditingController _reopeningRequestNumberController;
  DateTime? _closureOrderDate;
  DateTime? _reportingDate;

  @override
  void initState() {
    super.initState();

    // Initialize controllers and values based on the provided Closure object
    final closure = widget.closure;
    _canToggleSection = closure != null;
    _closureIdController = TextEditingController(
      text: closure?.closureId.toString() ?? '',
    );
    _reopeningRequestNumberController = TextEditingController(
      text: closure?.reopeningRequestNumber ?? '',
    );
    _closureOrderDate = closure?.closureOrderDate;
    _reportingDate = closure?.reportingDate;
  }

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
                    initialDate: _closureOrderDate ?? DateTime.now(),
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
                    initialDate: _reportingDate ?? DateTime.now(),
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
          _reopeningRequestNumberController.text.trim();

      return Closure(
        closureId: closureId,
        reopeningRequestNumber:
            reopeningRequestNumber.isNotEmpty ? reopeningRequestNumber : null,
        closureOrderDate: _closureOrderDate ?? DateTime.now(),
        reportingDate: _reportingDate,
      );
    }
    return null;
  }
}
