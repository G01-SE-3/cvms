import 'package:cvms/presentation/screens/individual_offender_form/constants/strings/IndividualOffenderFormTitle.dart';
import 'package:cvms/presentation/screens/individual_offender_form/individual_offender_informations/individualOffenderInformation.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/OffenderForm.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/controllers/individual_offender/individual_offender_controller.dart';

class IndividualOffenderForm extends StatefulWidget {
  const IndividualOffenderForm({super.key});

  @override
  State<IndividualOffenderForm> createState() => _IndividualOffenderFormState();
}

class _IndividualOffenderFormState extends State<IndividualOffenderForm> {
  late IndividualOffenderController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title), 
                    OffenderForm(context: context,controller: controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    commercial_register_numberController.dispose();
    commercial_register_dateController.dispose();
    edit_dateController.dispose();
    cancellation_dateController.dispose();
    date_of_birthController.dispose();
    place_of_birthController.dispose();
    birth_certificate_numberController.dispose();
    mother_nameController.dispose();
    mother_surnameController.dispose();
    father_nameController.dispose();
    addressController.dispose();
    business_addressController.dispose();
    super.dispose();
  }
}

