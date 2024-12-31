import 'package:flutter/material.dart';

Widget Listtile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isSelected = false,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: isSelected ? Colors.black : Colors.grey, // Icon color
    ),
    title: Text(
      title,
      style: TextStyle(
        color:  Colors.black, 
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold text for selected item
      ),
    ),
    onTap: onTap, 
    tileColor: isSelected ? Colors.black.withOpacity(0.1) : null, // Background color for selected item
  );
}
