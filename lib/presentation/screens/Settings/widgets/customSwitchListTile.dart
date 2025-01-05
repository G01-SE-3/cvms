import 'package:flutter/material.dart';

Widget customSwitchListTile({
  required bool value,
  required String title,
  required ValueChanged<bool> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 40, 
      child: SwitchListTile(
        value: value,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.w500,
          ),
        ),
        activeColor: Colors.black, 
        activeTrackColor: Colors.black.withOpacity(0.6), 
        onChanged: onChanged,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        dense: true, 
      ),
    ),
  );
}
