import 'package:cvms/presentation/screens/Settings/settings.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';

/// This widget represents the title row at the top of the screen.
/// It includes a drawer icon on the left and a "CVMS" title.
/// If not on the Home page, it adds Home and Settings buttons for navigation.
///
/// **Usage Example:**
/// ```dart
/// title_row(true, context) // for Home page
/// title_row(false, context) // for other pages
/// ```

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
            ? const SizedBox() // Empty widget for consistent spacing on Home page
            : Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to Home page
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()), // Navigate to Settings page
                      );
                    },
                  ),
                ],
              ),
      ],
    ),
  );
}
