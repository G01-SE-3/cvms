import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/table_header.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/pv_data_table.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
class PVListPage extends StatefulWidget {
  final List<PV>? searchResults;

  const PVListPage({super.key, this.searchResults});

  @override
  _PVListPageState createState() => _PVListPageState();
}

class _PVListPageState extends State<PVListPage> {
  late List<PV> displayedPVs;

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
          PageName: 'PV',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Center(
          child: Consumer<PVController>(
            builder: (context, pvController, child) {
              // If search results exist, use them
              final pvs = widget.searchResults ?? pvController.allPVs;

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
                    const HeaderRow(),
                    const SizedBox(height: 16),
                    PVDataTable(
                      tableData: pvs.map((pv) {
                        return {
                          'PVid': pv.pvId,
                          'PVnumber': pv.pvNumber.toString(),
                          'offendercr': pv.offender?.name ?? '',
                          'offendername': pv.offender?.name ?? '',
                          'pvissuedate': pv.issueDate.toIso8601String(),
                          'violationtype': pv.violationType,
                          'inspectingofficers': pv.inspectors
                              .map((i) => i.surname)
                              .join(", "),
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
