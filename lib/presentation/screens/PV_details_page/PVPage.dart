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
                PVHeader(pvId: "${pv.pvNumber}-${pv.issueDate.year}"),
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
