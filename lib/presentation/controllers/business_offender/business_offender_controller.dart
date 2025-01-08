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
