import 'package:flutter/material.dart';

/// This widget displays a row of tabs. When a tab is tapped, it updates the selected tab
/// and can trigger navigation or other actions.
/// 
/// **Usage Example:**
/// ```dart
/// navigation_bar(
///   context,
///   tabs: ['Home', 'Settings', 'Profile'],
///   selectedTabIndex: 0,
///   onTap: (index) {
///     // Handle tab selection here
///   },
/// )
/// ```

Widget navigation_bar(BuildContext context, List<String> tabs,
    int selectedTabIndex, Function(int) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        tabs.length,  // Generate one tab for each string in the list
        (index) => GestureDetector(
          onTap: () {
            onTap(index);  // Call onTap when the tab is tapped
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display the tab name
                Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: selectedTabIndex == index
                        ? FontWeight.bold  // Bold for selected tab
                        : FontWeight.normal,  // Normal for others
                    color: selectedTabIndex == index
                        ? Colors.black  // Black for selected tab
                        : Colors.grey,  // Grey for others
                  ),
                ),
                // Show underline for the selected tab
                if (selectedTabIndex == index)
                  Container(
                    height: 2,
                    width: 40,
                    margin: const EdgeInsets.only(top: 4.0),
                    color: Colors.black,  // Underline color
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
