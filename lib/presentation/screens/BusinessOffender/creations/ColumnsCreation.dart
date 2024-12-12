import 'package:flutter/material.dart';
import '../constants/strings/BusinessOffenderInformations.dart';
List<DataColumn> ColumnsCreation() {
    return [
      DataColumn(
        label: Row(
          children: [
            Text(BusinessName),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(Name),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(Surname),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(DateandPlaceofbirth),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(BirthCertificatenumber),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(MothersnameandSurname),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(FatherName),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(Address),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(BusinessAddress),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
      DataColumn(
        label: Row(
          children: [
            Text(Menu),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
    ];
  }


  