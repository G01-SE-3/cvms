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
