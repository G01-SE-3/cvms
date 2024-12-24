import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/search_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/DropdownButton.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/date_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/latest_form.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Search Bar
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFBDC9AA),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InputField(
                controller: searchController,
                hintText: "Search",
                icon: Icons.search,
                color: const Color(0xFFBDC9AA),
                bordercolor: Colors.grey,
                isReadOnly: false,
                onIconPressed: () {
                  // Implement search functionality here
                },
              ),
            ),
          ),

          const SizedBox(width: 8.0),

          // Clear Button (Styled to match Filter by dropdown)
          Container(
            height: 48.0, // Matches the height of dropdownButton
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFBDC9AA), // Same as dropdownButton background color
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey), // Matches the dropdown border style
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    searchController.clear(); // Clears the search field
                  });
                },
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black, // Matches the dropdown text color
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8.0),

          // Filter Dropdown
          dropdownButton(
            selectedValue: null,
            hint: "Filter by",
            items: filterDropdownItems, // Defined in search_bar.dart or elsewhere
            onChanged: (value) {
              if (value == 'Latest') {
                // Show Latest Form dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LatestPopupForm();
                  },
                );
              } else if (value == 'Date') {
                // Show Date Filter dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DateFilterPopup();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
