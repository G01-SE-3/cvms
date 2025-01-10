/*
File Name: LanguageProvider.dart
Purpose: This file contains the implementation of the LanguageProvider class that is responsible for changing the language.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/closure_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/details_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/financial_penalty_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_header_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_legal_proceedings_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_national_card_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_page_strings.dart';
import 'package:cvms/presentation/screens/PV_details_page/constants/strings/pv_seizures_strings.dart';
//
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/pv_data_table.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/pvs_list_page_strings.dart';
import 'package:cvms/presentation/screens/PVs_list_page/constants/strings/table_header_strings.dart';
//
import 'package:cvms/presentation/screens/add_inspector/constants/strings/add_inspector_page_strings.dart';
import 'package:cvms/presentation/screens/add_inspector/constants/strings/custom_dropdown_field_strings.dart';
import 'package:cvms/presentation/screens/add_inspector/constants/strings/validation_util_strings.dart';
//
import 'package:cvms/presentation/screens/edit_inspector/constants/strings/custom_dropdown_field_for_departments_strings.dart';
import 'package:cvms/presentation/screens/edit_inspector/constants/strings/edit_inspector_page_strings.dart';
//
import 'package:cvms/presentation/screens/inspector_details/constants/strings/add_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspector_details/constants/strings/delete_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspector_details/constants/strings/export_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspector_details/constants/strings/inspector_details_strings.dart';
//
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/add_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/delete_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/export_inspector_button_strings.dart';
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/inspector_table_strings.dart';
import 'package:cvms/presentation/screens/inspectors_list/constants/strings/inspectors_list_strings.dart';
//
import 'package:cvms/presentation/screens/login/constants/strings/ForgotPasswordStrings.dart';
import 'package:cvms/presentation/screens/login/constants/strings/LoginButtonStrings.dart';
import 'package:cvms/presentation/screens/login/constants/strings/LoginPageStrings.dart';
import 'package:cvms/presentation/screens/login/constants/strings/PasswordFieldStrings.dart';
import 'package:cvms/presentation/screens/login/constants/strings/SignUpPromptStrings.dart';
import 'package:cvms/presentation/screens/login/constants/strings/UsernameFieldStrings.dart';
//
import 'package:cvms/presentation/screens/sign_up/constants/strings/LeftBackgroundStrings.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/LoginPromptStrings.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/SignUpFormStrings.dart';
import 'package:cvms/presentation/screens/sign_up/constants/strings/SignUpPage.dart';
//
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/Sidebar.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/buttons.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/date_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/latest_form.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/search_bar.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/validations.dart';

//
import 'package:cvms/presentation/screens/Settings/constants/Strings/Account.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/Languages.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/SettingsMenu.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/AccountList.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/ChangesSavedDialog.dart';
//
import 'package:cvms/presentation/screens/business_offender_form/constants/strings/businessoffenderinformation.dart';
//
import 'package:cvms/presentation/screens/BusinessOffender/constants/strings/BusinessOffenderInformations.dart';
//
import 'package:cvms/presentation/screens/individual_offender_form/constants/strings/individualoffenderinformation.dart';
import 'package:cvms/presentation/screens/IndividualOffender/constants/strings/IndividualOffenderInformations.dart';
//
import 'package:cvms/presentation/screens/add_PV_form/constants/strings/addPVStrings.dart';
//
import 'package:cvms/presentation/screens/homepage/constants/Strings/LineChart.dart';
import 'package:cvms/presentation/screens/homepage/constants/Strings/homepage.dart';

class LanguageProvider with ChangeNotifier {
  String _currentLanguage = 'fr';

  String get currentLanguage => _currentLanguage;

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString('language') ?? 'fr';
    notifyListeners();
    // Load all strings for the current language
    loadStrings(_currentLanguage);
  }

  Future<void> changeLanguage(String languageCode) async {
    _currentLanguage = languageCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    notifyListeners();
    loadStrings(languageCode);
  }

  void loadStrings(String languageCode) {
    HomePageStrings.loadLanguage(languageCode);
    LineChartStrings.loadLanguage(languageCode);
    ButtonStrings.loadLanguage(languageCode);
    DateFilterStrings.loadLanguage(languageCode);
    GeneralAppbarStrings.loadLanguage(languageCode);
    LatestPopupFormStrings.loadLanguage(languageCode);
    SearchStrings.loadLanguage(languageCode);
    SidebarStrings.loadLanguage(languageCode);
    ValidationStrings.loadLanguage(languageCode);
    IndividualDetailsStrings.loadLanguage(languageCode);
    IndividualOffenderStrings.loadLanguage(languageCode);
    BusinessOffenderStrings.loadLanguage(languageCode);
    BusinessOffStrings.loadLanguage(languageCode);
    ListWidgetStrings.loadLanguage(languageCode);
    ChangesSavedDialogStrings.loadLanguage(languageCode);
    AddInspectorPageStrings.loadLanguage(languageCode);
    CustomDropdownFieldStrings.loadLanguage(languageCode);
    ValidationUtilStrings.loadLanguage(languageCode);
    DeleteInspectorButtonStrings.loadLanguage(languageCode);
    ExportInspectorButtonStrings.loadLanguage(languageCode);
    InspectorTableStrings.loadLanguage(languageCode);
    InspectorsListStrings.loadLanguage(languageCode);
    Forgotpasswordstrings.loadLanguage(languageCode);
    Loginbuttonstrings.loadLanguage(languageCode);
    LoginPageStrings.loadLanguage(languageCode);
    Passwordfieldstrings.loadLanguage(languageCode);
    SignUpPromptStrings.loadLanguage(languageCode);
    Usernamefieldstrings.loadLanguage(languageCode);
    ClosureStrings.loadLanguage(languageCode);
    DetailsStrings.loadLanguage(languageCode);
    FinancialPenaltyStrings.loadLanguage(languageCode);
    PVHeaderStrings.loadLanguage(languageCode);
    PVLegalProceedingsStrings.loadLanguage(languageCode);
    PVNationalCardStrings.loadLanguage(languageCode);
    PVSeizuresStrings.loadLanguage(languageCode);
    PVDetailsLabels.loadLanguage(languageCode);
    PVListLabels.loadLanguage(languageCode);
    AccountStrings.loadLanguage(languageCode);
    LanguagesStrings.loadLanguage(languageCode);
    SettingsMenuStrings.loadLanguage(languageCode);
    LeftBackgroundStrings.loadLanguage(languageCode);
    AccountCreationButtonStrings.loadLanguage(languageCode);
    SignUpFormStrings.loadLanguage(languageCode);
    SignUpPageStrings.loadLanguage(languageCode);
    BusinessOffenderStrings.loadLanguage(languageCode);
    CustomDropdownFieldForDepartmentsStrings.loadLanguage(languageCode);
    EditInspectorPageStrings.loadLanguage(languageCode);
    ValidationUtilStrings.loadLanguage(languageCode);
    IndividualOffenderStrings.loadLanguage(languageCode);
    AddStrings.loadLanguage(languageCode);
    DeleteInspectorButtonStrings.loadLanguage(languageCode);
    ExportInspectorButtonStrings.loadLanguage(languageCode);
    InspectorTableStrings.loadLanguage(languageCode);
    InspectorsListStrings.loadLanguage(languageCode);
    AddPVStrings.loadLanguage(languageCode);
    AddInspectorPageStrings.loadLanguage(languageCode);
    CustomDropdownFieldStrings.loadLanguage(languageCode);
    ValidationUtilStrings.loadLanguage(languageCode);
    CustomDropdownFieldForDepartmentsStrings.loadLanguage(languageCode);
    EditInspectorPageStrings.loadLanguage(languageCode);
    ValidationUtilStrings.loadLanguage(languageCode);
    AddInspectorButtonWidgetStrings.loadLanguage(languageCode);
    DeleteInspectorButtonWidgetStrings.loadLanguage(languageCode);
    ExportInspectorButtonWidgetStrings.loadLanguage(languageCode);
    InspectorDetailsPageStrings.loadLanguage(languageCode);
  }
}
