/*
File Name: <ColumnsCreation.dart>
Purpose: <Defines a list of data columns for displaying individual offender information in a table with sortable headers.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import '../constants/strings/IndividualOffenderInformations.dart';

List<DataColumn> ColumnsCreation() {
  return [
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.Name),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.Surname),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.DateandPlaceofbirth),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.BirthCertificatenumber),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.MothersnameandSurname),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.FatherName),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.Address),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.BusinessAddress),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(IndividualDetailsStrings.Menu),
          const Icon(Icons.arrow_downward),
        ],
      ),
    ),
  ];
}
