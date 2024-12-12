import 'package:cvms/presentation/screens/individual_offender_form/constants/strings/IndividualOffenderFormTitle.dart';
import 'package:cvms/presentation/screens/individual_offender_form/individual_offender_informations/individualOffenderInformation.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/OffenderForm.dart';
import 'package:flutter/material.dart';

class IndividualOffenderForm extends StatefulWidget {
  const IndividualOffenderForm({super.key});

  @override
  State<IndividualOffenderForm> createState() => _IndividualOffenderFormState();
}

class _IndividualOffenderFormState extends State<IndividualOffenderForm> {
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
                    OffenderForm(context: context),
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
    CommercialRegisterNumberController.dispose();
    CommercialRegisterDateController.dispose();
    EditDateController.dispose();
    CancellationDateController.dispose();
    dobController.dispose();
    birthCertificateController.dispose();
    motherNameController.dispose();
    motherSurnameController.dispose();
    fatherNameController.dispose();
    addressController.dispose();
    businessAddressController.dispose();
    super.dispose();
  }
}