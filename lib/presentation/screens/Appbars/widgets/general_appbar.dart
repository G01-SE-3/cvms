import 'package:flutter/material.dart';

class CVMSAppBar extends StatefulWidget {
  const CVMSAppBar({super.key});

  @override
  State<CVMSAppBar> createState() => _GeneralAppBarState();
}

class _GeneralAppBarState extends State<CVMSAppBar> {
  int _selectedTabIndex = -1; // None selected by default

  final List<String> tabs = [
    "PV",
    "Inspectors",
    "Economic Operators",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Unified App Bar Block
          Container(
            color: Colors.white, // Shared white background for both rows
            child: Column(
              children: [
                // First Row (Title and Icons)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "CVMS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Row(
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
                ),
                // Second Row (Clickable Tabs)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      tabs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = index;
                          });

                          // Navigate based on the selected index
                          switch (index) {
                            case 0:
                              // Navigate to the first page
                              break;
                            case 1:
                              // Navigate to the second page
                              break;
                            case 2:
                              // Navigate to the third page
                              break;
                            default:
                              break;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: _selectedTabIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: _selectedTabIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              if (_selectedTabIndex == index)
                                Container(
                                  height: 2,
                                  width: 40,
                                  margin: const EdgeInsets.only(top: 4.0),
                                  color: Colors.black,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
