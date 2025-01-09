import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../domain/entities/pv/pv.dart';

class PdfService {
  static Future<void> exportPVToPdf(BuildContext context, PV pv) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              pw.SizedBox(height: 20),
              _buildTitle(),
              pw.SizedBox(height: 20),
              _buildPVDetails(pv),
            ],
          );
        },
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/PV${pv.pvNumber}_${pv.issueDate.year}_${pv.offender!.name}.pdf');
      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF exported successfully to ${file.path}'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to export PDF: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static pw.Widget _buildHeader() {
    return pw.Column(
      children: [
        pw.Text(
          "République Algérienne Démocratique et Populaire",
          style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          "Ministère du Commerce et de la Promotion des Exportations",
          style: pw.TextStyle(fontSize: 12),
          textAlign: pw.TextAlign.center,
        ),
        pw.Text(
          "Direction Wilaya de Commerce - Tipaza", // to be updated based on the wilaya config
          style: pw.TextStyle(fontSize: 12),
          textAlign: pw.TextAlign.center,
        ),
      ],
    );
  }

  static pw.Widget _buildTitle() {
    return pw.Text(
      "Procès-Verbal",
      style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
    );
  }

  static pw.Widget _buildPVDetails(PV pv) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildDetailRow("Numéro de PV:", pv.pvNumber.toString()),
        _buildDetailRow("Nom du contrevenant:", pv.offender?.name ?? 'N/A'),
        _buildDetailRow("Numéro de registre de commerce du contrevenant:",
            pv.offender?.rcNumber ?? 'N/A'),
        _buildDetailRow("Date d'émission:", pv.issueDate.toString()),
        _buildDetailRow("Type d'infraction:", pv.violationType),
        _buildDetailRow("Montant total des réparations:",
            pv.totalReparationAmount?.toString() ?? 'N/A'),
        _buildDetailRow(
            "Montant total non fixe:", pv.totalNonFixed?.toString() ?? 'N/A'),
        _buildDetailRow("Bien subventionné:", pv.subsidizedGood ?? 'N/A'),
        pw.SizedBox(height: 15),

        // Seizures Section
        pw.Text(
          "Saisies:",
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
        ),
        if (pv.seizures.isNotEmpty)
          for (var seizure in pv.seizures)
            pw.Bullet(
              text:
                  'Produit saisi: ${seizure.seizedGoods}, Quantité: ${seizure.seizureQuantity}, Montant: ${seizure.seizureAmount} DZD',
            )
        else
          pw.Text("Aucune saisie enregistrée."),
        pw.SizedBox(height: 15),

        // Financial Penalty Section
        if (pv.financialPenalty != null) ...[
          pw.Text(
            "Sanction financière:",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
          ),
          _buildDetailRow("Montant de la pénalité:",
              "${pv.financialPenalty!.penaltyAmount} DZD"),
          _buildDetailRow("Date de la pénalité:",
              pv.financialPenalty!.penaltyDate.toString()),
          _buildDetailRow(
              "ID de la pénalité:", pv.financialPenalty!.penaltyId.toString()),
          _buildDetailRow("Numéro de reçu de paiement:",
              pv.financialPenalty!.paymentReceiptNumber ?? 'N/A'),
          _buildDetailRow("Date de réception du paiement:",
              pv.financialPenalty!.paymentReceiptDate?.toString() ?? 'N/A'),
        ],
        pw.SizedBox(height: 15),

        // Legal Proceedings Section
        if (pv.legalProceedings != null) ...[
          pw.Text(
            "Poursuites judiciaires:",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
          ),
          _buildDetailRow("Numéro de renvoi à la justice:",
              pv.legalProceedings!.referralToJusticeNumber ?? 'N/A'),
          _buildDetailRow("Date de renvoi à la justice:",
              pv.legalProceedings!.referralToJusticeDate?.toString() ?? 'N/A'),
          _buildDetailRow(
              "Juridiction:", pv.legalProceedings!.jurisdiction ?? 'N/A'),
          _buildDetailRow("Dispositions légales:",
              pv.legalProceedings!.legalProvisions ?? 'N/A'),
          _buildDetailRow("Numéro de décision judiciaire:",
              pv.legalProceedings!.courtDecisionNumber ?? 'N/A'),
          _buildDetailRow("Date de la décision judiciaire:",
              pv.legalProceedings!.courtDecisionDate?.toString() ?? 'N/A'),
          _buildDetailRow("Amende imposée par le tribunal:",
              "${pv.legalProceedings!.courtImposedFineAmount?.toString() ?? 'N/A'} DZD"),
        ],
        pw.SizedBox(height: 15),

        // National Card Registration Section
        if (pv.nationalCardRegistration != null) ...[
          pw.Text(
            "Enregistrement sur la carte nationale:",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
          ),
          _buildDetailRow("ID d'enregistrement:",
              pv.nationalCardRegistration!.nationalCardRegId.toString()),
          _buildDetailRow("Date de délivrance:",
              pv.nationalCardRegistration!.nationalCardIssueDate.toString()),
        ],
        pw.SizedBox(height: 15),

        // Inspectors Section
        pw.Text(
          "Inspecteurs:",
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
        ),
        for (var inspector in pv.inspectors)
          pw.Bullet(text: "${inspector.name} ${inspector.surname}"),
        pw.SizedBox(height: 15),

        // Closure Section
        if (pv.closure != null) ...[
          _buildDetailRow("ID de Clôture:", pv.closure!.closureId.toString()),
          _buildDetailRow("Date d'ordre de Clôture:",
              pv.closure!.closureOrderDate.toString()),
        ],
      ],
    );
  }

  static pw.Widget _buildDetailRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('$label ',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Expanded(child: pw.Text(value)),
        ],
      ),
    );
  }

  static Future<void> exportPVsToPdf(BuildContext context, List<PV> pvs) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              pw.SizedBox(height: 20),
              pw.Text(
                "Liste des PVs",
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 20),
              _buildPVTable(pvs),
            ],
          );
        },
      ),
    );

    try {
      // Get the current date and time
      final now = DateTime.now();
      final formattedDateTime =
          "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_"
          "${now.hour.toString().padLeft(2, '0')}h${now.minute.toString().padLeft(2, '0')}min${now.second.toString().padLeft(2, '0')}s";

      // Append the formatted date and time to the file name
      final directory = await getApplicationDocumentsDirectory();
      final file =
          File('${directory.path}/Liste_de_PVs_$formattedDateTime.pdf');
      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF exported successfully to ${file.path}'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to export PDF: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static pw.Widget _buildPVTable(List<PV> pvs) {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths: {
        0: pw.FlexColumnWidth(1.5),
        1: pw.FlexColumnWidth(1.5),
        2: pw.FlexColumnWidth(2),
        3: pw.FlexColumnWidth(2),
        4: pw.FlexColumnWidth(1.5),
        5: pw.FlexColumnWidth(2),
      },
      children: [
        // Table Header
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey300),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Numéro PV',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Registre Commerce',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Nom Contrevenant',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Date Emission',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Type Infraction',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Text('Inspecteurs',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
        // Table Rows
        ...pvs.map((pv) {
          return pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(pv.pvNumber.toString()),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(pv.offender?.rcNumber ?? 'N/A'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(pv.offender?.name ?? 'N/A'),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  pv.issueDate.toIso8601String().split('T')[0], // Remove time
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(pv.violationType),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(5),
                child: pw.Text(
                  pv.inspectors.map((i) => i.surname).join(", "),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
