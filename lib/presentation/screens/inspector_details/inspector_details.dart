import 'package:flutter/material.dart';
import 'widgets/information_row.dart';
import '../edit_inspector/edit_inspector.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Adjust height as needed
        child: const CVMSAppBar(),
      ),  
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
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Inspector name in black
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          inspectorDepartment,
                          style: TextStyle(
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
                        ElevatedButton(
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
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Export functionality
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            backgroundColor: const Color(0xFF7E9A77),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text("Export"),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Delete functionality
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFFCF4CF),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text("Delete"),
                        ),
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
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF566038),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox.shrink()),
                  ],
                ),
              ),
              const InformationRow(label: "Inspector Number", value: "123456"),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(label: "Inspector Name", value: inspectorName),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(label: "Inspector Surname", value: inspectorSurname),
              const Divider(color: Colors.grey, thickness: 0.5),
              const InformationRow(label: "Inspector Badge Number", value: "987654"),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(label: "Assigned Department", value: inspectorDepartment),
              const Divider(color: Colors.grey, thickness: 0.5),
              InformationRow(label: "Contact Number", value: contactNumber),
            ],
          ),
        ),
      ),
    );
  }
}
