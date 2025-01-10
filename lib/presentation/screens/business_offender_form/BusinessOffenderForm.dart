/*
File Name: <BusinessOffenderForm.dart>
Purpose: <manage the form interface and functionality for submitting business offender information in the application.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

// ignore: dangling_library_doc_comments
/// Represents the business offender form screen where users can fill out
/// the necessary details for a business offender. It provides a form layout
/// with an app bar and a back button for navigation. The form content is 
/// encapsulated in the [BusinessOffenderFormWidget], with options for 
/// additional inputs and a checkbox for form selection.
///
/// Dependencies:
/// - [BusinessOffenderFormWidget] for displaying the form fields and handling interactions.


import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/business_offender_form/widgets/OffenderForm.dart';
import 'constants/strings/businessoffenderinformation.dart';

class BusinessOffenderForm extends StatelessWidget {
  const BusinessOffenderForm({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(BusinessOffenderStrings.form_offender),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: BusinessOffenderFormWidget(
            context: context,
            showAdditionalInputs: false,
            onCheckboxChanged: (value) {},
          ),
        ),
      );
}
