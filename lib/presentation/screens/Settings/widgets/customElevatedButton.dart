import 'package:flutter/material.dart';


/// Creates a customizable elevated button with an icon and text, allowing
/// for flexible styling and behavior such as action handling and background color.
Widget customElevatedButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
    Color backgroundColor = const Color(0xFF6C845E), 
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(160, 48),
        alignment: Alignment.center,
      ),
    );
  }

