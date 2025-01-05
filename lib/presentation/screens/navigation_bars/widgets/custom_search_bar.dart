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

const List<DropdownMenuItem<String>> typeDropdownItems = [
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

 const  List<DropdownMenuItem<String>> filterDropdownItems = [
    DropdownMenuItem(
      value: SearchStrings.latest,
      child: Text(SearchStrings.latest),
    ),
    DropdownMenuItem(
      value: SearchStrings.date,
      child: Text(SearchStrings.date),
    ),
  ];

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
      String? validationError = validateInput(searchController.text);
      if (validationError != null) {
        showErrorMessage(context, validationError);
        return;
      }

      try {
        int pvNumber = int.parse(searchController.text);
        List<PV> searchResults = await pvController.searchPVsByNumber(pvNumber);

        if (searchResults.isEmpty) {
          handleNoPVFound(context);
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PVListPage(
              searchResults: searchResults,
            ),
          ),
        );
      } catch (e) {
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
                onIconPressed: onSearch,
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
                    searchController.clear();
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PVListPage(),
                    ),
                  );
                },
                child: const Text(
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
