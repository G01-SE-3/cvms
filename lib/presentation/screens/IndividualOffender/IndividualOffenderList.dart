import 'package:flutter/material.dart';
import '../IndividualOffender/creations/ColumnsCreation.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderTitle.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/ButtonsText.dart';
import '../IndividualOffender/creations/RowsCreation.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class IndividualOffenderList extends StatefulWidget {
  const IndividualOffenderList({super.key});

  @override
  IndividualOffenderListScreen createState() => IndividualOffenderListScreen();
}

class IndividualOffenderListScreen extends State<IndividualOffenderList> {
  List<bool> checkedStates = List<bool>.filled(9, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(220.0), // Adjust height as needed
        child: GeneralAppBar(search: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Replacing second AppBar with Row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    onPressed: () {},
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
            ),
            // Main content inside the Container with no overflow
            Container(
              width: double.infinity, // Use full width
              height: 600,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: ColumnsCreation(),
                    rows: RowsCreation(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
