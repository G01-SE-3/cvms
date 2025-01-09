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
