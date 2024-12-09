import 'package:flutter/material.dart';
ListTile buildMenuTile(IconData icon, double size, Color color, [String? title]) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: size,
      ),
      title: title != null
          ? Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )
          : null,
      onTap: () {},
    );
  }



