import 'package:flutter/material.dart';
import '../constants/strings/BusinessOffenderInformations.dart';

List<DataRow> RowsCreation(Name, Surname) {
  return List<DataRow>.generate(
    9,
    (index) => DataRow(
      cells: [
        DataCell(Text(BusinessOffStrings.businessName)),
        DataCell(Text(BusinessOffStrings.name)),
        DataCell(Text(BusinessOffStrings.surname)),
        DataCell(Text(BusinessOffStrings.birthInfo)),
        DataCell(Text(BusinessOffStrings.birthCertificateNumber)),
        DataCell(Text('$Name $Surname')),
        DataCell(Text(BusinessOffStrings.name)),
        DataCell(Text(BusinessOffStrings.address)),
        DataCell(Text(BusinessOffStrings.address)),
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
