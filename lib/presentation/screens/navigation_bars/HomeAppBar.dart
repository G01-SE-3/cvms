import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/navigation_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title_row.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int _selectedTabIndex = -1; // None selected by default

  // Define the tabs using constants from GeneralAppbarStrings
  final List<String> tabs = [
    GeneralAppbarStrings.pvList,
    GeneralAppbarStrings.inspectors,
    GeneralAppbarStrings.businessOffenders, // Or Economic Operators if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: title_row(true, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: navigation_bar(context, tabs, _selectedTabIndex, (index) {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                    // Handle navigation based on the selected index (optional)
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
