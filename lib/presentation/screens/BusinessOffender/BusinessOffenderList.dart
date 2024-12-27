import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderTitle.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderInformations.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';

class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  BusinessOffenderListScreen createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
  final List<Map<String, String>> dummyOffenders = List.generate(
    10,
    (index) => {
      "businessName": "$BusinessName $index",
      "name": "$Name $index",
      "surname": "$Surname $index",
      "birthInfo": "$birthInfo $index",
      "birthCertificate": "$BirthCertificatenumber $index",
      "motherName": "$MothersnameandSurname $index",
      "fatherName": "$FatherName $index",
      "address": "$Address $index",
      "businessAddress": "$BusinessAddress $index",
    },
  );

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0), // Adjust height as needed
        child: GeneralAppBar(
            search: false, initialTabIndex: 3), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.file_download, color: Colors.black),
                      label: Text(
                        Export,
                        style: const TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BusinessOffenderForm()),
                        );
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: Text(
                        AddnewOffender,
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF545837),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.grey[200]),
                columns: _buildColumns(),
                rows: dummyOffenders.map((offender) {
                  return DataRow(
                    cells: _buildCells(offender),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      _buildDataColumn(BusinessName),
      _buildDataColumn(Name),
      _buildDataColumn(Surname),
      _buildDataColumn(DateandPlaceofbirth),
      _buildDataColumn(BirthCertificatenumber),
      _buildDataColumn(MothersnameandSurname),
      _buildDataColumn(FatherName),
      _buildDataColumn(Address),
      _buildDataColumn(BusinessAddress),
      const DataColumn(
        label: SizedBox(width: 50, child: Text('')),
      ),
    ];
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  List<DataCell> _buildCells(Map<String, String> offender) {
    return [
      DataCell(Text(offender["businessName"]!)),
      DataCell(Text(offender["name"]!)),
      DataCell(Text(offender["surname"]!)),
      DataCell(Text(offender["birthInfo"]!)),
      DataCell(Text(offender["birthCertificate"]!)),
      DataCell(Text(offender["motherName"]!)),
      DataCell(Text(offender["fatherName"]!)),
      DataCell(Text(offender["address"]!)),
      DataCell(Text(offender["businessAddress"]!)),
      DataCell(
        PopupMenuButton(
          icon: const Icon(Icons.more_vert, size: 18),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: const [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text("Edit"),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: const [
                  Icon(Icons.delete, size: 18),
                  SizedBox(width: 8),
                  Text("Delete"),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'edit') {
              // Edit logic
            } else if (value == 'delete') {
              // Delete logic
            }
          },
        ),
      ),
    ];
  }
}
