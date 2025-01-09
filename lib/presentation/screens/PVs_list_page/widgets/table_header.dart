import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/table_header_strings.dart';
import 'package:cvms/presentation/screens/add_PV_form/AddPVPage.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/services/pdf_service.dart';

class HeaderRow extends StatelessWidget {
  final List<PV>? pvs;
  const HeaderRow({super.key, required this.pvs});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          pvListTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {
                if (pvs != null && pvs!.isNotEmpty) {
                  PdfService.exportPVsToPdf(context, pvs!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No PVs available to export!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.file_download,
                size: 20,
                color: Color(0xFF344054),
              ),
              label: const Text(
                exportLabel,
                style: TextStyle(
                  color: Color(0xFF545837),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xFF545837),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(160, 48),
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the AddPVPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPVPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              label: const Text(
                addNewPVLabel,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C845E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(160, 48),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
