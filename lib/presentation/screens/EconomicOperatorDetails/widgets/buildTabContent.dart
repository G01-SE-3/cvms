import 'package:flutter/material.dart';
import 'buildActionButtons.dart';
import 'PersonalInformationPage.dart';
Widget buildTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            "Sample Name",
            style: TextStyle(color: Colors.black, fontSize: 34),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: buildActionButtons(),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInformationPage(),
                const SizedBox(height: 16), // Adding space between widgets
                const Text(
                    "Associated PVs",
                    style: TextStyle(
                        color: Color(0xFF73AC8A),
                        fontSize: 16, // Optional: Adjust font size
                      ),
                  ),
                ],
            ),
        )

      ],
    );
  }
