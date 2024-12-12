import 'package:flutter/material.dart';

class NationalCardRegistrationSection extends StatefulWidget {
  const NationalCardRegistrationSection({super.key});

  @override
  _NationalCardRegistrationSectionState createState() =>
      _NationalCardRegistrationSectionState();
}

class _NationalCardRegistrationSectionState
    extends State<NationalCardRegistrationSection> {
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
              ? "Hide National Card Registration Section"
              : "Show National Card Registration Section"),
        ),
        if (_isSectionVisible)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Details of national card registration can be added here.",
              ),
            ],
          ),
      ],
    );
  }
}
