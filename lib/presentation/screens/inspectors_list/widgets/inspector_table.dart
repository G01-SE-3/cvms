import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';
import '../../inspector_details/inspector_details.dart';
import '../../edit_inspector/edit_inspector_page.dart';

class InspectorTable extends StatefulWidget {
  const InspectorTable({super.key});

  @override
  State<InspectorTable> createState() => _InspectorTableState();
}

class _InspectorTableState extends State<InspectorTable> {
  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InspectorEntity>>(
      future: _inspectorRepository.getAllInspectors(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); 
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No inspectors found')); 
        } else {
          final _inspectors = snapshot.data!; 

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Inspector Number')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Surname')),
                  DataColumn(label: Text('Badge Number')),
                  DataColumn(label: Text('Department')),
                  DataColumn(label: Text('Contact')),
                  DataColumn(label: SizedBox(width: 50, child: Text(''))),
                ],
                rows: _inspectors.map((inspector) {
                  return DataRow(
                    cells: [
                      DataCell(Text(inspector.inspectorNumber.toString())),
                      DataCell(Text(inspector.name)),
                      DataCell(Text(inspector.surname)),
                      DataCell(Text(inspector.badgeNumber?.toString() ?? 'N/A')),
                      DataCell(Text(inspector.assignedDepartment)),
                      DataCell(Text(inspector.contactNumber?.toString() ?? 'N/A')),
                      DataCell(
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  const Icon(Icons.edit, size: 18),
                                  const SizedBox(width: 8),
                                  Text('Edit'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(Icons.delete, size: 18),
                                  const SizedBox(width: 8),
                                  Text('Delete'),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'edit') {
                              _editInspector(inspector);
                            } else if (value == 'delete') {
                              _deleteInspector(inspector);
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  void _editInspector(InspectorEntity inspector) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditInspectorPage(
          inspectorNumber: inspector.inspectorNumber.toString(),
          inspectorName: inspector.name,
          inspectorSurname: inspector.surname,
          inspectorBadgeNumber: inspector.badgeNumber?.toString() ?? '',
          assignedDepartment: inspector.assignedDepartment,
          contactNumber: inspector.contactNumber?.toString() ?? '',
        ),
      ),
    ).then((_) {
      // Reload the inspector list after editing
      setState(() {});
    });
  }

  void _deleteInspector(InspectorEntity inspector) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Inspector ${inspector.name}'),
        content: const Text('Are you sure you want to delete this inspector?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Call the delete method here
              _inspectorRepository.deleteInspector(inspector).then((_) {
                // Reload the inspector list after deletion
                setState(() {});
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
