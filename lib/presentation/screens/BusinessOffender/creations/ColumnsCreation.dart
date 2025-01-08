import 'package:flutter/material.dart';
import '../constants/strings/BusinessOffenderInformations.dart';

List<DataColumn> ColumnsCreation() {
    return [
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.businessName),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.name),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.surname),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.dateAndPlaceOfBirth),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.birthCertificateNum),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.mothersNameAndSurname),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.fatherName),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.address),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.businessAddress),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text(BusinessOffenderStrings.menu),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
    ];
  }


  