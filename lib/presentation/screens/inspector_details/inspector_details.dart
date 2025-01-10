/*
File Name: inspector_details_page.dart
Purpose: Displays the details of a specific inspector, including their name, surname, department, and contact number.
         Provides options to add, export, or delete the inspector's information, and allows navigation back to the previous page.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:flutter/material.dart';
import 'widgets/information_row.dart';
import 'widgets/add_inspector_button.dart';
import 'widgets/export_inspector_button.dart'; 
import 'widgets/delete_inspector_button.dart';
import 'constants/strings/inspector_details_strings.dart';

 
/// Represents the page displaying the details of a specific inspector.
/// This screen shows the inspector's name, surname, department, contact number, 
/// and additional information like badge number and assigned department. 
/// It also provides buttons to add, export, or delete the inspector, 
/// and allows navigation back to the previous page.
/// 
/// Dependencies:
/// - [InformationRow] for displaying individual pieces of information about the inspector.
/// - [AddInspectorButtonWidget], [ExportInspectorButtonWidget], [DeleteInspectorButtonWidget] 
///   for performing actions related to the inspector's details.
/// - [InspectorDetailsPageStrings] for localized string constants related to the inspector's details.
/// 
/// Features:
/// - Displays a detailed view of the inspector with formatted personal information.
/// - Provides buttons for managing the inspector's data (add, export, delete).
/// - Customizable container for displaying information with shadow effects and rounded corners.





class InspectorDetailsPage extends StatelessWidget {
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;


  InspectorDetailsPage({
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black), 
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Inspector Details", 
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, 
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          inspectorName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, 
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          inspectorDepartment,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end, 
                      children: [
                        AddInspectorButtonWidget(
                          inspectorName: inspectorName,
                          inspectorSurname: inspectorSurname,
                          inspectorDepartment: inspectorDepartment,
                          contactNumber: contactNumber,
                        ),
                        const SizedBox(width: 8),
                        ExportInspectorButtonWidget(
                          inspectorName: inspectorName,
                          inspectorSurname: inspectorSurname,
                          inspectorDepartment: inspectorDepartment,
                          contactNumber: contactNumber,
                        ),
                        const SizedBox(width: 8),
                        DeleteInspectorButtonWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 1200, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), 
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9EAD3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                InspectorDetailsPageStrings.personalInfoTitle,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF566038),
                                ),
                              ),
                            ),
                            const Expanded(flex: 2, child: SizedBox.shrink()),
                          ],
                        ),
                      ),
                      // Information rows
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorNumberLabel,
                        value: "123456",
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorNameLabel,
                        value: inspectorName,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorSurnameLabel,
                        value: inspectorSurname,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorBadgeNumberLabel,
                        value: "987654",
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.assignedDepartmentLabel,
                        value: inspectorDepartment,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.contactNumberLabel,
                        value: contactNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
