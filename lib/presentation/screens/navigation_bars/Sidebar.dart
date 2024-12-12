import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation bars/constants/Strings/Sidebar.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF4A4A31), // Background color
        child: Column(
          children: [
            // Top space
            const SizedBox(height: 50),
            // Top menu items
            Expanded(
              child: Column(
                children: 
                 sidebarItemsTop(context),
                
              ),
            ),
            // Bottom menu items
            Column(
              children: 
                sidebarItemsBottom(context),
              
            ),
          ],
        ),
      ),
    );
  }
}









