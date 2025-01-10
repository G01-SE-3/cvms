/*
File Name: PVPage
Purpose: This page is used to display detailed information about a specific.
It retrieves the PV data using the controller and displays the various sections of the PV,
including the header, details, seizures, closure, financial penalty, legal proceedings, and national card registration.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_financial_penalty_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_national_card_registration.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_legal_preceedings_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_header.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_details_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_seizures_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_closure_section.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';

/// PVPage is a stateless widget that displays detailed information about a specific (PV).
/// The page retrieves PV data based on the provided pvId and displays various sections including:
/// - Header (PV number and issue year)
/// - Main details
/// - Seizures
/// - Closure information
/// - Financial penalties
/// - Legal proceedings
/// - National card registration
///
/// Dependencies:
/// - [PVController]: Manages the loading and retrieval of the PV data using the provided pvId.
/// - [FutureBuilder]: A widget that handles asynchronous data loading and displays a loading indicator, error message, or the final result.
/// - Various custom section widgets:  (e.g., `PVHeader`, `PVDetailsSection`).

class PVPage extends StatelessWidget {
  final String pvId;

  const PVPage({super.key, required this.pvId});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PVController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('PV Details')),
      body: FutureBuilder(
        future: controller.loadPV(pvId), // Call the loadPV method
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${snapshot.error}"),
                  ElevatedButton(
                    onPressed: () {
                      controller.loadPV(pvId); // Retry loading
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          // Assuming loadPV populates the controller.pv directly
          final pv = controller.pv;

          // Ensure pv is available
          if (pv == null) {
            return const Center(child: Text("No PV data available."));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PVHeader(pvId: "${pv.pvNumber}-${pv.issueDate.year}", pv: pv),
                const SizedBox(height: 20),
                PVDetailsSection(pv: pv),
                const SizedBox(height: 20),
                PVSeizuresSection(seizures: pv.seizures),
                const SizedBox(height: 20),
                PVClosureSection(closure: pv.closure),
                const SizedBox(height: 20),
                PVFinancialPenaltySection(
                    financialPenalty: pv.financialPenalty),
                const SizedBox(height: 20),
                PVLegalProceedingsSection(
                    legalProceedings: pv.legalProceedings),
                const SizedBox(height: 20),
                PVNationalCardSection(
                    nationalCardRegistration: pv.nationalCardRegistration),
              ],
            ),
          );
        },
      ),
    );
  }
}
