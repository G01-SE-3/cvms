import 'package:flutter/material.dart';
import '../../add_inspector/add_inspector_page.dart';
import '../constants/strings/add_inspector_button_strings.dart';

class AddInspectorButtonWidget extends StatelessWidget {
  const AddInspectorButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
      
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddInspectorPage()),
        );

     
        if (result == true) {
        
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Inspector added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      icon: const Icon(
        Icons.add,
        size: 20,
        color: Colors.white,
      ),
      label: const Text(
        Strings.addNewInspector,  
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C845E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(160, 48),
        alignment: Alignment.center,
      ),
    );
  }
}
