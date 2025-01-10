/*
File Name: homepage.dart
Purpose: This file serves as the main entry point for the application's homepage.
Authors:
- Team Member 1 [hiba.ayadi@ensia.edu.dz]
- Team Member 2 [safia.tifour@enisa.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

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

import 'widgets/ActionButton.dart';

/// Represents the homepage of the app where users can view key metrics,
/// access different sections
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

/// Manages the state of the [HomePage] widget, including fetching data and handling user actions.
class _HomePageState extends State<HomePage> {
  //initialize the inspector repository and the business offender repository
  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();
  final BusinessOffenderRepository _businessOffenderRepository =
      BusinessOffenderRepositoryImpl(
    BusinessOffenderDataSource(),
    RegisterNumberRepositoryImpl(RegisterNumberDataSource()),
  );

  late Future<List<InspectorEntity>> _inspectorsFuture;
  late Future<List<BusinessOffender>> _businessOffendersFuture;

  /// Initializes the state of the widget, fetching initial data.
  @override
  void initState() {
    super.initState();

    // Fetch the list of inspectors.
    _inspectorsFuture = _inspectorRepository.getAllInspectors();

    // Fetch the list of business offenders.
    _businessOffendersFuture = _businessOffenderRepository.fetchAllOffenders();

    // Fetch critical PV data after the widget is fully built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PVController>(context, listen: false).fetchTotalPVCount();
      Provider.of<PVController>(context, listen: false).fetchMonthlyPVCounts();
    });
  }

  /// Builds the main UI of the [HomePage] widget.
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

            // Fetch and display the number  for inspectors and business offenders.
            return FutureBuilder<List<InspectorEntity>>(
              future: _inspectorsFuture,
              builder: (context, inspectorSnapshot) {
                return FutureBuilder<List<BusinessOffender>>(
                  future: _businessOffendersFuture,
                  builder: (context, businessOffenderSnapshot) {
                    if (inspectorSnapshot.connectionState == ConnectionState.waiting ||
                        businessOffenderSnapshot.connectionState == ConnectionState.waiting) {
                      // Show a loading indicator while data is being fetched.
                      return const Center(child: CircularProgressIndicator());
                    } else if (inspectorSnapshot.hasError || businessOffenderSnapshot.hasError) {
                      // Display an error message if any data fetching fails.
                      return Center(
                        child: Text(
                          '${HomePageStrings.errorMessage}${inspectorSnapshot.error ?? businessOffenderSnapshot.error}',
                        ),
                      );
                    } else {
                      // Prepare data for display if fetched successfully.
                      final totalInspectors = inspectorSnapshot.data?.length ?? 0;
                      final totalEconomicOperators = businessOffenderSnapshot.data?.length ?? 0;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),

                          // Build the grid of action buttons.
                          GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              // Button to add a new PV.
                              ActionButton(
                                context,
                                label: HomePageStrings.addPV,
                                icon: Icons.add,
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddPVPage()),
                                  );
                                },
                              ),
                              // Button to add a new business offender.
                              ActionButton(
                                context,
                                label: HomePageStrings.addBusinessOffender,
                                icon: Icons.business,
                                color: const Color.fromARGB(255, 15, 39, 16),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BusinessOffenderForm()),
                                  );
                                },
                              ),
                              // Button to add a new individual offender.
                              ActionButton(
                                context,
                                label: HomePageStrings.addIndividualOffender,
                                icon: Icons.person,
                                color: const Color.fromARGB(255, 97, 64, 15),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IndividualOffenderForm()),
                                  );
                                },
                              ),
                              // Button to add a new inspector.
                              ActionButton(
                                context,
                                label: HomePageStrings.addInspector,
                                icon: Icons.badge,
                                color: const Color.fromARGB(255, 84, 12, 97),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddInspectorPage()),
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

                          // Display key stats using StatCards Widget.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatCard(HomePageStrings.totalPVs, totalPVs.toString(), Icons.description, Colors.blue),
                              StatCard(HomePageStrings.economicOperators, totalEconomicOperators.toString(), Icons.business, Colors.green),
                              StatCard(HomePageStrings.inspectors, totalInspectors.toString(), Icons.person, Colors.orange),
                            ],
                          ),

                          const SizedBox(height: 30),

                          // Display the line chart for monthly PV evolution.
                          LineChartWidget(title: HomePageStrings.monthlyPVsEvolution),
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