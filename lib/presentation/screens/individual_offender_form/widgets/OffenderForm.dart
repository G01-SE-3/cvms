import 'package:cvms/data/datasources/individual_offender/individual_offender_datasource.dart';
import 'package:cvms/data/repositories/individual_offender/individual_offender_repository_impl.dart';
import 'package:cvms/presentation/screens/individual_offender_form/constants/strings/individualoffenderinformation.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/controllers/individual_offender/individual_offender_controller.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import '../../../../domain/entities/rc/register_number_entity.dart';
import '../../BusinessOffender/BusinessOffenderList.dart';
import 'TextFieldInput.dart';

final IndividualOffenderController formController = IndividualOffenderController();
final IndividualOffenderRepository = IndividualOffenderRepositoryImpl(
  IndividualOffenderDataSource(),
  registerNumberRepository,
);

class IndividualOffenderFormWidget extends StatefulWidget {
  const IndividualOffenderFormWidget({super.key});

  @override
  State<IndividualOffenderFormWidget> createState() =>
      _IndividualOffenderFormWidgetState();
}

class _IndividualOffenderFormWidgetState
    extends State<IndividualOffenderFormWidget> {
  bool showAdditionalInputs = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formController.formKey,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFieldInput(
                    IndividualOffenderStrings.commercialRegisterNumber, formController.commercialRegisterNumberController),

                const SizedBox(height: 10),
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
                    const Text(IndividualOffenderStrings.showRegisterNumberDetails),
                  ],
                ),

                  if (showAdditionalInputs) ...[
                  _buildDatePickerField(
                    label: IndividualOffenderStrings.commercialRegisterDate,
                    controller: formController.commercialRegisterDateController,
                  ),
                   const SizedBox(height: 16),
                  _buildDatePickerField(
                    label: IndividualOffenderStrings.editDate,
                    controller: formController.editDateController,
                  ),
                    const SizedBox(height: 16),
                  _buildDatePickerField(
                    label: IndividualOffenderStrings.cancellationDate,
                    controller: formController.cancellationDateController,
                  ),
                ],

                TextFieldInput(IndividualOffenderStrings.name, formController.nameController),
                TextFieldInput(IndividualOffenderStrings.surname, formController.surnameController),
                TextFieldInput(
                    IndividualOffenderStrings.dateOfBirth, formController.dateOfBirthController),
                TextFieldInput(
                    IndividualOffenderStrings.placeOfBirth, formController.placeOfBirthController),
                TextFieldInput(IndividualOffenderStrings.birthCertificateNumber,
                    formController.birthCertificateNumberController),
                TextFieldInput(IndividualOffenderStrings.motherName, formController.motherNameController),
                TextFieldInput(
                    IndividualOffenderStrings.motherSurname, formController.motherSurnameController),
                TextFieldInput(IndividualOffenderStrings.fatherName, formController.fatherNameController),
                TextFieldInput(IndividualOffenderStrings.address, formController.addressController),
                TextFieldInput(
                    IndividualOffenderStrings.businessAddress, formController.businessAddressController),
                
                
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF306238),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (formController.formKey.currentState!.validate()) {
                      submitForm(context, formController, showAdditionalInputs);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          return '$label cannot be empty';
        }
        return null;
      },
    );
  }

void submitForm(BuildContext context, IndividualOffenderController formController, bool showAdditionalInputs) async {
  DateTime? commercialRegisterDate;
  DateTime? editDate;
  DateTime? cancellationDate;

  if (showAdditionalInputs) {
    commercialRegisterDate = DateTime.tryParse(formController.commercialRegisterDateController.text);
    editDate = DateTime.tryParse(formController.editDateController.text);
    cancellationDate = DateTime.tryParse(formController.cancellationDateController.text);
  }

  final String registerNumber = formController.commercialRegisterNumberController.text;
  if (registerNumber == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(IndividualOffenderStrings.validationError)),
    );
    return;
  }

  final offender = IndividualOffender(
    individual_id: 0, // Temporarily set individual_id to 0
    name: formController.nameController.text,
    surname: formController.surnameController.text,
    date_of_birth: formController.dateOfBirthController.text,
    place_of_birth: formController.placeOfBirthController.text,
    birth_certificate_number: formController.birthCertificateNumberController.text,
    mother_name: formController.motherNameController.text,
    mother_surname: formController.motherSurnameController.text,
    father_name: formController.fatherNameController.text,
    address: formController.addressController.text,
    business_address: formController.businessAddressController.text,
  );

  try {
    
    final addedOffender = await IndividualOffenderRepository.addIndividualOffender(offender);
    final int individualOffenderId = addedOffender.individual_id; 

    final registerNumberEntity = RegisterNumberEntity(
      individualOffenderId: individualOffenderId,
      businessOffenderId: null,
      registerNumber: registerNumber,
      commercialRegisterDate: commercialRegisterDate?.toIso8601String() ?? '',
      editDate: editDate?.toIso8601String() ?? '',
      cancellationDate: cancellationDate?.toIso8601String() ?? '',
    );

    await registerNumberRepository.insertRegisterNumber(registerNumberEntity);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(IndividualOffenderStrings.successMessage)),
    );

    formController.resetForm();

  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${IndividualOffenderStrings.failureMessage} $error')),
    );
  }
  }
}
