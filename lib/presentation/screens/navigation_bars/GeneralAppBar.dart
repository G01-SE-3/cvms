import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/navigation_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title_row.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/custom_search_bar.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';


/*
File Name: general_app_bar.dart
Purpose: This file defines the `GeneralAppBar` widget, which displays a navigation bar with tabs and an optional search bar.
It also handles navigation to different pages based on the selected tab.
Author: 
- Team Member 1 [hiba.ayadi@ensia.edu.dz]


Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

class GeneralAppBar extends StatefulWidget {
  final bool search; // Determines if the search bar should be shown
  final int initialTabIndex; // The initial tab index to display

  const GeneralAppBar({
    super.key,
    required this.search,
    this.initialTabIndex = -1,
  });

  @override
  _GeneralAppBarState createState() => _GeneralAppBarState();
}

class _GeneralAppBarState extends State<GeneralAppBar> {
  late int _selectedTabIndex; // Keeps track of the currently selected tab index

  // List of tab titles
  final List<String> tabs = [
    GeneralAppbarStrings.home,
    GeneralAppbarStrings.pvList,
    GeneralAppbarStrings.inspectors,
    GeneralAppbarStrings.businessOffenders,
    GeneralAppbarStrings.individualOffenders,
  ];

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex; // Set the initial tab index from the widget
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4A4A31), // Background color for the app bar
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0, vertical: 8.0), // Padding for the title row
            child: title_row(false, context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0), // Padding for the navigation bar
            child: navigation_bar(
              context,
              tabs,
              _selectedTabIndex,
              (index) {
                setState(() {
                  _selectedTabIndex = index; // Update the selected tab index
                });
                _navigateToPage(index, context); // Navigate to the corresponding page
              },
            ),
          ),
          const SizedBox(height: 8), // Small space below the navigation bar
          widget.search ? const CustomSearchBar() : const SizedBox(), // Show search bar if needed
        ],
      ),
    );
  }

  /// Navigates to the page corresponding to the selected tab index.
  /// This method uses the index to determine which page to display.
  void _navigateToPage(int index, BuildContext context) {
    // List of pages corresponding to each tab index
    List<Widget> pages = [
      const HomePage(),
      const PVListPage(),
      const InspectorsListPage(),
      const BusinessOffenderList(),
      const IndividualOffenderList(),
    ];

    // Ensure the index is within the valid range of pages and navigate to the selected page
    if (index < pages.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }
}
