/*
File Name: PVListPage
Purpose: This file implements the page displaying a list of PVs (Process Verbals). It allows users to view PV details in a tabular format. If search results are provided, it displays the filtered list; otherwise, it loads and displays all available PVs.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/table_header.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/pv_data_table.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';

/// The PVListPage displays a list of PVs in a table format. It can show either a filtered set of PVs
/// passed as search results or load and display all PVs from the repository. Users can view detailed information
/// about each PV, including PV number, offender information, issue date, violation type, and inspecting officers.
///
/// Dependencies:
/// - [PVController]: Manages fetching and loading all PVs from the repository. It provides loading state and error messages.
/// - [Sidebar]: A custom sidebar for navigation.
/// - [GeneralAppBar]: A custom app bar that includes a search bar and other app-wide elements.
/// - [HeaderRow]: Displays the table header for the PV list, including column titles.
/// - [PVDataTable]: Renders the list of PVs in a table format, where each row contains detailed information about a PV.
/// - [Consumer<PVController>]: A provider consumer used to rebuild the UI based on the state of PV data (loading, error, or success).
/// - [WidgetsBinding.instance.addPostFrameCallback]: Ensures that the loading of PVs happens after the widget is built.

class PVListPage extends StatefulWidget {
  final List<PV>? searchResults;

  const PVListPage({super.key, this.searchResults});

  @override
  _PVListPageState createState() => _PVListPageState();
}

class _PVListPageState extends State<PVListPage> {
  late List<PV> displayedPVs = [];

  @override
  void initState() {
    super.initState();

    // Load all PVs if no search results are passed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.searchResults == null) {
        Provider.of<PVController>(context, listen: false).loadAllPVs();
      } else {
        setState(() {
          displayedPVs = widget.searchResults!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: GeneralAppBar(
          search: true,
          initialTabIndex: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Center(
          child: Consumer<PVController>(
            builder: (context, pvController, child) {
              // Use search results if available, otherwise use loaded PVs
              displayedPVs = widget.searchResults ?? pvController.allPVs;

              if (pvController.isLoading) {
                return const CircularProgressIndicator();
              } else if (pvController.errorMessage != null) {
                return Text(
                  pvController.errorMessage!,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pass the updated displayedPVs to HeaderRow
                    HeaderRow(
                      pvs: displayedPVs,
                    ),
                    const SizedBox(height: 16),
                    PVDataTable(
                      tableData: displayedPVs.map((pv) {
                        return {
                          'PVid': pv.pvId,
                          'PVnumber': pv.pvNumber.toString(),
                          'offendercr': pv.offender?.rcNumber ?? '',
                          'offendername': pv.offender?.name ?? '',
                          'pvissuedate': pv.issueDate.toIso8601String(),
                          'violationtype': pv.violationType,
                          'inspectingofficers':
                              pv.inspectors.map((i) => i.surname).join(", "),
                        };
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
