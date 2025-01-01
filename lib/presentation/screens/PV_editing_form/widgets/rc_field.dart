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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjust the width as needed
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: "Enter RC Number",
            labelStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: const Color(0xFFDDE5CD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green),
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
        ),
      ),
    );
  }
}
