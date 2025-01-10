/*
File Name: <RowsCreation.dart>
Purpose: <generate a list of DataRow widgets for displaying individual offender information>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
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
