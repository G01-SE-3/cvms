import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation bars/widgets/navigation_bar.dart'; 
import 'package:cvms/presentation/screens/navigation bars/widgets/title_row.dart'; 
import 'package:cvms/presentation/screens/navigation%20bars/constants/Strings/GeneralAppBar.dart'; 
import 'package:cvms/presentation/screens/navigation%20bars/Sidebar.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: title_row(true,context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: navigation_bar(tabs, _selectedTabIndex, (index) {
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