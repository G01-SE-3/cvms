import 'package:flutter/material.dart'; 
Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF638773)
            ),
          ),
          Text(
            value,
            style:const TextStyle(
              color: Color(0xFF121714)
          )),
        ],
      ),
    );
}



