import 'package:flutter/material.dart';
import '../constants/strings/delete_inspector_button_strings.dart';  // Import the AppStrings class

class DeleteInspectorButton extends StatelessWidget {
  final Map<String, dynamic> inspector;
  final Function onDelete;

  const DeleteInspectorButton({
    super.key,
    required this.inspector,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, size: 18),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('${DeleteInspectorButtonStrings.deleteInspector} ${inspector[DeleteInspectorButtonStrings.delete]}'),  
            content: const Text(DeleteInspectorButtonStrings.areYouSureDelete),  
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(DeleteInspectorButtonStrings.cancel), 
              ),
              TextButton(
                onPressed: () {
                  onDelete();
                  Navigator.pop(context);
                },
                child: const Text(DeleteInspectorButtonStrings.delete),  
              ),
            ],
          ),
        );
      },
    );
  }
}
