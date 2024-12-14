import 'package:flutter/material.dart';

Widget navigation_bar(BuildContext context ,List<String> tabs, int selectedTabIndex, Function(int) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        tabs.length,
        (index) => GestureDetector(
          onTap: () {
            switch (index) {
    case 0:
      Navigator.pushNamed(context, '/pvs');
      break;
    case 1:
      Navigator.pushNamed(context, '/inspectors');
      break;
    case 2:
      Navigator.pushNamed(context, '/economic_operators');
      break;
    
    
  }
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