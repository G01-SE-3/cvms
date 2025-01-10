/*
File Name: <individual_offender_repository.dart>
Purpose: < Implements the controller for managing individual offender form data, including handling user input, resetting fields, and managing form state>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:flutter/material.dart';

class IndividualOffenderController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController commercialRegisterNumberController = TextEditingController();
  final TextEditingController commercialRegisterDateController = TextEditingController();
  final TextEditingController editDateController = TextEditingController();
  final TextEditingController cancellationDateController = TextEditingController();
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
    nameController.clear();
    surnameController.clear();
    commercialRegisterNumberController.clear();
    commercialRegisterDateController.clear();
    editDateController.clear();
    cancellationDateController.clear();
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
    nameController.dispose();
    surnameController.dispose();
    commercialRegisterNumberController.dispose();
    commercialRegisterDateController.dispose();
    editDateController.dispose();
    cancellationDateController.dispose();
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
