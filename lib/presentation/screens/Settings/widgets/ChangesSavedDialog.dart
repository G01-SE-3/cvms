import 'package:flutter/material.dart';
import '../../homepage/homepage.dart';

void ChangesSavedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Changes Saved"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()), 
              (Route<dynamic> route) => false, 
            ); 
          },
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
