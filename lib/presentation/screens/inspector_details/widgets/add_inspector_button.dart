import 'package:flutter/material.dart';
import '../../edit_inspector/edit_inspector_page.dart';
import '../constants/strings/add_inspector_button_widget_strings.dart'; 


class AddInspectorButtonWidget extends StatelessWidget {
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;

  const AddInspectorButtonWidget({
    Key? key,
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to EditInspectorPage with relevant data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditInspectorPage(
              inspectorNumber: '123456', // Example Inspector Number
              inspectorName: inspectorName,
              inspectorSurname: inspectorSurname,
              inspectorBadgeNumber: '987654', // Example Badge Number
              assignedDepartment: inspectorDepartment,
              contactNumber: contactNumber,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7E9A77),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(AddInspectorButtonWidgetStrings.addButtonText, style: const TextStyle(color: Colors.white)), // Use string from the class
    );
  }
}
