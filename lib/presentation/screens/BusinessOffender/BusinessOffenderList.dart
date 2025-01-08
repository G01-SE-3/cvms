import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:flutter/material.dart';
import '../../../../data/datasources/business_offender/business_offender_datasource.dart';
import '../../../../data/repositories/business_offender/business_offender_repository_impl.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderTitle.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
import '../../../data/datasources/rc/register_number_datasource.dart';
import '../../../data/repositories/rc/register_number_repository_impl.dart';

final businessOffenderDataSource = BusinessOffenderDataSource();
final registerNumberDataSource = RegisterNumberDataSource();
final registerNumberRepository = RegisterNumberRepositoryImpl(registerNumberDataSource);
final businessOffenderRepository = BusinessOffenderRepositoryImpl(
  businessOffenderDataSource,
  registerNumberRepository,
);

class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  State<BusinessOffenderList> createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
  late List<BusinessOffender> offenders = [];
  final Map<String, String> registerNumbers = {}; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOffenders();
  }

  Future<void> _fetchOffenders() async {
    try {
      offenders = await businessOffenderRepository.fetchAllOffenders();
      await _loadRegisterNumbers();
    } catch (e) {
      print("Error fetching offenders: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

Future<void> _loadRegisterNumbers() async {
  for (var offender in offenders) {
    try {
      final registerNumber = await registerNumberRepository.getBusinessRegisterNumberById(offender.business_id);
      registerNumbers[offender.business_id.toString()] = registerNumber;
    } catch (e) {
      print("Error fetching register number for ID ${offender.business_id}: $e");
    }
  }
  setState(() {});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: GeneralAppBar(search: false, initialTabIndex: 3),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                            },
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BusinessOffenderForm(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: Text(
                              AddnewOffender,
                              style: const TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF545837),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  offenders.isEmpty
                      ? const Center(child: Text('No offenders found.'))
                      : SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            columnSpacing: 16.0,
                            headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey[200],
                            ),
                            columns: _buildColumns(),
                            rows: offenders.map((offender) {
                              return DataRow(
                                cells: _buildCells(offender),
                              );
                            }).toList(),
                          ),
                        ),
                ],
              ),
            ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildDataColumn('Commercial Register Number'),
      _buildDataColumn('Business ID'),
      _buildDataColumn('Business Name'),
      _buildDataColumn('Name'),
      _buildDataColumn('Surname'),
      _buildDataColumn('Birth Info'),
      _buildDataColumn('Birth Certificate'),
      _buildDataColumn('Mother Name'),
      _buildDataColumn('Father Name'),
      _buildDataColumn('Address'),
      const DataColumn(label: SizedBox(width: 50, child: Text('Actions'))),
    ];
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  List<DataCell> _buildCells(BusinessOffender offender) {
    return [
      DataCell(Text(registerNumbers[offender.business_id.toString()] ?? 'Loading...')), 
      DataCell(Text(offender.business_id.toString())),
      DataCell(Text(offender.business_name)),
      DataCell(Text(offender.name)),
      DataCell(Text(offender.surname)),
      DataCell(Text(offender.date_of_birth)),
      DataCell(Text(offender.birth_certificate_number)),
      DataCell(Text(offender.mother_name)),
      DataCell(Text(offender.father_name)),
      DataCell(Text(offender.address)),
      DataCell(
        PopupMenuButton(
          icon: const Icon(Icons.more_vert, size: 18),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text("Edit"),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18),
                  SizedBox(width: 8),
                  Text("Delete"),
                ],
              ),
            ),
          ],
          onSelected: (value) async {
            if (value == 'edit') {
            } else if (value == 'delete') {
              final confirmDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Delete'),
                  content: const Text('Are you sure you want to delete this record?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );

              if (confirmDelete == true) {
                await businessOffenderRepository.deleteBusinessOffender(offender.business_id);
                setState(() {
                  offenders.remove(offender);
                });
              }
            }
          },
        ),
      ),
    ];
  }
}
