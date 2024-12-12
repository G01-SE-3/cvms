import 'package:flutter/material.dart';

class ClosureSection extends StatefulWidget {
  const ClosureSection({super.key});

  @override
  _ClosureSectionState createState() => _ClosureSectionState();
}

class _ClosureSectionState extends State<ClosureSection> {
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
              ? "Hide Closure Section"
              : "Show Closure Section"),
        ),
        if (_isSectionVisible)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Closure information is automatically added to this section.",
              ),
            ],
          ),
      ],
    );
  }
}
