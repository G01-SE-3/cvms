import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/table_header_strings.dart';

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          pvListTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.file_download,
                size: 20,
                color: Color(0xFF344054),
              ),
              label: Text(
                exportLabel,
                style: const TextStyle(
                  color: Color(0xFF545837),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xFF545837),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(160, 48),
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              label: Text(
                addNewPVLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF545837),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(160, 48),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}