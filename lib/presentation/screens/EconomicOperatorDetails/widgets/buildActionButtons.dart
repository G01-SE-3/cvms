import 'package:flutter/material.dart';
Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 35),
        const Text(
          "Individual Economic Operator",
          style: TextStyle(fontSize: 12),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child: const Text(
            "Edit",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child: const Text(
            "Export",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFCF4CF),
          ),
          child: const Text(
            "Report",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
