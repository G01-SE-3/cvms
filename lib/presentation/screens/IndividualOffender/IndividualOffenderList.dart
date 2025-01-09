import 'package:cvms/data/datasources/individual_offender/individual_offender_datasource.dart';
import 'package:cvms/data/repositories/individual_offender/individual_offender_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderTitle.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderInformations.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/individual_offender_form/IndividualOffenderForm.dart';
import '../../../data/datasources/rc/register_number_datasource.dart';
import '../../../data/repositories/rc/register_number_repository_impl.dart';
import '../../../domain/entities/individual_offender/individual_offender.dart';

final individualOffenderDataSource = IndividualOffenderDataSource();
final registerNumberDataSource = RegisterNumberDataSource();
final registerNumberRepository =
    RegisterNumberRepositoryImpl(registerNumberDataSource);
final individualOffenderRepository = IndividualOffenderRepositoryImpl(
  individualOffenderDataSource,
  registerNumberRepository,
);

class IndividualOffenderList extends StatefulWidget {
  const IndividualOffenderList({super.key});

  @override
  State<IndividualOffenderList> createState() => IndividualOffenderListScreen();
}

class IndividualOffenderListScreen extends State<IndividualOffenderList> {
  late List<IndividualOffender> offenders = [];
  bool isLoading = true;
  Map<String, String> registerNumbers = {};

  @override
  void initState() {
    super.initState();
    _fetchOffenders();
  }

  Future<void> _fetchOffenders() async {
    try {
      offenders =
          await individualOffenderRepository.fetchAllIndividualOffenders();
      await _loadRegisterNumbers();
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loadRegisterNumbers() async {
    for (var offender in offenders) {
      try {
        final registerNumber = await registerNumberRepository
            .getIndividualRegisterNumberById(offender.individual_id);
        registerNumbers[offender.individual_id.toString()] = registerNumber;
      } catch (e) {
        print("Error ${offender.individual_id}: $e");
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
        child: GeneralAppBar(
          search: false,
          initialTabIndex: 4,
        ),
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
                              // Export logic here
                            },
                            icon: const Icon(Icons.file_download,
                                color: Colors.black),
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
                                    builder: (context) =>
                                        const IndividualOffenderForm()),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.resolveWith(
                          (states) => Colors.grey[200]),
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
      _buildDataColumn(IndividualDetailsStrings.RegisterNumber),
      _buildDataColumn(IndividualDetailsStrings.Name),
      _buildDataColumn(IndividualDetailsStrings.Surname),
      _buildDataColumn(IndividualDetailsStrings.DateandPlaceofbirth),
      _buildDataColumn(IndividualDetailsStrings.BirthCertificatenumber),
      _buildDataColumn(IndividualDetailsStrings.MothersnameandSurname),
      _buildDataColumn(IndividualDetailsStrings.FatherName),
      _buildDataColumn(IndividualDetailsStrings.Address),
      _buildDataColumn(IndividualDetailsStrings.BusinessAddress),
      const DataColumn(
        label: SizedBox(width: 50, child: Text('')),
      ),
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

  List<DataCell> _buildCells(IndividualOffender offender) {
    return [
      DataCell(Text(registerNumbers[offender.individual_id.toString()] ??
          IndividualDetailsStrings.loading)),
      DataCell(Text(offender.name)),
      DataCell(Text(offender.surname)),
      DataCell(Text(offender.date_of_birth)),
      DataCell(Text(offender.birth_certificate_number)),
      DataCell(Text(offender.mother_name)),
      DataCell(Text(offender.father_name)),
      DataCell(Text(offender.address)),
      DataCell(Text(offender.business_address)),
      DataCell(
        PopupMenuButton(
          icon: const Icon(Icons.more_vert, size: 18),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: IndividualDetailsStrings.edit,
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text(IndividualDetailsStrings.edit),
                ],
              ),
            ),
            PopupMenuItem(
              value: IndividualDetailsStrings.delete,
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18),
                  SizedBox(width: 8),
                  Text(IndividualDetailsStrings.delete),
                ],
              ),
            ),
          ],
          onSelected: (value) async {
            if (value == IndividualDetailsStrings.edit) {
              // Handle edit logic here
            } else if (value == IndividualDetailsStrings.delete) {
              final confirmDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Delete'),
                  content: Text(IndividualDetailsStrings.confirmDeleteRecord),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(IndividualDetailsStrings.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(IndividualDetailsStrings.delete),
                    ),
                  ],
                ),
              );

              if (confirmDelete == true) {
                await individualOffenderRepository
                    .deleteIndividualOffender(offender.individual_id);
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
