import 'package:flutter/material.dart';
Widget buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Commercial Violations Management System",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Icon(Icons.bungalow, size: 18.0),
          SizedBox(width: 15),
          Icon(Icons.build, size: 18.0),
        ],
      ),
    );
  }
