import 'package:flutter/material.dart';

class ClosureSection extends StatefulWidget {
  const ClosureSection({Key? key}) : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Closure information is automatically added to this section.",
              ),
            ],
          ),
      ],
    );
  }
}
