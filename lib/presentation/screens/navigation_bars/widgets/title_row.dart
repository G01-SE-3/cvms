import 'package:flutter/material.dart';

Widget title_row(bool isHome, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Drawer Icon
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                );
              },
            ),
            const SizedBox(width: 8.0),
            const Text(
              "CVMS",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        isHome
            ? const SizedBox() // Empty widget for consistent spacing
            : Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.black,
                    onPressed: () {
                      // Navigate to home
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: Colors.black,
                    onPressed: () {
                      // Navigate to settings
                    },
                  ),
                ],
              ),
      ],
    ),
  );
}
