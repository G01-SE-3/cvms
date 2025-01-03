import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cvms/domain/entities/inspector/inspector.dart';

class ExportInspectorButtonWidget extends StatelessWidget {
  final Future<List<InspectorEntity>> fetchInspectors;

  const ExportInspectorButtonWidget({
    super.key,
    required this.fetchInspectors,
  });

  Future<void> _exportToPdf(BuildContext context) async {
    try {
      final inspectors = await fetchInspectors;
      if (inspectors.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No inspectors to export!')),
        );
        return;
      }

      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Title with larger font size and bold for better visibility
                pw.Text(
                  'Inspector List',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20), // Added space between title and content

                // Table with enhanced layout
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    // Header row with all attributes
                    pw.TableRow(
                      children: [
                        _buildTableHeader('Inspector Number'),
                        _buildTableHeader('Name'),
                        _buildTableHeader('Surname'),
                        _buildTableHeader('Badge Number'),
                        _buildTableHeader('Department'),
                        _buildTableHeader('Contact'),
                      ],
                    ),
                    // Data rows with enhanced layout
                    ...inspectors.map((inspector) {
                      return pw.TableRow(
                        children: [
                          _buildTableCell(inspector.inspectorNumber.toString()),
                          _buildTableCell(inspector.name),
                          _buildTableCell(inspector.surname),
                          _buildTableCell(inspector.badgeNumber?.toString() ?? 'N/A'),
                          _buildTableCell(inspector.assignedDepartment),
                          _buildTableCell(inspector.contactNumber?.toString() ?? 'N/A'),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ],
            );
          },
        ),
      );

      // Define the file path and name
      final output = await getTemporaryDirectory();
      final fileName = 'inspectors_${DateTime.now().millisecondsSinceEpoch}.pdf'; // Use timestamp for uniqueness
      final file = File('${output.path}/$fileName');
      
      // Save the PDF to the file
      await file.writeAsBytes(await pdf.save());
      
      // Share the PDF with the user
      await Printing.sharePdf(bytes: await pdf.save(), filename: fileName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error exporting to PDF: $e')),
      );
    }
  }

  // Helper method to create table headers
  pw.Widget _buildTableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 12,
   
        ),
      ),
    );
  }

  // Helper method to create table cells
  pw.Widget _buildTableCell(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 10,
       
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _exportToPdf(context),
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
        side: const BorderSide(color: Color(0xFF545837)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(160, 48),
        alignment: Alignment.center,
      ),
    );
  }
}
