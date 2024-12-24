import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/navigation_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title_row.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/custom_search_bar.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';

class GeneralAppBar extends StatefulWidget {
  final bool search;
  final int initialTabIndex;
  final String PageName; // New parameter to accept initial index

  const GeneralAppBar(
      {super.key,
      required this.search,
      this.initialTabIndex = -1,
      this.PageName = 'none'}); // Default to 0

  @override
  _GeneralAppBarState createState() => _GeneralAppBarState();
}

class _GeneralAppBarState extends State<GeneralAppBar> {
  late int _selectedTabIndex; // Use late modifier to initialize later

  // Define the tabs for navigation
  final List<String> tabs = [
    'Home',
    'PV List',
    'Inspectors',
    'Business Offenders',
    'Individual Offenders'
  ];

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex; // Set the initial index
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4A4A31),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0, vertical: 8.0), // Decreased vertical padding
            child: title_row(false, context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0), // Decreased horizontal padding
            child: navigation_bar(context, tabs, _selectedTabIndex, (index) {
              setState(() {
                _selectedTabIndex = index; // Update selected index
              });
              _navigateToPage(index, context); // Navigate to the selected page
            }),
          ),
          const SizedBox(height: 8), // Decreased height
          widget.search ? CustomSearchBar(PageName: widget.PageName) : const SizedBox(),
        ],
      ),
    );
  }

  void _navigateToPage(int index, BuildContext context) {
    // Define the list of pages corresponding to each tab
    List<Widget> pages = [
      const HomePage(),
      const PVListPage(),
      const InspectorsListPage(),
      const BusinessOffenderList(),
      const IndividualOffenderList(),
    ];

    // Ensure the index is valid and navigate to the selected page
    if (index < pages.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }
}
