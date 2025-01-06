import 'package:flutter/material.dart';

Widget StatCard(
      String title, String count, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(height: 10),
              Text(
                count,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
