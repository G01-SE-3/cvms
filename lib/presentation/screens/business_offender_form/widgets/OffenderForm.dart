/*
File Name: <OffenderForm.dart>
Purpose: <provide a form for adding a business offender with necessary details and submitting the information to a repository.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import 'package:cvms/presentation/controllers/business_offender/business_offender_controller.dart';
import 'package:cvms/data/datasources/business_offender/business_offender_datasource.dart';
import 'package:cvms/data/repositories/business_offender/business_offender_repository_impl.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import '../../../../data/datasources/rc/register_number_datasource.dart';
import '../../../../data/repositories/rc/register_number_repository_impl.dart';
import '../../../../domain/entities/rc/register_number_entity.dart';
import 'TextFieldInput.dart';
import '../constants/strings/businessoffenderinformation.dart';

final registerNumberDataSource = RegisterNumberDataSource();
final registerNumberRepository =
    RegisterNumberRepositoryImpl(registerNumberDataSource);
final businessOffenderRepository = BusinessOffenderRepositoryImpl(
  BusinessOffenderDataSource(),
  registerNumberRepository,
);

final BusinessOffenderController formController = BusinessOffenderController();
final businessOffenderStrings = BusinessOffenderStrings();

class BusinessOffenderFormWidget extends StatefulWidget {
  const BusinessOffenderFormWidget({
    super.key,
    required BuildContext context,
    required bool showAdditionalInputs,
    required Null Function(dynamic value) onCheckboxChanged,
  });

  @override
  State<BusinessOffenderFormWidget> createState() =>
      _BusinessOffenderFormWidgetState();
}

class _BusinessOffenderFormWidgetState
    extends State<BusinessOffenderFormWidget> {
  bool showAdditionalInputs = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFieldInput(
                    BusinessOffenderStrings.commercial_register_number,
                    formController.commercialRegisterNumberController,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: showAdditionalInputs,
                        onChanged: (value) {
                          setState(() {
                            showAdditionalInputs = value ?? false;
                          });
                        },
                      ),
                      Text(BusinessOffenderStrings.register_number_details),
                    ],
                  ),
                  if (showAdditionalInputs) ...[
                    _buildInputFieldWithDatePicker(
                      label: BusinessOffenderStrings.commercial_register_date,
                      controller:
                          formController.commercialRegisterDateController,
                    ),
                    const SizedBox(height: 16),
                    _buildInputFieldWithDatePicker(
                      label: BusinessOffenderStrings.edit_date,
                      controller: formController.editDateController,
                    ),
                    const SizedBox(height: 16),
                    _buildInputFieldWithDatePicker(
                      label: BusinessOffenderStrings.cancellation_date,
                      controller: formController.cancellationDateController,
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextFieldInput(BusinessOffenderStrings.business_name,
                      formController.business_nameController),
                  TextFieldInput(BusinessOffenderStrings.name,
                      formController.nameController),
                  TextFieldInput(BusinessOffenderStrings.surname,
                      formController.surnameController),
                  TextFieldInput(BusinessOffenderStrings.date_of_birth,
                      formController.dateOfBirthController),
                  TextFieldInput(BusinessOffenderStrings.place_of_birth,
                      formController.placeOfBirthController),
                  TextFieldInput(
                      BusinessOffenderStrings.birth_certificate_number,
                      formController.birthCertificateNumberController),
                  TextFieldInput(BusinessOffenderStrings.mother_name,
                      formController.motherNameController),
                  TextFieldInput(BusinessOffenderStrings.mother_surname,
                      formController.motherSurnameController),
                  TextFieldInput(BusinessOffenderStrings.father_name,
                      formController.fatherNameController),
                  TextFieldInput(BusinessOffenderStrings.address,
                      formController.addressController),
                  TextFieldInput(BusinessOffenderStrings.business_address,
                      formController.businessAddressController),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF306238),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (formController.formKey.currentState!.validate()) {
                        submitForm(
                            context, formController, showAdditionalInputs);
                      }
                    },
                    child: Text(
                      BusinessOffenderStrings.add_button,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputFieldWithDatePicker({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFDDE5CD),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          controller.text = '${pickedDate.toLocal()}'.split(' ')[0];
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return BusinessOffenderStrings.date_empty_error;
        }
        return null;
      },
    );
  }
}

void submitForm(BuildContext context, BusinessOffenderController formController,
    bool showAdditionalInputs) async {
  DateTime? commercialRegisterDate;
  DateTime? editDate;
  DateTime? cancellationDate;

  if (showAdditionalInputs) {
    commercialRegisterDate =
        DateTime.tryParse(formController.commercialRegisterDateController.text);
    editDate = DateTime.tryParse(formController.editDateController.text);
    cancellationDate =
        DateTime.tryParse(formController.cancellationDateController.text);
  }

  final String registerNumber =
      formController.commercialRegisterNumberController.text;
  // ignore: unnecessary_null_comparison
  if (registerNumber == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(BusinessOffenderStrings.register_number_validation)),
    );
    return;
  }

  final offender = BusinessOffender(
    business_id: 0, // business_id is set to 0 only temporarily
    business_name: formController.business_nameController.text,
    name: formController.nameController.text,
    surname: formController.surnameController.text,
    date_of_birth: formController.dateOfBirthController.text,
    place_of_birth: formController.placeOfBirthController.text,
    birth_certificate_number:
        formController.birthCertificateNumberController.text,
    mother_name: formController.motherNameController.text,
    mother_surname: formController.motherSurnameController.text,
    father_name: formController.fatherNameController.text,
    address: formController.addressController.text,
    business_address: formController.businessAddressController.text,
  );

  try {
    final addedOffender =
        await businessOffenderRepository.addOffender(offender);
    final int businessId = addedOffender.business_id;

    final registerNumberEntity = RegisterNumberEntity(
      individualOffenderId: null,
      businessOffenderId: businessId,
      registerNumber: registerNumber,
      commercialRegisterDate: commercialRegisterDate?.toIso8601String() ?? '',
      editDate: editDate?.toIso8601String() ?? '',
      cancellationDate: cancellationDate?.toIso8601String() ?? '',
    );

    await registerNumberRepository.insertRegisterNumber(registerNumberEntity);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(BusinessOffenderStrings.success)),
    );

    formController.resetForm();
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${BusinessOffenderStrings.failed} $error')),
    );
  }
}
