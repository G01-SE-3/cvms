/*
File Name: <BusinessOffenderList.dart>
Purpose: <display a list of business offenders with options to add, edit, delete, and export records>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

// ignore: dangling_library_doc_comments
/// Represents the screen that displays a list of business offenders, allowing
/// users to view, add, edit, or delete business offenders. The screen
/// fetches offender data from a repository and displays it in a DataTable.
/// It also provides actions for exporting data and navigating to a form for
/// adding new offenders.
///
/// Dependencies:
/// - [BusinessOffenderRepositoryImpl] for fetching and managing offender data.
/// - [RegisterNumberRepositoryImpl] for fetching business register numbers.
/// - [GeneralAppBar] for the app's header and navigation.
/// - [Sidebar] for the side navigation menu.
/// - [BusinessOffenderForm] for adding new offenders.
/// - [EconomicOperatorDetails] for viewing detailed offender information.

import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderInformations.dart';
import 'package:flutter/material.dart';
import '../../../../data/datasources/business_offender/business_offender_datasource.dart';
import '../../../../data/repositories/business_offender/business_offender_repository_impl.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderTitle.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
import '../../../data/datasources/rc/register_number_datasource.dart';
import '../../../data/repositories/rc/register_number_repository_impl.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/EconomicOperatorDetails.dart';

final businessOffenderDataSource = BusinessOffenderDataSource();
final registerNumberDataSource = RegisterNumberDataSource();
final registerNumberRepository =
    RegisterNumberRepositoryImpl(registerNumberDataSource);
final businessOffenderRepository = BusinessOffenderRepositoryImpl(
  businessOffenderDataSource,
  registerNumberRepository,
);

class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  State<BusinessOffenderList> createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
  late List<BusinessOffender> offenders = [];
  final Map<String, String> registerNumbers = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOffenders();
  }

  Future<void> _fetchOffenders() async {
    try {
      offenders = await businessOffenderRepository.fetchAllOffenders();
      await _loadRegisterNumbers();
    } catch (e) {
      print(BusinessOffStrings.Error);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadRegisterNumbers() async {
    for (var offender in offenders) {
      try {
        final registerNumber = await registerNumberRepository
            .getBusinessRegisterNumberById(offender.business_id);
        registerNumbers[offender.business_id.toString()] = registerNumber;
      } catch (e) {
        print(
            "Error fetching register number for ID ${offender.business_id}: $e");
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: GeneralAppBar(search: false, initialTabIndex: 3),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Export functionality to be added here
                            },
                            icon: const Icon(Icons.file_download,
                                color: Colors.black),
                            label: Text(
                              Export,
                              style: const TextStyle(color: Colors.black),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BusinessOffenderForm(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: Text(
                              AddnewOffender,
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF545837),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  offenders.isEmpty
                      ? Center(child: Text(BusinessOffStrings.noData))
                      : SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            columnSpacing: 16.0,
                            headingRowColor: WidgetStateProperty.resolveWith(
                              (states) => Colors.grey[200],
                            ),
                            columns: _buildColumns(),
                            rows: offenders.map((offender) {
                              return DataRow(
                                cells: _buildCells(offender),
                              );
                            }).toList(),
                          ),
                        ),
                ],
              ),
            ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildDataColumn(BusinessOffStrings.registerNumber),
      _buildDataColumn(BusinessOffStrings.id),
      _buildDataColumn(BusinessOffStrings.businessName),
      _buildDataColumn(BusinessOffStrings.registerNumber),
      _buildDataColumn(BusinessOffStrings.surname),
      _buildDataColumn(BusinessOffStrings.birthInfo),
      _buildDataColumn(BusinessOffStrings.birthCertificateNum),
      _buildDataColumn(BusinessOffStrings.motherName),
      _buildDataColumn(BusinessOffStrings.fatherName),
      _buildDataColumn(BusinessOffStrings.address),
      DataColumn(
          label: SizedBox(width: 50, child: Text(BusinessOffStrings.action))),
    ];
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  List<DataCell> _buildCells(BusinessOffender offender) {
    return [
      DataCell(Text(registerNumbers[offender.business_id.toString()] ??
          BusinessOffStrings.loading)),
      DataCell(Text(offender.business_id.toString())),
      DataCell(Text(offender.business_name)),
      DataCell(Text(offender.name)),
      DataCell(Text(offender.surname)),
      DataCell(Text(offender.date_of_birth)),
      DataCell(Text(offender.birth_certificate_number)),
      DataCell(Text(offender.mother_name)),
      DataCell(Text(offender.father_name)),
      DataCell(Text(offender.address)),
      DataCell(
        PopupMenuButton(
          icon: const Icon(Icons.more_vert, size: 18),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: BusinessOffStrings.details,
              child: Row(
                children: [
                  Icon(Icons.remove_red_eye, size: 18),
                  SizedBox(width: 8),
                  Text(BusinessOffStrings.details),
                ],
              ),
            ),
            PopupMenuItem(
              value: BusinessOffStrings.Edit,
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text(BusinessOffStrings.Edit),
                ],
              ),
            ),
            PopupMenuItem(
              value: BusinessOffStrings.delete,
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18),
                  SizedBox(width: 8),
                  Text(BusinessOffStrings.delete),
                ],
              ),
            ),
          ],
          onSelected: (value) async {
            if (value == BusinessOffStrings.details) {
              // Navigate to the EconomicOperatorDetails screen
            } else if (value == BusinessOffStrings.Edit) {
              print("Edit action for ${offender.business_name} selected.");
            } else if (value == BusinessOffStrings.delete) {
              final confirmDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(BusinessOffStrings.confirmDelete),
                  content: Text(BusinessOffStrings.deleteConfirmationMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(BusinessOffStrings.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(BusinessOffStrings.cancel),
                    ),
                  ],
                ),
              );

              if (confirmDelete == true) {
                // Perform delete operation
                await businessOffenderRepository
                    .deleteBusinessOffender(offender.business_id);
                setState(() {
                  offenders.remove(offender);
                });
              }
            }
          },
        ),
      ),
    ];
  }
}
