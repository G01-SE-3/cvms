import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/pv_data_table.dart';
import 'package:cvms/presentation/screens/PV_details_page/PVPage.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';

class PVDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

  const PVDataTable({super.key, required this.tableData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(
            Colors.grey[200],
          ),
          columnSpacing: 24,
          headingRowHeight: 56,
          dataRowHeight: 48,
          headingTextStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Color(0xFF545837),
          ),
          columns: [
            _sortableColumn(pvNumberLabel),
            _sortableColumn(offenderRCLabel),
            _sortableColumn(offenderNameLabel),
            _sortableColumn(pvIssueDateLabel),
            _sortableColumn(violationTypeLabel),
            _sortableColumn(inspectingOfficersLabel),
            DataColumn(
              label: Container(),
            ),
          ],
          rows: tableData.map((row) {
            return DataRow(
              // Linking functionality without selection behavior
              cells: [
                DataCell(
                  Text(row['PVnumber']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Text(row['offendercr']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Text(row['offendername']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Text(row['pvissuedate']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Text(row['violationtype']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Text(row['inspectingofficers']),
                  onTap: () => _navigateToPVPage(context, row),
                ),
                DataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton<int>(
                        surfaceTintColor: const Color(0xFF545837),
                        iconColor: const Color(0xFF545837),
                        onSelected: (value) {
                          if (value == 1) {
                            _showEditDialog(context, row);
                          } else if (value == 2) {
                            _showDeleteConfirmation(context, row);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Color(0xFF545837)),
                                SizedBox(width: 8),
                                Text(editLabel),
                              ],
                            ),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 8),
                                Text(deleteLabel),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  DataColumn _sortableColumn(String title) {
    return DataColumn(
      label: Row(
        children: [
          Text(title),
          const Icon(Icons.arrow_drop_down, size: 18),
        ],
      ),
    );
  }

  void _navigateToPVPage(BuildContext context, Map<String, dynamic> row) {
    final controller = Provider.of<PVController>(context, listen: false);
    controller.resetPV(); // Reset before navigating

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PVPage(pvId: row['PVid']),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Map<String, dynamic> row) {
    print('Edit PVid: ${row['PVid']}');
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> row) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$deleteDialogTitle ${row['PVnumber']}'),
          content: const Text(deleteDialogContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(cancelLabel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(deleteLabelDialog),
            ),
          ],
        );
      },
    );
  }
}
