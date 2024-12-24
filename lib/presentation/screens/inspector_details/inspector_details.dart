import 'package:flutter/material.dart';
import 'widgets/information_row.dart';
import 'widgets/add_inspector_button.dart';
import 'widgets/export_inspector_button.dart';
import 'widgets/delete_inspector_button.dart';
import 'constants/strings/inspector_details_strings.dart';

// This one defines the UI for the page and only creates an example by passing dummy data
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
                    icon: const Icon(Icons.arrow_back, color: Colors.black), // Return arrow
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous page
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Inspector Details", // Show the inspector's name and surname
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Inspector name in black
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
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

              // Control the spacing here (add more height for more space before the content starts)
              const SizedBox(height: 32), // <-- Added space here

              // "Table" container with shadow, width restriction, and centered alignment
              Center(
                child: Container(
                  width: 1200, // <-- Control the width here. Increase this value to make it wider.
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Title row
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
                      // Information rows
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorNumberLabel,
                        value: "123456",
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorNameLabel,
                        value: inspectorName,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorSurnameLabel,
                        value: inspectorSurname,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.inspectorBadgeNumberLabel,
                        value: "987654",
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.assignedDepartmentLabel,
                        value: inspectorDepartment,
                      ),
                      InformationRow(
                        label: InspectorDetailsPageStrings.contactNumberLabel,
                        value: contactNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
