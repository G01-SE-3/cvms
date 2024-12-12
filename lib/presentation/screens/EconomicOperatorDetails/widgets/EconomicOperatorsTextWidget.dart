import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/constants/strings/EconomicOperatorsText.dart';
Widget EconomicOperatorsTextWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: RichText(
        text:  TextSpan(
          style: const TextStyle(fontSize: 10),
          children: [
            const WidgetSpan(
              child: SizedBox(width: 35),
            ),
            TextSpan(
              text: EconomicOperator,
              style: const TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: IndividualOffender,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }


  