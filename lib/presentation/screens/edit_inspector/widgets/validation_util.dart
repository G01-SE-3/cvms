import '../constants/strings/validation_util_strings.dart';

class ValidationUtil {
  static String? validateField(String? value, {required String fieldType}) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.emptyField;
    }

    if (fieldType == ValidationUtilStrings.number && double.tryParse(value) == null) {
      return ValidationUtilStrings.invalidNumber;
    }

    if (fieldType == ValidationUtilStrings.phone) {
      // Ensure the value contains only digits and has exactly 10 characters
      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
        return ValidationUtilStrings.invalidPhoneNumber;
      }
    }

    return null;
  }

  static String? validateDepartment(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.emptyDepartment; 
    }

    List<String> validDepartments = [
      ValidationUtilStrings.hr,
      ValidationUtilStrings.finance,
      ValidationUtilStrings.operations,
      ValidationUtilStrings.it,
      ValidationUtilStrings.sales,
    ];

    if (!validDepartments.contains(value)) {
      return ValidationUtilStrings.invalidDepartment;
    }

    return null;
  }
}