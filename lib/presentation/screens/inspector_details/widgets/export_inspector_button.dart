import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../constants/strings/export_inspector_button_strings.dart';

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

  // Export PDF functionality
  void _exportPDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Title with larger font size and bold for better visibility
            pw.Text(
              'Inspector Details',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 20), // Added space between title and content

            // Information rows with increased spacing and padding for clarity
            _buildRow('Inspector Name:', inspectorName),
            _buildRow('Inspector Surname:', inspectorSurname),
            _buildRow('Department:', inspectorDepartment),
            _buildRow('Contact Number:', contactNumber),
            _buildRow('Badge Number:', '987654'), // Dummy Badge Number
            _buildRow('Inspector Number:', '123456'), // Dummy Inspector Number

            // Add more fields as necessary
          ],
        );
      },
    ));

    // Save PDF file to device or send it for printing
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }

  // Helper method to generate each row of information
  pw.Widget _buildRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8.0), // More vertical space between rows
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: pw.Text(
              label,
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            ),
          ),
          pw.SizedBox(width: 12), // Space between label and value
          pw.Expanded(
            child: pw.Text(
              value,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _exportPDF(context),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        backgroundColor: const Color(0xFF7E9A77),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(ExportInspectorButtonWidgetStrings.exportButtonText),
    );
  }
}
