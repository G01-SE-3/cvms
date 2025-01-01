import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:flutter/material.dart';
import '../../../../data/datasources/business_offender/business_offender_datasource.dart';
import '../../../../data/repositories/business_offender/business_offender_repository_impl.dart';
import '../../../../domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderTitle.dart';
//import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderInformations.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
// import 'Edit_form.dart';

class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  State<BusinessOffenderList> createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
  final BusinessOffenderrepository repository =
      BusinessOffenderRepositoryImpl(BusinessOffenderDataSource());
  late List<BusinessOffender> offenders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0),
        child: GeneralAppBar(search: false, initialTabIndex: 3),
      ),
      body: SingleChildScrollView(
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
                        // Implement export functionality here
                      },
                      icon:
                          const Icon(Icons.file_download, color: Colors.black),
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
            FutureBuilder<List<BusinessOffender>>(
              future: repository.fetchAllOffenders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No offenders found.'));
                } else {
                  offenders = snapshot.data!;
                  return SizedBox(
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
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildDataColumn('Business Name'),
      _buildDataColumn('Name'),
      _buildDataColumn('Surname'),
      _buildDataColumn('Birth Info'),
      _buildDataColumn('Birth Certificate'),
      _buildDataColumn('Mother Name'),
      _buildDataColumn('Father Name'),
      _buildDataColumn('Address'),
      _buildDataColumn('Business Address'),
      const DataColumn(label: SizedBox(width: 50, child: Text(''))),
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
      DataCell(Text(offender.business_name)),
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
              /*
              final updatedOffender = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditForm(),
                ),
              );

              if (updatedOffender != null) {
                await repository.editBusinessOffender(updatedOffender);
                setState(() {});
              }*/
            } else if (value == 'delete') {
              final confirmDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirm Delete'),
                  content: const Text(
                      'Are you sure you want to delete this record?'),
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
                await repository.deleteBusinessOffender(offender.business_id);
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
