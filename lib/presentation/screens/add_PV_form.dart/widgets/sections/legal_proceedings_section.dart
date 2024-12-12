import 'package:flutter/material.dart';

class LegalProceedingsSection extends StatefulWidget {
  const LegalProceedingsSection({super.key});

  @override
  _LegalProceedingsSectionState createState() =>
      _LegalProceedingsSectionState();
}

class _LegalProceedingsSectionState extends State<LegalProceedingsSection> {
  bool _isSectionVisible = false;

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
              ? "Hide Legal Proceedings Section"
              : "Show Legal Proceedings Section"),
        ),
        if (_isSectionVisible)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Details of legal proceedings are added here.",
              ),
            ],
          ),
      ],
    );
  }
}
