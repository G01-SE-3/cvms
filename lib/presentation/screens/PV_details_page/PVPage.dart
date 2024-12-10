import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_financial_penalty_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_national_card_registration.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_legal_preceedings_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_header.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_details_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_seizures_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/widgets/pv_closure_section.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_page_strings.dart';

class PVPage extends StatefulWidget {
  final String pvnumber;

  PVPage({required this.pvnumber});

  @override
  _PVPageState createState() => _PVPageState();
}

class _PVPageState extends State<PVPage> {
  Map<String, dynamic>? pvData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String data = await rootBundle.loadString(jsonFilePath);
    Map<String, dynamic> jsonMap = jsonDecode(data);

    if (jsonMap['pvnumber'] == widget.pvnumber) {
      setState(() {
        pvData = jsonMap;
      });
    } else {
      setState(() {
        pvData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (pvData == null) {
      return Scaffold(body: Container(child: Text("no data found")));
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PVHeader(pvData: pvData!),
            const SizedBox(height: 20),
            PVDetailsSection(pvData: pvData!),
            const SizedBox(height: 20),
            PVSeizuresSection(pvData: pvData!),
            const SizedBox(height: 20),
            PVClosureSection(pvData: pvData!),
            const SizedBox(height: 20),
            PVFinancialPenaltySection(pvData: pvData!),
            const SizedBox(height: 20),
            PVLegalProceedingsSection(pvData: pvData!),
            const SizedBox(height: 20),
            PVNationalCardSection(pvData: pvData!),
          ],
        ),
      ),
    );
  }
}
