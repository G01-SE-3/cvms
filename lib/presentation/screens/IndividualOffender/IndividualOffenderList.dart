import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderTitle.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderInformations.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/ButtonsText.dart';
import 'package:cvms/presentation/screens/individual_offender_form/IndividualOffenderForm.dart';

class IndividualOffenderList extends StatefulWidget {
  const IndividualOffenderList({super.key});

  @override
  IndividualOffenderListScreen createState() => IndividualOffenderListScreen();
}

class IndividualOffenderListScreen extends State<IndividualOffenderList> {
  final List<bool> checkboxStates = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
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
                MaterialPageRoute(builder: (context) => IndividualOffenderForm()),
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
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: SizedBox(
    width: double.infinity, // Ensure it stretches horizontally
    height: double.infinity, // Ensure it stretches vertically
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
            ),
            DataColumn(label: Text(Name)),
            DataColumn(label: Text(Surname)),
            DataColumn(label: Text(DateandPlaceofbirth)),
            DataColumn(label: Text(BirthCertificatenumber)),
            DataColumn(label: Text(MothersnameandSurname)),
            DataColumn(label: Text(FatherName)),
            DataColumn(label: Text(Address)),
            DataColumn(label: Text(BusinessAddress)),
            DataColumn(label: const Icon(Icons.more_vert)),
          ],
          rows: List<DataRow>.generate(
            10,
            (index) => DataRow(
              cells: [
                DataCell(
                  Checkbox(
                    value: checkboxStates[index],
                    activeColor: const Color(0xFF545837),
                    onChanged: (value) {
                      setState(() {
                        checkboxStates[index] = value!;
                      });
                    },
                  ),
                ),
                DataCell(Text('$Name $index')),
                DataCell(Text('$Surname $index')),
                DataCell(Text('$birthInfo $index')),
                DataCell(Text(BirthCertificatenumber)),
                DataCell(Text('$MothersnameandSurname $index')),
                DataCell(Text('$FatherName $index')),
                DataCell(Text(Address)),
                DataCell(Text(BusinessAddress)),
                DataCell(const Icon(Icons.more_vert)),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
),

    );
  }
}
