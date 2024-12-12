import 'package:flutter/material.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/custom_dropdown_field_for_departments.dart';
import 'package:cvms/presentation/screens/Appbars/widgets/general_appbar.dart';
import 'constants/strings/edit_inspector_page_strings.dart';
import 'widgets/validation_util.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSnackbar(EditInspectorPageStrings.inspectorAddedMessage);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF306238),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 30.0),
                    ),
                    child: Text(EditInspectorPageStrings.saveButton),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
