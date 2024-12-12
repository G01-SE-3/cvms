import 'package:flutter/material.dart';

// Define a list of DropdownMenuItems for "Type"
const List<DropdownMenuItem<String>> typeDropdownItems = [
  DropdownMenuItem(value: "type", child: Text("type")),
  DropdownMenuItem(value: "PV", child: Text("PV")),
  DropdownMenuItem(value: "RC", child: Text("RC")),
];

// Define a list of DropdownMenuItems for "Filter"
const List<DropdownMenuItem<String>> filterDropdownItems = [
  DropdownMenuItem(value: "Latest", child: Text("Latest")),
  DropdownMenuItem(value: "Date", child: Text("Date")),
];