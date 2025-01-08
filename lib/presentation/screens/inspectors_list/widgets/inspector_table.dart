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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(InspectorTableStrings.noInspectorsFound));
        } else {
          final inspectors = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                headingRowColor: WidgetStateProperty.resolveWith(
                    (states) => Colors.grey[200]), // Header row background color
                showCheckboxColumn: false, // Removes the checkbox
                columns: _buildColumns(),
                rows: inspectors.map((inspector) {
                  return DataRow(
                    onSelectChanged: (_) {
                      _viewInspectorDetails(inspector);
                    },
                    cells: _buildCells(inspector),
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildDataColumn(InspectorTableStrings.inspectorNumber),
      _buildDataColumn(InspectorTableStrings.name),
      _buildDataColumn(InspectorTableStrings.surname),
      _buildDataColumn(InspectorTableStrings.badgeNumber),
      _buildDataColumn(InspectorTableStrings.department),
      _buildDataColumn(InspectorTableStrings.contact),
      const DataColumn(
        label: SizedBox(width: 50, child: Text('')),
      ),
    ];
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Row(
        children: [
          Text(
            "$label ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 16, // Slightly larger size for the icon
            color: Colors.grey[700], // Darker color for better visibility
          ),
        ],
      ),
    );
  }

  List<DataCell> _buildCells(InspectorEntity inspector) {
    return [
      DataCell(Text(inspector.inspectorNumber.toString(), style: TextStyle(color: Colors.grey[800]))),
      DataCell(Text(inspector.name, style: TextStyle(color: Colors.grey[800]))),
      DataCell(Text(inspector.surname, style: TextStyle(color: Colors.grey[800]))),
      DataCell(Text(inspector.badgeNumber?.toString() ?? 'N/A', style: TextStyle(color: Colors.grey[800]))),
      DataCell(Text(inspector.assignedDepartment, style: TextStyle(color: Colors.grey[800]))),
      DataCell(Text(inspector.contactNumber?.toString() ?? 'N/A', style: TextStyle(color: Colors.grey[800]))),
      DataCell(
        PopupMenuButton(
          icon: Icon(Icons.more_vert, size: 18, color: Colors.grey[800]),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18, color: Colors.grey[800]),
                  const SizedBox(width: 8),
                  Text(InspectorTableStrings.edit, style: TextStyle(color: Colors.grey[800])),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18, color: Colors.grey[800]),
                  const SizedBox(width: 8),
                  Text(InspectorTableStrings.delete, style: TextStyle(color: Colors.grey[800])),
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
    ];
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
      _refreshInspectorList();
    });
  }

  void _deleteInspector(InspectorEntity inspector) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${InspectorTableStrings.deleteInspector} ${inspector.name}', style: TextStyle(color: Colors.grey[800])),
        content: Text(InspectorTableStrings.areYouSureDelete, style: TextStyle(color: Colors.grey[800])),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(InspectorTableStrings.cancel, style: TextStyle(color: Colors.grey[800])),
          ),
          TextButton(
            onPressed: () {
              _inspectorRepository.deleteInspector(inspector).then((_) {
                _refreshInspectorList();
              });
              Navigator.pop(context);
            },
            child: Text(InspectorTableStrings.deleteAction, style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  void _refreshInspectorList() {
    setState(() {});
  }
}
