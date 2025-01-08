import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/homepage/widgets/LineChart.dart';
import 'package:cvms/presentation/screens/homepage/widgets/StatCard.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:provider/provider.dart';
import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/data/repositories/business_offender/business_offender_repository_impl.dart';
import 'package:cvms/data/datasources/business_offender/business_offender_datasource.dart';

import '../../../data/datasources/rc/register_number_datasource.dart';
import '../../../data/repositories/rc/register_number_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();
  final BusinessOffenderRepository _businessOffenderRepository =
    BusinessOffenderRepositoryImpl(
        BusinessOffenderDataSource(),
        RegisterNumberRepositoryImpl(RegisterNumberDataSource()), // Pass the required argument
    );



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch the total PV count and Monthly PV counts early
      Provider.of<PVController>(context, listen: false).fetchTotalPVCount();
      Provider.of<PVController>(context, listen: false).fetchMonthlyPVCounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: GeneralAppBar(search: false, initialTabIndex: 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<PVController>(
          builder: (context, pvController, child) {
            final totalPVs = pvController.totalPVCount;

            return FutureBuilder<List<InspectorEntity>>(
              future: _inspectorRepository.getAllInspectors(),
              builder: (context, inspectorSnapshot) {
                return FutureBuilder<List<BusinessOffender>>(
                  future: _businessOffenderRepository.fetchAllOffenders(),
                  builder: (context, businessOffenderSnapshot) {
                    if (inspectorSnapshot.connectionState == ConnectionState.waiting ||
                        businessOffenderSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (inspectorSnapshot.hasError || businessOffenderSnapshot.hasError) {
                      return Center(
                        child: Text('Error: ${inspectorSnapshot.error ?? businessOffenderSnapshot.error}'),
                      );
                    } else {
                      final totalInspectors = inspectorSnapshot.data?.length ?? 0;
                      final totalEconomicOperators = businessOffenderSnapshot.data?.length ?? 0;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatCard('Total PVs', totalPVs.toString(), Icons.description, Colors.blue),
                              StatCard('Economic Operators', totalEconomicOperators.toString(), Icons.business, Colors.green),
                              StatCard('Inspectors', totalInspectors.toString(), Icons.person, Colors.orange),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const LineChartWidget(title: 'Monthly PVs Evolution'),
                        ],
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
