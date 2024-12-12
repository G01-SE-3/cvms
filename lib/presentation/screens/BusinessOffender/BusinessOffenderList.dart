import 'package:flutter/material.dart';
import '../BusinessOffender/creations/ColumnsCreation.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderTitle.dart';
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/ButtonsText.dart';
import '../BusinessOffender/creations/RowsCreation.dart';
class BusinessOffenderList extends StatefulWidget {
  const BusinessOffenderList({super.key});

  @override
  BusinessOffenderListScreen createState() => BusinessOffenderListScreen();
}

class BusinessOffenderListScreen extends State<BusinessOffenderList> {
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
              title:  Text(title),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download, color: Colors.black),
                  label:  Text(
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
                  columns: ColumnsCreation(),
                  rows: RowsCreation(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}




