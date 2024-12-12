import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cvms/presentation/screens/PVs_list_page/widgets/table_header.dart';
import 'package:cvms/presentation/screens/PVs_list_page/widgets/pv_data_table.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/pvs_list_page_strings.dart';

class PVListPage extends StatefulWidget {
  @override
  _PVListPageState createState() => _PVListPageState();
}

class _PVListPageState extends State<PVListPage> {
  List<Map<String, dynamic>> tableData = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    try {
      String jsonString = await rootBundle.loadString(jsonFilePath);
      final List<dynamic> jsonData = json.decode(jsonString);

      setState(() {
        tableData = jsonData.map((item) {
          return {
            'PVid': item['PVid'],
            'PVnumber': item['PVnumber'],
            'offendercr': item['offendercr'],
            'offendername': item['offendername'],
            'pvissuedate': item['pvissuedate'],
            'violationtype': item['violationtype'],
            'inspectingofficers': item['inspectingofficers'],
          };
        }).toList();
      });

      print(tableData);
    } catch (e) {
      print('$loadDataError$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderRow(),
              const SizedBox(height: 16),
              Expanded(
                child: PVDataTable(tableData: tableData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
