import 'package:flutter/material.dart';

Widget dropdownButton({
  required String? selectedValue,
  required List<DropdownMenuItem<String>> items,
  required String hint,
  required Function(String?) onChanged,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFBDC9AA),
      borderRadius: BorderRadius.circular(8.0),
    ),
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
    child: DropdownButton<String>(
      value: selectedValue,
      hint: Text(hint),
      underline: const SizedBox(),
      items: items,
      onChanged: onChanged,
    ),
  );
}