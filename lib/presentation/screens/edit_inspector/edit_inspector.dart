import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_dropdown_field.dart';

class EditInspectorPage extends StatefulWidget {
  final String inspectorNumber;
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorBadgeNumber;
  final String assignedDepartment;
  final String contactNumber;

  const EditInspectorPage({
    Key? key,
    required this.inspectorNumber,
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorBadgeNumber,
    required this.assignedDepartment,
    required this.contactNumber,
  }) : super(key: key);

  @override
  _EditInspectorPageState createState() => _EditInspectorPageState();
}

class _EditInspectorPageState extends State<EditInspectorPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _inspectorNumberController;
  late TextEditingController _inspectorNameController;
  late TextEditingController _inspectorSurnameController;
  late TextEditingController _inspectorBadgeNumberController;
  late TextEditingController _contactNumberController;

  late String _selectedDepartment;

  @override
  void initState() {
    super.initState();

    const validDepartments = ['HR', 'Finance', 'Operations', 'IT', 'Sales'];
    _selectedDepartment = validDepartments.contains(widget.assignedDepartment)
        ? widget.assignedDepartment
        : 'HR'; // Default to 'HR' if invalid or empty

    _inspectorNumberController = TextEditingController(text: widget.inspectorNumber);
    _inspectorNameController = TextEditingController(text: widget.inspectorName);
    _inspectorSurnameController = TextEditingController(text: widget.inspectorSurname);
    _inspectorBadgeNumberController = TextEditingController(text: widget.inspectorBadgeNumber);
    _contactNumberController = TextEditingController(text: widget.contactNumber);
  }

  void _resetForm() {
    setState(() {
      _inspectorNumberController.text = widget.inspectorNumber;
      _inspectorNameController.text = widget.inspectorName;
      _inspectorSurnameController.text = widget.inspectorSurname;
      _inspectorBadgeNumberController.text = widget.inspectorBadgeNumber;
      _contactNumberController.text = widget.contactNumber;

      const validDepartments = ['HR', 'Finance', 'Operations', 'IT', 'Sales'];
      _selectedDepartment = validDepartments.contains(widget.assignedDepartment)
          ? widget.assignedDepartment
          : 'HR';
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Color(0xFF306238),
                              ),
                              onPressed: () {
                                Navigator.pop(context); // This will handle the back action
                              },
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Edit Inspector",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF306238),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _inspectorNumberController,
                                hint: "Inspector number",
                                inputType: TextInputType.number,
                              ),
                              const SizedBox(height: 40),
                              CustomTextField(
                                controller: _inspectorNameController,
                                hint: "Inspector Name",
                                inputType: TextInputType.text,
                              ),
                              const SizedBox(height: 40),
                              CustomTextField(
                                controller: _inspectorSurnameController,
                                hint: "Inspector Surname",
                                inputType: TextInputType.text,
                              ),
                              const SizedBox(height: 40),
                              CustomTextField(
                                controller: _inspectorBadgeNumberController,
                                hint: "Inspector Badge Number",
                                inputType: TextInputType.text,
                              ),
                              const SizedBox(height: 40),
                              CustomDropdownFieldForDepartments(
                                selectedDepartment: _selectedDepartment,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedDepartment = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 40),
                              CustomTextField(
                                controller: _contactNumberController,
                                hint: "Contact Number",
                                inputType: TextInputType.phone,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF306238),
                        side: BorderSide(color: Color(0xFF306238)),
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                      ),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 400),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _showSnackbar('Inspector edited');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF306238),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                      ),
                      child: const Text('Edit'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
