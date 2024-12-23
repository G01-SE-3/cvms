import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/TextFieldInput.dart';
import 'package:cvms/presentation/screens/individual_offender_form/constants/strings/individualoffenderinformation.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/presentation/screens/individual_offender_form/individual_offender_informations/IndividualOffenderInformation.dart';
import 'package:cvms/presentation/controllers/individual_offender/individual_offender_controller.dart';


final controller = IndividualOffenderController();

Widget OffenderForm({
  required BuildContext context,
  
}) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldInput(name,  nameController),
            TextFieldInput(surname,  surnameController),
            TextFieldInput(date_of_birth,  date_of_birthController),
            TextFieldInput(place_of_birth,  place_of_birthController),
            TextFieldInput(birth_certificate_number,  birth_certificate_numberController),
            TextFieldInput(mother_name,  mother_nameController),
            TextFieldInput(mother_surname,  mother_surnameController),
            TextFieldInput(father_name,  father_nameController),
            TextFieldInput(address,  addressController),
            TextFieldInput(business_address,  business_addressController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF306238),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  submitForm(context);
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
  );
}



void clearForm() {
  nameController.clear();
  surnameController.clear();
  date_of_birthController.clear();
  place_of_birthController.clear();
  birth_certificate_numberController.clear();
  mother_nameController.clear();
  mother_surnameController.clear();
  father_nameController.clear();
  addressController.clear();
  business_addressController.clear();
}
void submitForm(BuildContext context) {
  if (formKey.currentState!.validate()) {
    // Create a BusinessOffender instance from input
    final offender = IndividualOffender(
      individual_id: 0,
      name: nameController.text,
      surname: surnameController.text,
      date_of_birth: date_of_birthController.text,
      place_of_birth: place_of_birthController.text,
      birth_certificate_number: birth_certificate_numberController.text,
      mother_name: mother_nameController.text,
      mother_surname: mother_surnameController.text,
      father_name: father_nameController.text,
      address: addressController.text,
      business_address: business_addressController.text,
    );

    // Use the controller to add the offender
    controller.createOffender(offender).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Individual Offender added successfully!')),
      );
      clearForm();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add offender: $error')),
      );
    }).whenComplete(() async {
      await controller.closeConnection();  
    });
   
  }
}

