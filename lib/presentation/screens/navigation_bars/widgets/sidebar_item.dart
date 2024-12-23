import 'package:flutter/material.dart';


Widget sidebar_item(BuildContext context, IconData icon, String text, Widget navigationRoute) {
  return InkWell(
   onTap: () {
   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigationRoute),
                );
},
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16.0),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}