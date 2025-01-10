/*
File Name: <EconomicOperatorDetails.dart>
Purpose: <Displays a screen with tabbed content for economic operator details>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

// ignore: dangling_library_doc_comments
/// Represents the details screen for an economic operator, where users can 
/// view detailed information about the operator through different tabs. 
/// The screen uses a `DefaultTabController` to display tab content in a scrollable view.
///
/// Dependencies:
/// - [TabContent] for displaying the content for each tab.

import 'package:flutter/material.dart';
import 'widgets/TabContent.dart';

class EconomicOperatorDetails extends StatelessWidget {
  const EconomicOperatorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


