import 'package:cvms/presentation/screens/business_offender_form/Business_offender_informations/BusinessOffenderInformation.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/BusinessOffenderFormTitle.dart';
import 'package:cvms/presentation/screens/business_offender_form/widgets/OffenderForm.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/controllers/business_offender/business_offender_controller.dart';

class BusinessOffenderForm extends StatefulWidget {
  const BusinessOffenderForm({super.key});

  @override
  State<BusinessOffenderForm> createState() => _BusinessOffenderFormState();
}

class _BusinessOffenderFormState extends State<BusinessOffenderForm> {
  late BusinessOffenderController controller;

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
    business_nameController.dispose();
    CommercialRegisterNumberController.dispose();
    CommercialRegisterDateController.dispose();
    EditDateController.dispose();
    CancellationDateController.dispose();
    nameController.dispose();
    surnameController.dispose();
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
