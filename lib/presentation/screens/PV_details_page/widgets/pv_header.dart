import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/strings/pv_header_strings.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/presentation/screens/PV_editing_form/EditPVPage.dart';

class PVHeader extends StatelessWidget {
  final String pvId;
  const PVHeader({super.key, required this.pvId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        children: [
          const Text(
            PVHeaderStrings.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _buildActionButton(
            PVHeaderStrings.editButton,
            const Color(0xFF7E9A77),
            onPressed: () => _navigateToEditPage(context),
          ),
          const SizedBox(width: 10),
          _buildActionButton(
            PVHeaderStrings.exportButton,
            const Color(0xFF7E9A77),
            onPressed: () {
              // Placeholder for export functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Export functionality is not implemented yet')),
              );
            },
          ),
          const SizedBox(width: 10),
          _buildActionButton(
            PVHeaderStrings.deleteButton,
            const Color(0xFFFFF4CF),
            textColor: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () => _confirmDelete(context, pvId),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color,
      {Color? textColor, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }

  void _navigateToEditPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPVPage(pvId: pvId),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String pvId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete PV'),
          content: const Text("Are you sure you want to delete this PV?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final controller =
                    Provider.of<PVController>(context, listen: false);

                try {
                  await controller.deletePVById(pvId);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Successfully deleted PV $pvId'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to delete PV $pvId: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } finally {
                  // Close the dialog
                  Navigator.pop(context);
                }
              },
              child: const Text("Delete PV"),
            ),
          ],
        );
      },
    );
  }
}
