import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/navigation_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title_row.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/custom_search_bar.dart';


class GeneralAppBar extends StatelessWidget {
  final bool search;
   
   

  const GeneralAppBar({super.key, required this.search});
 

  @override
  Widget build(BuildContext context) {
    int _selectedTabIndex = -1; 
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 4.0, vertical: 13.0),
            child: title_row(false, context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: navigation_bar(context ,tabs, _selectedTabIndex, (index) {
              
              
            }),
          ),
          const SizedBox(height: 16),
          search ? const CustomSearchBar() : const SizedBox(),
        ],
      ),
    );
  }
}