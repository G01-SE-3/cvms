import 'package:flutter/material.dart';
import '../../homepage/homepage.dart';
import '../constants/Strings/ChangesSavedDialog.dart';

void ChangesSavedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(ChangesSavedDialogStrings.title),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
          child: Text(ChangesSavedDialogStrings.okButtonText),
        ),
      ],
    ),
  );
}
