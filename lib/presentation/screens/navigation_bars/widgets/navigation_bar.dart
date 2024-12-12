import 'package:flutter/material.dart';

Widget navigation_bar(List<String> tabs, int selectedTabIndex, Function(int) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        tabs.length,
        (index) => GestureDetector(
          onTap: () {
            onTap(index);
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
                    fontWeight: selectedTabIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: selectedTabIndex == index
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                if (selectedTabIndex == index)
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
  );
}