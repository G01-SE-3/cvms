import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/navigation_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/title_row.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:cvms/presentation/screens/navigation_bars/widgets/search_bar.dart';

class GeneralAppBar extends StatelessWidget {
  final bool search;

  const GeneralAppBar({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
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
            child: navigation_bar(tabs, -1, (index) {
              // handle tab selection
            }),
          ),
          const SizedBox(height: 16),
          search ? const CustomSearchBar() : const SizedBox(),
        ],
      ),
    );
  }
}
