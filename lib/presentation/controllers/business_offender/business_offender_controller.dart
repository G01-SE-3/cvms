/*
File Name: <individual_offender_repository.dart>
Purpose: < Implements the controller for managing business offender form data, including handling user input, resetting fields, and managing form state>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';

class BusinessOffenderController extends ChangeNotifier {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final TextEditingController business_nameController = TextEditingController();
  final TextEditingController commercialRegisterNumberController = TextEditingController();
  final TextEditingController commercialRegisterDateController = TextEditingController();
  final TextEditingController editDateController = TextEditingController();
  final TextEditingController cancellationDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();
  final TextEditingController birthCertificateNumberController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherSurnameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController businessAddressController = TextEditingController();

  bool isLoading = false; 
  String? errorMessage; 

  void resetForm() {
    business_nameController.clear();
    commercialRegisterNumberController.clear();
    commercialRegisterDateController.clear();
    editDateController.clear();
    cancellationDateController.clear();
    nameController.clear();
    surnameController.clear();
    dateOfBirthController.clear();
    placeOfBirthController.clear();
    birthCertificateNumberController.clear();
    motherNameController.clear();
    motherSurnameController.clear();
    fatherNameController.clear();
    addressController.clear();
    businessAddressController.clear();
    errorMessage = null; 
    notifyListeners(); 
  }

  @override
  void dispose() {
    business_nameController.dispose();
    commercialRegisterNumberController.dispose();
    commercialRegisterDateController.dispose();
    editDateController.dispose();
    cancellationDateController.dispose();
    nameController.dispose();
    surnameController.dispose();
    dateOfBirthController.dispose();
    placeOfBirthController.dispose();
    birthCertificateNumberController.dispose();
    motherNameController.dispose();
    motherSurnameController.dispose();
    fatherNameController.dispose();
    addressController.dispose();
    businessAddressController.dispose();
    super.dispose();
  }

}
