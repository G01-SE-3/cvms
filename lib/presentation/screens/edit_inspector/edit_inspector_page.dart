/*
File Name: edit_inspector_page.dart
Purpose: Allows the user to edit an existing inspector's details, including their name, surname, badge number, contact number, and assigned department.
         The form validates user input and provides options to save the updated data or reset the form.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved.
*/



import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_dropdown_field_for_departments.dart';
import 'constants/strings/edit_inspector_page_strings.dart';
import 'widgets/validation_util.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';



/// Represents the page for editing an existing inspector's details.
/// This screen allows the user to modify the inspector's information,
/// including inspector number, name, surname, badge number, contact number,
/// and department. It provides validation for the input fields and 
/// allows saving the updated information to the repository.
/// 
/// Dependencies:
/// - [InspectorRepository] for updating the inspector's data in the system.
/// - [CustomTextField] and [CustomDropdownFieldForDepartments] for collecting input from the user.
/// - [ValidationUtil] for validating user inputs.
/// 
/// Features:
/// - Form to edit an existing inspector with validation on input fields.
/// - Buttons to reset the form or save the updated data.
/// - Displays success/error messages after updating the inspector's information.




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

  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();

  @override
  void initState() {
    super.initState();

    _selectedDepartment = widget.assignedDepartment.isNotEmpty
        ? widget.assignedDepartment
        : EditInspectorPageStrings.inspectorDefaultDepartment;

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

      _selectedDepartment = widget.assignedDepartment.isNotEmpty
          ? widget.assignedDepartment
          : EditInspectorPageStrings.inspectorDefaultDepartment;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _updateInspector() async {
    if (_formKey.currentState!.validate()) {
      try {
        final inspector = InspectorEntity(
          inspectorNumber: int.tryParse(_inspectorNumberController.text) ?? 0,
          name: _inspectorNameController.text,
          surname: _inspectorSurnameController.text,
          badgeNumber: int.tryParse(_inspectorBadgeNumberController.text) ?? 0,
          assignedDepartment: _selectedDepartment,
          contactNumber: int.tryParse(_contactNumberController.text) ?? 0,
        );

        await _inspectorRepository.updateInspector(inspector);

    
        _showSnackbar('Inspector data updated successfully!');

        
        Navigator.pop(context, true); 
      } catch (e) {
        _showSnackbar('Failed to update inspector data.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(  
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFF306238),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      EditInspectorPageStrings.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF306238),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _inspectorNumberController,
                        hint: EditInspectorPageStrings.inspectorNumberHint,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorNameController,
                        hint: EditInspectorPageStrings.inspectorNameHint,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorSurnameController,
                        hint: EditInspectorPageStrings.inspectorSurnameHint,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorBadgeNumberController,
                        hint: EditInspectorPageStrings.inspectorBadgeNumberHint,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      CustomDropdownFieldForDepartments(
                        selectedDepartment: _selectedDepartment,
                        onChanged: (value) {
                          setState(() {
                            _selectedDepartment = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _contactNumberController,
                        hint: EditInspectorPageStrings.contactNumberHint,
                        inputType: TextInputType.phone,
                        validator: (value) {
                          return ValidationUtil.validateField(value, fieldType: 'phone');
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF306238),
                        side: const BorderSide(color: Color(0xFF306238)),
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                      ),
                      child: Text(EditInspectorPageStrings.cancelButton),
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: _updateInspector,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF306238),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                      ),
                      child: Text(EditInspectorPageStrings.saveButton),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
