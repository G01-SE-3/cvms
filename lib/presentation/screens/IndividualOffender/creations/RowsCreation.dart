import 'package:flutter/material.dart';
import '../constants/strings/IndividualOffenderInformations.dart';

List<DataRow> RowsCreation() {
  return List<DataRow>.generate(
    9,
    (index) => DataRow(
      cells: [
        DataCell(Text(IndividualDetailsStrings.Name)),
        DataCell(Text(IndividualDetailsStrings.Surname)),
        DataCell(Text(IndividualDetailsStrings.birthInfo)),
        DataCell(Text(IndividualDetailsStrings.BirthCertificatenum)),
        DataCell(Text(
            '${IndividualDetailsStrings.Name} ${IndividualDetailsStrings.Surname}')),
        DataCell(Text(IndividualDetailsStrings.Name)),
        DataCell(Text(IndividualDetailsStrings.Address)),
        DataCell(Text(IndividualDetailsStrings.Address)),
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
