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

import 'constants/Strings/homepage.dart';
import 'package:cvms/presentation/screens/add_PV_form/AddPVPage.dart';
import 'package:cvms/presentation/screens/add_inspector/add_inspector_page.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
import 'package:cvms/presentation/screens/individual_offender_form/IndividualOffenderForm.dart';

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
    RegisterNumberRepositoryImpl(
        RegisterNumberDataSource()), // Pass the required argument
  );

  late Future<List<InspectorEntity>> _inspectorsFuture;
  late Future<List<BusinessOffender>> _businessOffendersFuture;

  @override
  void initState() {
    super.initState();
    _inspectorsFuture = _inspectorRepository.getAllInspectors();
    _businessOffendersFuture = _businessOffenderRepository.fetchAllOffenders();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<PVController>(
          builder: (context, pvController, child) {
            final totalPVs = pvController.totalPVCount;

            return FutureBuilder<List<InspectorEntity>>(
              future: _inspectorsFuture,
              builder: (context, inspectorSnapshot) {
                return FutureBuilder<List<BusinessOffender>>(
                  future: _businessOffendersFuture,
                  builder: (context, businessOffenderSnapshot) {
                    if (inspectorSnapshot.connectionState ==
                            ConnectionState.waiting ||
                        businessOffenderSnapshot.connectionState ==
                            ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (inspectorSnapshot.hasError ||
                        businessOffenderSnapshot.hasError) {
                      return Center(
                        child: Text(
                          '${HomePageStrings.errorMessage}${inspectorSnapshot.error ?? businessOffenderSnapshot.error}',
                        ),
                      );
                    } else {
                      final totalInspectors =
                          inspectorSnapshot.data?.length ?? 0;
                      final totalEconomicOperators =
                          businessOffenderSnapshot.data?.length ?? 0;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildActionButton(
                                context,
                                label: HomePageStrings.addPV,
                                icon: Icons.add,
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddPVPage()),
                                  );
                                },
                              ),
                              _buildActionButton(
                                context,
                                label: HomePageStrings.addBusinessOffender,
                                icon: Icons.business,
                                color: Colors.green,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BusinessOffenderForm()),
                                  );
                                },
                              ),
                              _buildActionButton(
                                context,
                                label: HomePageStrings.addIndividualOffender,
                                icon: Icons.person,
                                color: Colors.orange,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            IndividualOffenderForm()),
                                  );
                                },
                              ),
                              _buildActionButton(
                                context,
                                label: HomePageStrings.addInspector,
                                icon: Icons.badge,
                                color: Colors.purple,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddInspectorPage()),
                                  );
                                },
                              ),
                            ].map((button) {
                              return SizedBox(
                                height: 10,
                                child: button,
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatCard(
                                  HomePageStrings.totalPVs,
                                  totalPVs.toString(),
                                  Icons.description,
                                  Colors.blue),
                              StatCard(
                                  HomePageStrings.economicOperators,
                                  totalEconomicOperators.toString(),
                                  Icons.business,
                                  Colors.green),
                              StatCard(
                                  HomePageStrings.inspectors,
                                  totalInspectors.toString(),
                                  Icons.person,
                                  Colors.orange),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const LineChartWidget(
                              title: HomePageStrings.monthlyPVsEvolution),
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

  Widget _buildActionButton(BuildContext context,
      {required String label,
      required IconData icon,
      required Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 19, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
