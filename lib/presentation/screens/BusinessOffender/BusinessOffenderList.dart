import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderInformations.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/usecases/business_offender/add_offender.dart';
import 'package:cvms/presentation/controllers/business_offender/business_offender_controller.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:postgres/postgres.dart';
import 'package:cvms/core/utils/get_db.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  BusinessOffenderListScreen createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
  late BusinessOffenderController_two _controller;
  late PostgreSQLConnection _connection;

  @override
  void initState() {
    super.initState();

    // Set up PostgreSQL connection
    _connection = PostgreSQLConnection(
      'localhost', // Database host
      5432, // Port (default for PostgreSQL)
      'cvms', // Database name
      username: "postgres", // Database username
      password: "123456", // Database password
    );

    // Initialize the controller with the repository
    _controller =
        BusinessOffenderController_two(BusinessOffenderRepository(_connection));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(), // Add Sidebar if needed
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.0), // Adjust height as needed
        child: GeneralAppBar(
            search: true, initialTabIndex: 3), // Set to Business Offender tab
      ),
      body: Container(
        color: const Color(0xFF545837),
        child: Align(
          alignment: const Alignment(0, 0.7),
          child: Container(
            width: 1300,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Business Offender List'),
                actions: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.file_download, color: Colors.black),
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
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: Text(
                      AddnewOffender,
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF545837),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              body: FutureBuilder<List<BusinessOffender>>(
                future: _controller.fetchOffenders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available.'));
                  } else {
                    List<BusinessOffender> offenders = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text(BusinessName)),
                          DataColumn(label: Text(Name)),
                          DataColumn(label: Text(Surname)),
                          DataColumn(label: Text(DateandPlaceofbirth)),
                          DataColumn(label: Text(Address)),
                          DataColumn(label: Text(BusinessAddress)),
                        ],
                        rows: offenders.map((offender) {
                          return DataRow(cells: [
                            DataCell(Text(offender.business_name)),
                            DataCell(Text(offender.name)),
                            DataCell(Text(offender.surname)),
                            DataCell(Text(offender.date_of_birth)),
                            DataCell(Text(offender.address)),
                            DataCell(Text(offender.business_address)),
                          ]);
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
