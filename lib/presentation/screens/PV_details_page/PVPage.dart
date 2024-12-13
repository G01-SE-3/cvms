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

class PVPage extends StatefulWidget {
  final String pvId;

  const PVPage({super.key, required this.pvId});

  @override
  _PVPageState createState() => _PVPageState();
}

class _PVPageState extends State<PVPage> {
  @override
  void initState() {
    super.initState();

    // Load the PV data once the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<PVController>(context, listen: false);
      if (controller.pv == null && !controller.isLoading) {
        controller.loadPV(widget.pvId); // Load the PV data using the pvId
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PV Details')),
      body: Consumer<PVController>(builder: (context, controller, _) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Error: ${controller.errorMessage}"),
                ElevatedButton(
                  onPressed: () => controller.loadPV(widget.pvId),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        final pv = controller.pv;
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PVHeader(),
              const SizedBox(height: 20),
              PVDetailsSection(pv: pv!),
              const SizedBox(height: 20),
              PVSeizuresSection(seizures: pv.seizures),
              const SizedBox(height: 20),
              PVClosureSection(closure: pv.closure),
              const SizedBox(height: 20),
              PVFinancialPenaltySection(financialPenalty: pv.financialPenalty),
              const SizedBox(height: 20),
              PVLegalProceedingsSection(legalProceedings: pv.legalProceedings),
              const SizedBox(height: 20),
              PVNationalCardSection(
                  nationalCardRegistration: pv.nationalCardRegistration),
            ],
          ),
        );
      }),
    );
  }
}
