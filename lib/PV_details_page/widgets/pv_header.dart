import 'package:flutter/material.dart';
import '../constants/strings/pv_header_strings.dart'; // Import the strings file

class PVHeader extends StatelessWidget {
  final Map<String, dynamic> pvData;

  const PVHeader({super.key, required this.pvData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        children: [
          const Text(
            PVHeaderStrings.title, // Use title from constants
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          _buildActionButton(PVHeaderStrings.editButton, const Color(0xFF7E9A77)),
          const SizedBox(width: 10),
          _buildActionButton(PVHeaderStrings.exportButton, const Color(0xFF7E9A77)),
          const SizedBox(width: 10),
          _buildActionButton(
            PVHeaderStrings
                .deleteButton, // Use delete button text from constants
            const Color(0xFFFFF4CF),
            textColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, {Color? textColor}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
