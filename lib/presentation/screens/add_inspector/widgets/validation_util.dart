import '../constants/strings/validation_util_strings.dart';

class ValidationUtil {
  static String? validateInspectorNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.pleaseEnterInspectorNumber;
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return ValidationUtilStrings.pleaseEnterValidInspectorNumber;
    }
    return null;
  }

  static String? validateInspectorName(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.pleaseEnterInspectorName;
    }
    return null;
  }

  static String? validateInspectorSurname(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.pleaseEnterInspectorSurname;
    }
    return null;
  }

  static String? validateInspectorBadgeNumber(String? value) {
    if (value != null && value.isNotEmpty && !RegExp(r'^\d+$').hasMatch(value)) {
      return ValidationUtilStrings.pleaseEnterValidBadgeNumber;
    }
    return null;
  }

  static String? validateDepartment(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationUtilStrings.pleaseSelectDepartment;
    }
    List<String> departments = [ValidationUtilStrings.hr, ValidationUtilStrings.finance, ValidationUtilStrings.operations,ValidationUtilStrings.it,ValidationUtilStrings.sales];
    if (!departments.contains(value)) {
      return ValidationUtilStrings.invalidDepartmentSelection;
    }
    return null;
  }

  static String? validateContactNumber(String? value) {
    if (value != null && value.isNotEmpty && !RegExp(r'^(05|06|07)\d{8}$').hasMatch(value)) {
      return ValidationUtilStrings.invalidContactNumber;
    }
    return null;
  }
}
