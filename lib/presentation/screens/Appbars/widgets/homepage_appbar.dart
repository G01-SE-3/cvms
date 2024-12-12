import 'package:flutter/material.dart';

class CVMSAppBar extends StatefulWidget {
  const CVMSAppBar({super.key});

  @override
  State<CVMSAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<CVMSAppBar> {
  int _selectedTabIndex = -1; // For tracking the selected tab

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CVMS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
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
          // Content Area (For future content)
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: const Center(
                child: Text(
                  "Content goes here",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
