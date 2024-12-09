import 'package:flutter/material.dart';
import 'buildMenuTile.dart';
Widget buildSidebar() {
    return Container(
      width: 250,
      color: const Color(0xFF545837),
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildMenuTile(Icons.menu, 40, Colors.black),
          buildMenuTile(Icons.menu, 18, Colors.white, 'Dashboard'),
          buildMenuTile(Icons.search_sharp, 18, Colors.white, 'PVs'),
          buildMenuTile(Icons.people, 18, Colors.white, 'Inspectors'),
          buildMenuTile(Icons.person, 18, Colors.white, 'Economic Operators'),
          const Spacer(),
          buildMenuTile(Icons.help, 18, Colors.white, 'Help'),
          buildMenuTile(Icons.settings, 18, Colors.white, 'Settings'),
        ],
      ),
    );
  }



  