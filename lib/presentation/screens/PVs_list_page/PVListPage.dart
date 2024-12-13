import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/table_header.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/pv_data_table.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';

class PVListPage extends StatefulWidget {
  const PVListPage({super.key});

  @override
  _PVListPageState createState() => _PVListPageState();
}

class _PVListPageState extends State<PVListPage> {
  @override
  void initState() {
    super.initState();

    // Load all PVs when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PVController>(context, listen: false).loadAllPVs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Center(
          child: Consumer<PVController>(
            builder: (context, pvController, child) {
              if (pvController.isLoading) {
                return const CircularProgressIndicator(); // Show a loading indicator
              } else if (pvController.errorMessage != null) {
                return Text(
                    pvController.errorMessage!); // Display error message
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderRow(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: PVDataTable(
                        tableData: pvController.allPVs.map((pv) {
                          return {
                            'PVid': pv.pvId, // Ensure pvId is a String
                            'PVnumber': pv.pvNumber
                                .toString(), // Convert pvNumber to String
                            'offendercr':
                                pv.offender?.name ?? '', // Convert to String
                            'offendername':
                                pv.offender?.name ?? '', // Convert to String
                            'pvissuedate': pv.issueDate
                                .toIso8601String(), // Ensure DateTime is converted to String
                            'violationtype':
                                pv.violationType, // Already a String
                            'inspectingofficers': pv.inspectors
                                .map((i) => i.inspectorName)
                                .join(", "), // Convert to String
                          };
                        }).toList(),
                      ),
                    ),
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
