import 'package:flutter/material.dart';
import '../constants/strings/inspector_table_strings.dart'; 
import '../../edit_inspector/edit_inspector_page.dart';
import '../../inspector_details/inspector_details.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> inspector;

  const DetailsPage({super.key, required this.inspector});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(InspectorTableStrings.inspectorDetails),  // Use the string from AppStrings
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inspector Number: ${inspector['Inspector Number']}'),
            Text('Name: ${inspector['Name']}'),
            Text('Surname: ${inspector['Surname']}'),
            Text('Badge Number: ${inspector['Badge Number']}'),
            Text('Department: ${inspector['Department']}'),
            Text('Contact: ${inspector['Contact']}'),
          ],
        ),
      ),
    );
  }
}

class InspectorTable extends StatefulWidget {
  const InspectorTable({super.key});

  @override
  State<InspectorTable> createState() => _InspectorTableState();
}

class _InspectorTableState extends State<InspectorTable> {
  final List<Map<String, dynamic>> inspectors = [
    {
      'Inspector Number': '101',
      'Name': 'John',
      'Surname': 'Doe',
      'Badge Number': 'A001',
      'Department': 'HR',
      'Contact': '123-456-7890',
    },
    {
      'Inspector Number': '102',
      'Name': 'Jane',
      'Surname': 'Smith',
      'Badge Number': 'B002',
      'Department': 'Finance',
      'Contact': '987-654-3210',
    },
    {
      'Inspector Number': '103',
      'Name': 'Mike',
      'Surname': 'Johnson',
      'Badge Number': 'C003',
      'Department': 'IT',
      'Contact': '555-123-4567',
    },
    {
      'Inspector Number': '104',
      'Name': 'Sarah',
      'Surname': 'Williams',
      'Badge Number': 'D004',
      'Department': 'Sales',
      'Contact': '555-987-6543',
    },
    {
      'Inspector Number': '105',
      'Name': 'David',
      'Surname': 'Brown',
      'Badge Number': 'E005',
      'Department': 'HR',
      'Contact': '555-345-6789',
    },
  ];

  void _editInspector(Map<String, dynamic> inspector) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditInspectorPage(
          inspectorNumber: inspector['Inspector Number'],
          inspectorName: inspector['Name'],
          inspectorSurname: inspector['Surname'],
          inspectorBadgeNumber: inspector['Badge Number'],
          assignedDepartment: inspector['Department'],
          contactNumber: inspector['Contact'],
        ),
      ),
    );
  }

  void _deleteInspector(Map<String, dynamic> inspector) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${InspectorTableStrings.deleteInspector} ${inspector['Name']}'),  // Use the string from AppStrings
        content: const Text(InspectorTableStrings.areYouSureDelete),  // Use the string from AppStrings
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(InspectorTableStrings.cancel),  // Use the string from AppStrings
          ),
          TextButton(
            onPressed: () {
              setState(() {
                inspectors.remove(inspector);
              });
              Navigator.pop(context);
            },
            child: const Text(InspectorTableStrings.delete),  // Use the string from AppStrings
          ),
        ],
      ),
    );
  }

  // Navigate to the InspectorDetailsPage with row-specific data
  void _navigateToDetailsPage(Map<String, dynamic> inspector) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InspectorDetailsPage(
          inspectorName: inspector['Name'],
          inspectorSurname: inspector['Surname'],
          inspectorDepartment: inspector['Department'],
          contactNumber: inspector['Contact'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          rows: inspectors.map((inspector) {
            return DataRow(
              onSelectChanged: (selected) {
                if (selected == true) {
                  _navigateToDetailsPage(inspector); 
                }
              },
              cells: [
                DataCell(Text(inspector['Inspector Number']!)),
                DataCell(Text(inspector['Name']!)),
                DataCell(Text(inspector['Surname']!)),
                DataCell(Text(inspector['Badge Number']!)),
                DataCell(Text(inspector['Department']!)),
                DataCell(Text(inspector['Contact']!)),
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
                            Text(InspectorTableStrings.edit),  // Use the string from AppStrings
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            const Icon(Icons.delete, size: 18),
                            const SizedBox(width: 8),
                            Text(InspectorTableStrings.deleteOption),  // Use the string from AppStrings
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
}