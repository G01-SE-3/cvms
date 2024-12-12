import 'package:flutter/material.dart';
import '/presentation/screens/Appbars/widgets/filter_by_date.dart';
import '/presentation/screens/Appbars/widgets/filter_by_number.dart';





// Combined App Bar and Search Bar Widget
class AppBarWithSearch extends StatefulWidget {
  const AppBarWithSearch({super.key});

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  int _selectedTabIndex = 0;
  String selectedType = "type";
  String selectedFilter = "Filter by";

  final List<String> tabs = [
    "PV",
    "Inspectors",
    "Economic Operators",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Bar Section
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

          // Tabs Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: List.generate(
                tabs.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
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

          // Search Bar Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Search Bar with Type Dropdown
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFBDC9AA),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        // Search Field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              filled: true,
                              fillColor: const Color(0xFFBDC9AA),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                        ),
                        // Type Dropdown
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFBDC9AA),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton<String>(
                            value: selectedType,
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(value: "type", child: Text("type")),
                              DropdownMenuItem(value: "PV", child: Text("PV")),
                              DropdownMenuItem(value: "RC", child: Text("RC")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedType = value!;
                              });
                            },
                            dropdownColor: const Color(0xFFBDC9AA),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                // Filter Dropdown
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFBDC9AA),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
          value: null,
          hint: const Text("Filter by"),
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(
              value: "Latest",
              child: Text("Latest"),
            ),
            DropdownMenuItem(
              value: "Date",
              child: Text("Date"),
            ),
          ],
          onChanged: (value) {
            if (value == "Latest") {
              showDialog(
                context: context,
                builder: (context) => const LatestPopupForm(),
              );
            } else if (value == "Date") {
              showDialog(
                context: context,
                builder: (context) => const DateFilterPopup(),
              );
            }
          },
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
