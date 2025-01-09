import 'package:flutter/material.dart';
import 'ActionButtons.dart';
import 'PersonalInformationPage.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/constants/strings/AssociatedPVsText.dart';

Widget TabContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(8),
        child: ActionButtons(),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const PersonalInformationPage(),
            const SizedBox(height: 16),
            Text(
              AssociatedPVs,
              style: const TextStyle(
                color: Color(0xFF73AC8A),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
