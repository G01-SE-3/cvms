import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<Widget> fields;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.fields,
  }) : super(key: key);

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isCheckboxChecked = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              value: _isCheckboxChecked,
              activeColor: const Color(0xFF545837),
              onChanged: (bool? value) {
                setState(() {
                  _isCheckboxChecked = value ?? false;
                  if (!_isCheckboxChecked) {
                    _isExpanded = false;
                  }
                });
              },
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: _isCheckboxChecked
                          ? const Color(0xFF545837)
                          : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            ),
            if (_isCheckboxChecked)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isExpanded ? "Hide Details" : "Show Details",
                        style: TextStyle(
                          color: const Color(0xFF545837),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: const Color(0xFF545837),
                      ),
                    ],
                  ),
                ),
              ),
            if (_isCheckboxChecked && _isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: widget.fields
                      .expand((field) => [
                            field,
                            if (widget.fields.last != field) ...[
                              Divider(
                                color: const Color(0xFFDDE5CD),
                                thickness: 1,
                              ),
                            ],
                          ])
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
