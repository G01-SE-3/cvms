import 'package:flutter/material.dart';
List<DataColumn> createColumns() {
    return [
      DataColumn(
        label: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Business Name'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Name'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Surname'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Date & Place of birth'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Birth Certificate num'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text("Mother's name & Surname"),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Father Name'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Address'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Business Address'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
      const DataColumn(
        label: Row(
          children: [
            Text('Menu'),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
    ];
  }