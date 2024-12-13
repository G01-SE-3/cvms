import 'package:flutter/material.dart';

class RcField extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool isRcExisting, String? error) onRcChanged;

  const RcField({
    super.key,
    required this.controller,
    required this.onRcChanged,
  });

  @override
  State<RcField> createState() => _RcFieldState();
}

class _RcFieldState extends State<RcField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Enter RC Number",
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
      style: const TextStyle(color: Color(0xFF545837)),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        if (value.isNotEmpty) {
          if (value == "123456") {
            widget.onRcChanged(true, null);
          } else {
            widget.onRcChanged(false, "Non-existing economic operator.");
          }
        } else {
          widget.onRcChanged(false, null);
        }
      },
    );
  }
}
