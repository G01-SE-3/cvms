import 'package:flutter/material.dart';
import '../constants/strings/delete_inspector_button_strings.dart';  // Import the AppStrings class

class DeleteInspectorButton extends StatelessWidget {
  final Map<String, dynamic> inspector;
  final Function onDelete;

  const DeleteInspectorButton({
    Key? key,
    required this.inspector,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, size: 18),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('${DeleteInspectorButtonStrings.deleteInspector} ${inspector['Name']}'),  // Use the string from AppStrings
            content: Text(DeleteInspectorButtonStrings.areYouSureDelete),  // Use the string from AppStrings
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(DeleteInspectorButtonStrings.cancel),  // Use the string from AppStrings
              ),
              TextButton(
                onPressed: () {
                  onDelete();
                  Navigator.pop(context);
                },
                child: Text(DeleteInspectorButtonStrings.delete),  // Use the string from AppStrings
              ),
            ],
          ),
        );
      },
    );
  }
}
