/*
File Name: <ActionsButtons.dart>
Purpose: <Displays a row of action buttons for editing, exporting, and generating reports >
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/constants/strings/ButtonsText.dart';
Widget ActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 35),
        Text(
          IndividualEconomicOperator,
          style: const TextStyle(fontSize: 12),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child:  Text(
            Edit,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child:  Text(
            Export,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFCF4CF),
          ),
          child:  Text(
            Report,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }



