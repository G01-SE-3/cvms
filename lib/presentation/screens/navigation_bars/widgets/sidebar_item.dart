import 'package:flutter/material.dart';

/// This widget represents a clickable item in a sidebar.
/// When tapped, it navigates to the specified route.
///
/// **Usage Example:**
/// ```dart
/// sidebar_item(
///   context,
///   Icons.home,  // Icon for the item
///   'Home',      // Label for the item
///   const HomePage(),  // Destination widget to navigate to
/// )
/// ```

Widget sidebar_item(BuildContext context, IconData icon, String text, Widget navigationRoute) {
  return InkWell(
    onTap: () {
      // Navigate to the specified route when the item is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigationRoute),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),  
          const SizedBox(width: 16.0),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),  
          ),
        ],
      ),
    ),
  );
}
