import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation bars/widgets/navigation_bar.dart'; 
import 'package:cvms/presentation/screens/navigation bars/widgets/title_row.dart'; 
import 'package:cvms/presentation/screens/navigation%20bars/constants/Strings/GeneralAppBar.dart'; 
import 'package:cvms/presentation/screens/navigation%20bars/Sidebar.dart';
import 'package:cvms/presentation/screens/navigation bars/widgets/search_bar.dart'; 

class GeneralAppBar extends StatefulWidget {
  final bool search; 

  const GeneralAppBar({super.key, required this.search}); 

  @override
  State<GeneralAppBar> createState() => _GeneralAppBarState();
}

class _GeneralAppBarState extends State<GeneralAppBar> {
  int _selectedTabIndex = -1; // None selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 13.0),
                  child: title_row(false, context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: navigation_bar(tabs, _selectedTabIndex, (index) {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          widget.search 
              ? const CustomSearchBar()// Empty widget if search is true
              : const SizedBox() , // Show search bar if search is false
        ],
      ),
    );
  }
}
