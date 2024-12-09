import 'package:flutter/material.dart';
class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      tabs: [
        Tab(text: 'PV'),
        Tab(text: 'Inspectors'),
        Tab(text: 'Economic Operators'),
      ],
    );
  }
}



