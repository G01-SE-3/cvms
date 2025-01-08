import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/business_offender_form/widgets/OffenderForm.dart';
import 'constants/strings/businessoffenderinformation.dart';

class BusinessOffenderForm extends StatelessWidget {
  const BusinessOffenderForm({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(BusinessOffenderStrings().form_offender),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), 
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ),
        body: SingleChildScrollView( 
          child: BusinessOffenderFormWidget( 
            context: context,
            showAdditionalInputs: false, 
            onCheckboxChanged: (value) {},
          ),
        ),
      );
}
