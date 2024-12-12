import 'package:flutter/material.dart';
Widget buildEconomicOperatorsText() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 10),
          children: [
            WidgetSpan(
              child: SizedBox(width: 35),
            ),
            TextSpan(
              text: "Economic Operators /",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: "Individual Offenders",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }


  