import 'package:flutter/material.dart';
import '../constants/strings/IndividualOffenderInformations.dart';
List<DataRow> RowsCreation() {
  return List<DataRow>.generate(
    9,
    (index) => DataRow(
      cells: [
        DataCell(Text(Name)),
        DataCell(Text(Surname)),
        DataCell(Text(birthInfo)),
        DataCell(Text(BirthCertificatenum)),
        DataCell(Text('$Name $Surname')),
        DataCell(Text(Name)),
        DataCell(Text(Address)),
        DataCell(Text(Address)),
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