import 'package:flutter/material.dart';
import '../constants/strings/BusinessOffenderInformations.dart';
List<DataRow> RowsCreation(Name,Surname) {
  return List<DataRow>.generate(
    9,
    (index) => DataRow(
      cells: [
        const DataCell(Text(BusinessOffenderStrings.businessName)),
        const DataCell(Text(BusinessOffenderStrings.name)),
        const DataCell(Text(BusinessOffenderStrings.surname)),
        const DataCell(Text(BusinessOffenderStrings.birthInfo)),
        const DataCell(Text(BusinessOffenderStrings.birthCertificateNumber)),
        DataCell(Text('$Name $Surname')),
        const DataCell(Text(BusinessOffenderStrings.name)),
        const DataCell(Text(BusinessOffenderStrings.address)),
        const DataCell(Text(BusinessOffenderStrings.address)),
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