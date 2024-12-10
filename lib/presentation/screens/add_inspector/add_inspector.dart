import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_dropdown_field.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';

class AddInspectorPage extends StatefulWidget {
  @override
  _AddInspectorPageState createState() => _AddInspectorPageState();
}

class _AddInspectorPageState extends State<AddInspectorPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _inspectorNumberController = TextEditingController();
  final TextEditingController _inspectorNameController = TextEditingController();
  final TextEditingController _inspectorSurnameController = TextEditingController();
  final TextEditingController _inspectorBadgeNumberController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();

  String? _selectedDepartment;
  String _message = "";

  @override
  void initState() {
    super.initState();
    _selectedDepartment = 'HR'; // Set a default value for department
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _inspectorNumberController.clear();
    _inspectorNameController.clear();
    _inspectorSurnameController.clear();
    _inspectorBadgeNumberController.clear();
    _contactNumberController.clear();
    setState(() {
      _selectedDepartment = 'HR';
      _message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Adjust height as needed
        child: const CVMSAppBar(),
      ),  
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
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
                      Navigator.pop(context); 
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Add an Inspector",
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
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                    CustomTextField(
                      controller: _inspectorNumberController,
                      hint: "Inspector number",
                      inputType: TextInputType.number,
                      validator: _validateInspectorNumber,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _inspectorNameController,
                      hint: "Inspector Name",
                      inputType: TextInputType.text,
                      validator: _validateInspectorName,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _inspectorSurnameController,
                      hint: "Inspector Surname",
                      inputType: TextInputType.text,
                      validator: _validateInspectorSurname,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _inspectorBadgeNumberController,
                      hint: "Inspector Badge Number",
                      inputType: TextInputType.number,
                      validator: _validateInspectorBadgeNumber,
                    ),
                    const SizedBox(height: 20),
                    CustomDropdownField(
                      selectedDepartment: _selectedDepartment,
                      onChanged: (value) {
                        setState(() {
                          _selectedDepartment = value;
                        });
                      },
                      validator: _validateDepartment,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _contactNumberController,
                      hint: "Contact Number",
                      inputType: TextInputType.phone,
                      validator: _validateContactNumber,
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
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                    ),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _message = 'Inspector added';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Inspector added'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        _clearForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF306238),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                    ),
                    child: const Text('Save'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              if (_message.isNotEmpty)
                Text(
                  _message,
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateInspectorNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter inspector number';
    }
    return null;
  }

  String? _validateInspectorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter inspector name';
    }
    return null;
  }

  String? _validateInspectorSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter inspector surname';
    }
    return null;
  }

  String? _validateInspectorBadgeNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter inspector badge number';
    }
    return null;
  }

  String? _validateDepartment(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a department';
    }
    return null;
  }

  String? _validateContactNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact number';
    }
    return null;
  }
}
