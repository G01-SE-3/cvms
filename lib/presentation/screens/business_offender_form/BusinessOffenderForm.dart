import 'package:cvms/presentation/screens/business_offender_form/Business_offender_informations/BusinessOffenderInformation.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/BusinessOffenderFormTitle.dart';
import 'package:cvms/presentation/screens/business_offender_form/widgets/OffenderForm.dart';
import 'package:flutter/material.dart';

class BusinessOffenderForm extends StatefulWidget {
  const BusinessOffenderForm({super.key});

  @override
  State<BusinessOffenderForm> createState() => _BusinessOffenderFormState();
}

class _BusinessOffenderFormState extends State<BusinessOffenderForm> {
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
    businessNameController.dispose();
    CommercialRegisterNumberController.dispose();
    CommercialRegisterDateController.dispose();
    EditDateController.dispose();
    CancellationDateController.dispose();
    nameController.dispose();
    surnameController.dispose();
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