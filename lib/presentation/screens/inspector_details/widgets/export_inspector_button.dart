import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart'; // For opening the PDF file

class ExportInspectorButtonWidget extends StatelessWidget {
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;

  const ExportInspectorButtonWidget({
    Key? key,
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  }) : super(key: key);

  Future<void> _generateAndOpenPdf() async {
    final pdf = pw.Document();

    // Add a page with the inspector details dynamically
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Inspector Details',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.black,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Name: $inspectorName'),
              pw.Text('Surname: $inspectorSurname'),
              pw.Text('Department: $inspectorDepartment'),
              pw.Text('Contact: $contactNumber'),
            ],
          );
        },
      ),
    );

    // Save PDF to a temporary directory
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/inspector_details.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the file
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _generateAndOpenPdf,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: const Color(0xFF7E9A77),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text('Export Inspector Details'),
    );
  }
}
