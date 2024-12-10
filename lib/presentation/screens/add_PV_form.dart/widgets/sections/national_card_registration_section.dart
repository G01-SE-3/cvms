import 'package:flutter/material.dart';

class NationalCardRegistrationSection extends StatefulWidget {
  const NationalCardRegistrationSection({Key? key}) : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Details of national card registration can be added here.",
              ),
            ],
          ),
      ],
    );
  }
}
