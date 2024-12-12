import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/business_offender_form/widgets/TextFieldInput.dart';
import 'package:cvms/presentation/screens/business_offender_form/Business_offender_informations/BusinessOffenderInformation.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/businessoffenderinformation.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/messages.dart';
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/buttonsText.dart';

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
            TextFieldInput(BusinessName,businessNameController),
            TextFieldInput(CommercialRegisterNumber,CommercialRegisterNumberController),
            TextFieldInput(CommercialRegisterDate,CommercialRegisterDateController),
            TextFieldInput(EditDate,EditDateController),
            TextFieldInput(CancellationDate,CancellationDateController),
            TextFieldInput(Name,nameController),
            TextFieldInput(Surname,surnameController),
            TextFieldInput(birthInfo,dobController),
            TextFieldInput(BirthCertificateNumber,birthCertificateController),
            TextFieldInput(MotherName,motherNameController),
            TextFieldInput(MotherSurname,motherSurnameController),
            TextFieldInput(FatherName,fatherNameController),
            TextFieldInput(Address,addressController),
            TextFieldInput(BusinessAddress,businessAddressController),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(addmessage)),
                  );
                }
              },
              child:  Text(buttonAdd, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    ),
  );
}
