import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/seizure.dart';
import '../../selection_globals.dart';

class SeizureSection extends StatefulWidget {
  final Function(Seizure, int)
      onSeizureUpdated; // Callback to update parent with seizure data

  const SeizureSection({super.key, required this.onSeizureUpdated});

  @override
  _SeizureSectionState createState() => _SeizureSectionState();
}

class _SeizureSectionState extends State<SeizureSection> {
  bool _canToggleSection = false; // Checkbox state
  bool _isSectionVisible = false; // Button toggle state

  final TextEditingController _seizureAmountController =
      TextEditingController();
  final TextEditingController _seizureQuantityController =
      TextEditingController();
  final TextEditingController _seizedGoodsController = TextEditingController();

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
                    seizureSelection = _isSectionVisible;
                  }
                });
              },
            ),
            const Text("Enable Seizure Section"),
          ],
        ),
        if (_canToggleSection)
          MaterialButton(
            onPressed: () {
              setState(() {
                _isSectionVisible = !_isSectionVisible;
                seizureSelection = _isSectionVisible;
              });
            },
            child: Text(
              _isSectionVisible
                  ? "Hide Seizure Section"
                  : "Show Seizure Section",
            ),
          ),
        if (_isSectionVisible && _canToggleSection)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Seizure Amount Input
              TextFormField(
                controller: _seizureAmountController,
                decoration: _buildInputDecoration("Enter seizure amount"),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _updateSeizureData();
                },
              ),
              const SizedBox(height: 12),

              // Seizure Quantity Input
              TextFormField(
                controller: _seizureQuantityController,
                decoration: _buildInputDecoration("Enter seizure quantity"),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _updateSeizureData();
                },
              ),
              const SizedBox(height: 12),

              // Seized Goods Input
              TextFormField(
                controller: _seizedGoodsController,
                decoration: _buildInputDecoration("Enter seized goods"),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _updateSeizureData();
                },
              ),
            ],
          ),
      ],
    );
  }

  void _updateSeizureData() {
    final seizure = Seizure(
      seizureAmount: _seizureAmountController.text,
      seizureQuantity: _seizureQuantityController.text,
      seizedGoods: _seizedGoodsController.text,
    );

    // Call the callback to update the parent widget with new seizure data
    widget.onSeizureUpdated(seizure, _getIndex());
  }

  int _getIndex() {
    // This is just a placeholder; you can use a unique identifier for each section
    return 0; // Change based on logic or use the parent to pass the correct index
  }

  InputDecoration _buildInputDecoration(String placeholder) {
    return InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFDDE5CD),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}
