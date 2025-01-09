import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/search_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/date_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/forms/latest_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/DropdownButton.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';

List<DropdownMenuItem<String>> typeDropdownItems = [
  DropdownMenuItem(
    value: SearchStrings.type,
    child: Text(SearchStrings.type),
  ),
  DropdownMenuItem(
    value: SearchStrings.pv,
    child: Text(SearchStrings.pv),
  ),
  DropdownMenuItem(
    value: SearchStrings.rc,
    child: Text(SearchStrings.rc),
  ),
];
List<DropdownMenuItem<String>> filterDropdownItems = [
  DropdownMenuItem(
    value: SearchStrings.latest,
    child: Text(SearchStrings.latest),
  ),
  DropdownMenuItem(
    value: SearchStrings.date,
    child: Text(SearchStrings.date),
  ),
];

/// General rule for using `CustomSearchBar` widget:
///
/// To include this widget in your code:
/// 1. Simply add `CustomSearchBar()` where you want the search bar to appear.
/// 2. This widget provides a search functionality where the user can input a number to search.
/// 3. It also allows filtering by "latest" or "date", which triggers different forms.
///
/// Example usage:
/// ```dart
/// CustomSearchBar()
/// ```
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pvController = Provider.of<PVController>(context, listen: false);

    void onSearch() async {
      // Validate the input before searching
      String? validationError = validateInput(searchController.text);
      if (validationError != null) {
        showErrorMessage(
            context, validationError); // Display validation error message
        return;
      }

      try {
        // Parse the input text as an integer (e.g., PV number) for the search
        int pvNumber = int.parse(searchController.text);

        // Call the controller to search for PVs using the parsed number
        List<PV> searchResults = await pvController.searchPVsByNumber(pvNumber);

        if (searchResults.isEmpty) {
          // If no PVs are found, show a "no results" message
          handleNoPVFound(context);
          return;
        }

        // If PVs are found, navigate to the PVListPage to display the results
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PVListPage(
              searchResults:
                  searchResults, // Pass search results to the next screen
            ),
          ),
        );
      } catch (e) {
        // If an error occurs, such as a parsing error, show an error message
        showErrorMessage(context, "${SearchStrings.error}${e.toString()}");
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFBDC9AA),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InputField(
                controller: searchController,
                hintText: SearchStrings.search,
                icon: Icons.search,
                color: const Color(0xFFBDC9AA),
                bordercolor: Colors.grey,
                isReadOnly: false,
                onIconPressed: onSearch, // Trigger search when icon is pressed
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            height: 48.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFBDC9AA),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    searchController
                        .clear(); // Clear the search input when tapped
                  });
                  // Navigate to Pv List page to refresh old content and clear search result from the list
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PVListPage(),
                    ),
                  );
                },
                child: Text(
                  SearchStrings.clear,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          dropdownButton(
            selectedValue: null,
            hint: SearchStrings.filterBy,
            items: filterDropdownItems,
            onChanged: (value) {
              // Handle filter option selection
              if (value == SearchStrings.latest) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LatestPopupForm();
                  },
                );
              } else if (value == SearchStrings.date) {
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
