import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/Settings/widgets/SettingsMenu.dart';
import 'package:cvms/presentation/screens/Settings/widgets/PageContent.dart';

class SettingsSubMenu extends StatefulWidget {
  final String? pageSelected;
  final Function(String) onPageSelected;

  const SettingsSubMenu({
    super.key,
    this.pageSelected,
    required this.onPageSelected,
  });

  @override
  _SettingsSubMenuState createState() => _SettingsSubMenuState();
}

class _SettingsSubMenuState extends State<SettingsSubMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left menu containing the settings options
        Container(
          width: MediaQuery.of(context).size.width * 0.2, // 20% of screen width
          color: Colors.grey[200],
          child: SettingsMenu(
            pageSelected: widget.pageSelected, // Pass selected page to highlight the menu
            onPageSelected: widget.onPageSelected, // Handle page selection
          ),
        ),
        
        // Main content area showing the selected page's content
        Expanded(
          child: Container(
            color: Colors.white,
            child: PageContent(page: widget.pageSelected), // Display the selected page content
          ),
        ),
      ],
    );
  }
}
