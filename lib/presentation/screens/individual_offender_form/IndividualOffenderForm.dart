
/*
File Name: <IndividualOffenderForm.dart>
Purpose: <manage the form interface and functionality for submitting individual offender information in the application.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

// ignore: dangling_library_doc_comments
/// Represents the form screen for an individual offender, where users can 
/// input information related to the offender. This screen includes a sidebar 
/// and a custom app bar with a search feature. The form is wrapped in a 
/// `SingleChildScrollView` for easy scrolling.
///
/// Dependencies:
/// - [Sidebar] for the navigation drawer.
/// - [GeneralAppBar] for the app's header with a search feature.
/// - [IndividualOffenderFormWidget] for the actual form content.


import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderInformations.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/OffenderForm.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class IndividualOffenderForm extends StatelessWidget {
  const IndividualOffenderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            IndividualOffenderFormWidget(),
          ],
        ),
      ),
    );
  }
}
