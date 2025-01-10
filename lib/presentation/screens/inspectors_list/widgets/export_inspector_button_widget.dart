import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ExportInspectorButtonWidget extends StatelessWidget {
  const ExportInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        // Fetch inspectors data from the repository
        final inspectors = await _fetchInspectorsData();

        if (inspectors.isNotEmpty) {
          // Generate and save the PDF
          final pdfFile = await _generatePdf(inspectors);

          // Open the PDF file
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('PDF exported successfully: ${pdfFile.path}')),
          );
          await _openPdfFile(pdfFile);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No data to export')),
          );
        }
      },
      icon: const Icon(
        Icons.file_download,
        size: 20,
        color: Color(0xFF344054),
      ),
      label: const Text(
        'Export',
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
    );
  }

  Future<List<Map<String, dynamic>>> _fetchInspectorsData() async {
    // Example: Fetch the data from your repository or source
    final inspectors = await InspectorRepositoryImpl().getAllInspectors();

    // Convert to a list of maps (simplified for PDF export)
    return inspectors.map((inspector) {
      return {
        'Inspector Number': inspector.inspectorNumber.toString(),
        'Name': inspector.name,
        'Surname': inspector.surname,
        'Badge Number': inspector.badgeNumber?.toString() ?? 'N/A',
        'Department': inspector.assignedDepartment,
        'Contact': inspector.contactNumber?.toString() ?? 'N/A',
      };
    }).toList();
  }

  Future<File> _generatePdf(List<Map<String, dynamic>> inspectors) async {
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Inspectors Data',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: inspectors.first.keys.toList(),
                data: inspectors
                    .map((inspector) => inspector.values.map((e) => e.toString()).toList())
                    .toList(),
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF file to the device's temporary directory
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/InspectorsData.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  Future<void> _openPdfFile(File file) async {
    // Open the file with a suitable app
    // This function requires a plugin like `open_file` to launch the PDF viewer
    await OpenFile.open(file.path);
  }
}
