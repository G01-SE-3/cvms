/*
File Name: add_inspector_page.dart
Purpose: Allows the user to add a new inspector's details, including their name, surname, badge number, contact number, and assigned department.
         The form validates user input and provides options to save the inspector data to the repository or reset the form.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved.
*/


import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_dropdown_field.dart';
import 'widgets/validation_util.dart';
import 'constants/strings/add_inspector_page_strings.dart';

/// Represents the page for adding a new inspector.
/// This screen allows the user to fill out a form with the inspector's details
/// (e.g., inspector number, name, surname, badge number, contact number, department)
/// and save the inspector to the repository. It also includes validation for the input fields
/// and provides feedback messages after saving or clearing the form.
/// 
/// Dependencies:
/// - [InspectorRepository] for adding the inspector data to the system.
/// - [CustomTextField] and [CustomDropdownField] for collecting input from the user.
/// - [ValidationUtil] for validating user inputs.
/// 
/// Features:
/// - Form to add an inspector with validation on input fields.
/// - Buttons to cancel or save the data.
/// - Displays success/error messages based on the operation's outcome.
class AddInspectorPage extends StatefulWidget {
  @override
  _AddInspectorPageState createState() => _AddInspectorPageState();
}


class _AddInspectorPageState extends State<AddInspectorPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _inspectorNumberController =
      TextEditingController();
  final TextEditingController _inspectorNameController =
      TextEditingController();
  final TextEditingController _inspectorSurnameController =
      TextEditingController();
  final TextEditingController _inspectorBadgeNumberController =
      TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();

  String? _selectedDepartment;
  String _message = AddInspectorPageStrings.message;

  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();

  @override
  void initState() {
    super.initState();
    _selectedDepartment = AddInspectorPageStrings.inspectorDefaultDepartment;
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _inspectorNumberController.clear();
    _inspectorNameController.clear();
    _inspectorSurnameController.clear();
    _inspectorBadgeNumberController.clear();
    _contactNumberController.clear();
    setState(() {
      _selectedDepartment = AddInspectorPageStrings.inspectorDefaultDepartment;
      _message = "";
    });
  }

  void _addInspector() {
    if (_formKey.currentState!.validate()) {
      final contactNumber = int.tryParse(_contactNumberController.text);
      if (contactNumber == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Please enter a valid contact number"),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }

      final inspector = InspectorEntity(
        inspectorNumber: int.tryParse(_inspectorNumberController.text) ?? 0,
        name: _inspectorNameController.text,
        surname: _inspectorSurnameController.text,
        badgeNumber: int.tryParse(_inspectorBadgeNumberController.text) ?? 0,
        assignedDepartment: _selectedDepartment ?? '',
        contactNumber: contactNumber,
      );

      _inspectorRepository.addInspector(inspector);

      setState(() {
        _message = AddInspectorPageStrings.inspectorAddedMessage;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AddInspectorPageStrings.inspectorAddedMessage),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );

      _clearForm();
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
                      AddInspectorPageStrings.title,
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
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _inspectorNumberController,
                        hint: AddInspectorPageStrings.inspectorNumberHint,
                        inputType: TextInputType.number,
                        validator: ValidationUtil.validateInspectorNumber,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorNameController,
                        hint: AddInspectorPageStrings.inspectorNameHint,
                        inputType: TextInputType.text,
                        validator: ValidationUtil.validateInspectorName,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorSurnameController,
                        hint: AddInspectorPageStrings.inspectorSurnameHint,
                        inputType: TextInputType.text,
                        validator: ValidationUtil.validateInspectorSurname,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _inspectorBadgeNumberController,
                        hint: AddInspectorPageStrings.inspectorBadgeNumberHint,
                        inputType: TextInputType.number,
                        validator: ValidationUtil.validateInspectorBadgeNumber,
                      ),
                      const SizedBox(height: 20),
                      CustomDropdownField(
                        selectedDepartment: _selectedDepartment,
                        onChanged: (value) {
                          setState(() {
                            _selectedDepartment = value;
                          });
                        },
                        validator: ValidationUtil.validateDepartment,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _contactNumberController,
                        hint: AddInspectorPageStrings.contactNumberHint,
                        inputType: TextInputType.phone,
                        validator: ValidationUtil.validateContactNumber,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _clearForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF306238),
                        side: const BorderSide(color: Color(0xFF306238)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 30.0),
                      ),
                      child: Text(AddInspectorPageStrings.cancelButton),
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: _addInspector,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF306238),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 30.0),
                      ),
                      child: Text(AddInspectorPageStrings.saveButton),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                if (_message.isNotEmpty)
                  Center(
                      child: Text(_message,
                          style: TextStyle(fontSize: 16, color: Colors.green))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
