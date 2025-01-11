import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/pv_data_table.dart';
import 'package:cvms/presentation/screens/PV_details_page/PVPage.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PV_editing_form/EditPVPage.dart';
import 'package:flutter/material.dart';

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
            _sortableColumn(PVDetailsLabels.pvNumberLabel),
            _sortableColumn(PVDetailsLabels.offenderRCLabel),
            _sortableColumn(PVDetailsLabels.offenderNameLabel),
            _sortableColumn(PVDetailsLabels.pvIssueDateLabel),
            _sortableColumn(PVDetailsLabels.violationTypeLabel),
            _sortableColumn(PVDetailsLabels.inspectingOfficersLabel),
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
                          PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Color(0xFF545837)),
                                SizedBox(width: 8),
                                Text(PVDetailsLabels.editLabel),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 8),
                                Text(PVDetailsLabels.deleteLabel),
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
    final String pvId = row['PVid'];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPVPage(pvId: pvId),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> row) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('${PVDetailsLabels.deleteDialogTitle} ${row['PVnumber']}'),
          content: Text(PVDetailsLabels.deleteDialogContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(PVDetailsLabels.cancelLabel),
            ),
            ElevatedButton(
              onPressed: () async {
                final controller =
                    Provider.of<PVController>(context, listen: false);

                try {
                  // Call the delete method from the controller
                  await controller.deletePVById(row['PVid']);
                  // Show a success message (optional)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Successfully deleted PV ${row['PVnumber']}'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  // Show an error message if something goes wrong
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Failed to delete PV ${row['PVnumber']}: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } finally {
                  // Close the dialog
                  Navigator.pop(context);
                }
              },
              child: Text(PVDetailsLabels.deleteLabelDialog),
            ),
          ],
        );
      },
    );
  }
}
