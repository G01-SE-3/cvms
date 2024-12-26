import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/validation.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/input_field.dart';

class CustomSearchBar extends StatefulWidget {
  final String pageName;
  const CustomSearchBar({super.key, this.pageName = 'PV'});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Access PVController using Provider
    final pvController = Provider.of<PVController>(context, listen: false);

void onSearch() async {
  // Validate input
  String? validationError = validateInput(searchController.text);
  if (validationError != null) {
    showErrorMessage(context, validationError); // Show error message if validation fails
    return;
  }


  try {
    // Parse input to integer
    int pvNumber = int.parse(searchController.text);

    // Search for PVs
    List<PV> searchResults = await pvController.searchPVsByNumber(pvNumber);
  
    // Handle no results found
    if (searchResults.isEmpty) {
      handleNoPVFound(context);
      return;
    }

    // Navigate to PVListPage with search results
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PVListPage(
          searchResults: searchResults,
        ),
      ),
    );
  } catch (e) {
    showErrorMessage(context, "Error: ${e.toString()}"); // Handle other errors
  }
}


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
                onIconPressed: onSearch, // Trigger the search when the icon is pressed
              ),
            ),
          ),
          const SizedBox(width: 8.0),

          // Clear Button
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
    searchController.clear(); // Clears the search field
  });
  
  
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const PVListPage(), // Rebuild PVListPage to show all PVs
    ),
  );
},
                child: const Text(
                  "Clear",
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
        ],
      ),
    );
  }
}
