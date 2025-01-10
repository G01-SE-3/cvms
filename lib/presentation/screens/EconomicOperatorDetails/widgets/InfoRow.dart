/*
File Name: <InfoRow.dart>
Purpose: <Displays a row with a title and corresponding value>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart'; 
Widget InfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF638773)
            ),
          ),
          Text(
            value,
            style:const TextStyle(
              color: Color(0xFF121714)
          )),
        ],
      ),
    );
}



