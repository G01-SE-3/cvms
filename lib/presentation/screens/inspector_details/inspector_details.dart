import 'package:flutter/material.dart';
import 'widgets/information_row.dart';
import 'widgets/add_inspector_button.dart';
import 'widgets/export_inspector_button.dart';
import 'widgets/delete_inspector_button.dart';
import 'constants/strings/inspector_details_strings.dart';

// this one defines the UI for the page and only creates an example by passing dummy data
class InspectorDetailsPage extends StatelessWidget {
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;

  // Constructor to receive data
  InspectorDetailsPage({
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row to show back arrow and inspector name
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),  // Return arrow
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous page
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "$inspectorName $inspectorSurname", // Show the inspector's name and surname
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Inspector name in black
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          inspectorName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Inspector name in black
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          inspectorDepartment,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the right
                      children: [
                        AddInspectorButtonWidget(
                          inspectorName: inspectorName,
                          inspectorSurname: inspectorSurname,
                          inspectorDepartment: inspectorDepartment,
                          contactNumber: contactNumber,
                        ),
                        const SizedBox(width: 8),
                        ExportInspectorButtonWidget(),
                        const SizedBox(width: 8),
                        DeleteInspectorButtonWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD9EAD3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        InspectorDetailsPageStrings.personalInfoTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF566038),
                        ),
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox.shrink()),
                  ],
                ),
              ),
              const InformationRow(
                label: InspectorDetailsPageStrings.inspectorNumberLabel,
                value: "123456",
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(
                label: InspectorDetailsPageStrings.inspectorNameLabel,
                value: inspectorName,
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(
                label: InspectorDetailsPageStrings.inspectorSurnameLabel,
                value: inspectorSurname,
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              const InformationRow(
                label: InspectorDetailsPageStrings.inspectorBadgeNumberLabel,
                value: "987654",
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(
                label: InspectorDetailsPageStrings.assignedDepartmentLabel,
                value: inspectorDepartment,
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(
                label: InspectorDetailsPageStrings.contactNumberLabel,
                value: contactNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
