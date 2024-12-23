import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/search_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/DropdownButton.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/date_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/latest_form.dart';

class CustomSearchBar extends StatefulWidget {
  final String PageName; 
   const CustomSearchBar({super.key,this.PageName = 'none'});
  
//PageName will be used to differentiate on what table to search in based on the page
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String? selectedType = "type";
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Search Bar with flexible space
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
                onIconPressed: () {},
              ),
            ),
          ),

          const SizedBox(width: 8.0),

          dropdownButton(
            selectedValue: selectedType,
            hint: "Type",
            items: typeDropdownItems,
            onChanged: (value) {
              setState(() {
                selectedType = value;
              });
            },
          ),

          const SizedBox(width: 8.0),

          dropdownButton(
            selectedValue: null,
            hint: "Filter by",
            items: filterDropdownItems,
            onChanged: (value) {
              if (value == 'Latest') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LatestPopupForm();
                  },
                );
              } else {
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
