/*
File Name: <ColumnsCreation.dart>
Purpose: <Defines a list of data columns for displaying business offender information in a table with sortable headers.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import '../constants/strings/BusinessOffenderInformations.dart';

List<DataColumn> ColumnsCreation() {
  return [
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.businessName),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.name),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.surname),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.dateAndPlaceOfBirth),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.birthCertificateNum),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.mothersNameAndSurname),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.fatherName),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.address),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.businessAddress),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text(BusinessOffStrings.menu),
          Icon(Icons.arrow_downward),
        ],
      ),
    ),
  ];
}
