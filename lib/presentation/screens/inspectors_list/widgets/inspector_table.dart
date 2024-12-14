import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/inspector_table_strings.dart';
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
          return Center(child: Text(InspectorTableStrings.noInspectorsFound));
        } else {
          final _inspectors = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text(InspectorTableStrings.inspectorNumber)),
                  DataColumn(label: Text(InspectorTableStrings.name)),
                  DataColumn(label: Text(InspectorTableStrings.surname)),
                  DataColumn(label: Text(InspectorTableStrings.badgeNumber)),
                  DataColumn(label: Text(InspectorTableStrings.department)),
                  DataColumn(label: Text(InspectorTableStrings.contact)),
                  DataColumn(label: SizedBox(width: 50, child: Text(''))),
                ],
                rows: _inspectors.map((inspector) {
                  return DataRow(
                    onSelectChanged: (_) {
                      _viewInspectorDetails(inspector);
                    },
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
                                  Text(InspectorTableStrings.edit),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(Icons.delete, size: 18),
                                  const SizedBox(width: 8),
                                  Text(InspectorTableStrings.delete),
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

  void _viewInspectorDetails(InspectorEntity inspector) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InspectorDetailsPage(
          inspectorName: inspector.name,
          inspectorSurname: inspector.surname,
          inspectorDepartment: inspector.assignedDepartment,
          contactNumber: inspector.contactNumber?.toString() ?? 'N/A',
        ),
      ),
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
    // Instead of just calling setState, re-fetch the inspectors
    _refreshInspectorList();
  });
}

void _deleteInspector(InspectorEntity inspector) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('${InspectorTableStrings.deleteInspector} ${inspector.name}'),
      content: const Text(InspectorTableStrings.areYouSureDelete),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(InspectorTableStrings.cancel),
        ),
        TextButton(
          onPressed: () {
            // Call the delete method here
            _inspectorRepository.deleteInspector(inspector).then((_) {
              // Instead of just calling setState, re-fetch the inspectors
              _refreshInspectorList();
            });
            Navigator.pop(context);
          },
          child: const Text(InspectorTableStrings.deleteAction),
        ),
      ],
    ),
  );
}

// A helper method to refresh the inspector list by calling setState
void _refreshInspectorList() {
  setState(() {
    // Refreshing the widget by triggering FutureBuilder again
  });
}

}
