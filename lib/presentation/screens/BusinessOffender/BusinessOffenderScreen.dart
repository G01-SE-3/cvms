import 'package:flutter/material.dart';
import 'BusinessOffender.dart';
import 'widgets/createColumns.dart';
class BusinessOffenderScreen extends State<BusinessOffender> {
List<bool> checkedStates = List<bool>.filled(9, false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF545837), 
      child: Align(
        alignment: const Alignment(0, 0.7), 
        child: Container(
          width: 1300, 
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(12), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4), 
              ),
            ],
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent, 
            appBar: AppBar(
              title: const Text('Business offenders List'),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download, color: Colors.black),
                  label: const Text(
                    'Export',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add new Offender',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF545837),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: createColumns(),
                  rows: createRows(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
List<DataRow> createRows() {
    return List<DataRow>.generate(
      9,
      (index) => DataRow(
        cells: [
          DataCell(
            Checkbox(
              value: checkedStates[index],
              onChanged: (value) {
                setState(() {
                  checkedStates[index] = value ?? false;
                });
              },
              activeColor: const Color(0xFF545837),
            ),
          ),
          const DataCell(Text('business name')),
          const DataCell(Text('name')),
          const DataCell(Text('Surname')),
          const DataCell(Text('YYYY-MM-DD')),
          const DataCell(Text('00000000000')),
          const DataCell(Text('name, surname')),
          const DataCell(Text('name')),
          const DataCell(Text('Address')),
          const DataCell(Text('Address')),
          DataCell(
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
