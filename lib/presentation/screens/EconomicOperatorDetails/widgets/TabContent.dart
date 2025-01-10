/*
File Name: <TabContent.dart>
Purpose: <Renders tab content with action buttons and personal information details>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import 'ActionButtons.dart';
import 'PersonalInformationPage.dart';

Widget TabContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(8),
        child: ActionButtons(),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const PersonalInformationPage(),
            const SizedBox(height: 16),

          ],
        ),
      ),
    ],
  );
}
