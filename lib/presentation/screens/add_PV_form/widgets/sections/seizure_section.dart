import 'package:flutter/material.dart';
import '../text_field.dart';

class SeizureSection extends StatefulWidget {
  const SeizureSection({Key? key}) : super(key: key);

  @override
  _SeizureSectionState createState() => _SeizureSectionState();
}

class _SeizureSectionState extends State<SeizureSection> {
  bool _isSectionVisible = false;
  final TextEditingController _seizedItemsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isSectionVisible = !_isSectionVisible;
            });
          },
          child: Text(_isSectionVisible
              ? "Hide Seizure Section"
              : "Show Seizure Section"),
        ),
        if (_isSectionVisible)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              CustomTextField(
                placeholder: "Enter seized items",
                controller: _seizedItemsController,
                isRequired: false,
              ),
            ],
          ),
      ],
    );
  }
}
