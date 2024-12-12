import 'package:flutter/material.dart';
import 'widgets/rc_field.dart';
import 'widgets/date_field.dart';
import 'widgets/text_field.dart';
import 'widgets/price_field.dart';
import 'widgets/officer_dropdown.dart';
import 'widgets/expandable_section.dart';
import 'constants/strings/add_PV_form_strings.dart';

class AddPVPage extends StatefulWidget {
  @override
  _AddPVPageState createState() => _AddPVPageState();
}

class _AddPVPageState extends State<AddPVPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _rcController = TextEditingController();
  final TextEditingController _violationTypeController =
      TextEditingController();
  final TextEditingController _nonFactorizationController =
      TextEditingController();
  final TextEditingController _illegalProfitController =
      TextEditingController();
  final TextEditingController _subsidizedGoodController =
      TextEditingController();

  String? _selectedOfficer1;
  String? _selectedOfficer2;
  String? _selectedOfficer3;
  String? _selectedOfficer4;

  final List<String> officerNames = [
    "Officer A",
    "Officer B",
    "Officer C",
    "Officer D",
    "Officer E"
  ];

  String? _rcError;
  bool _isRcExisting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Container(
            width: 1000,
            constraints: BoxConstraints(maxWidth: 1000),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.addPV, // Use the string from AppStrings
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    RcField(
                      controller: _rcController,
                      onRcChanged: (isRcExisting, error) {
                        setState(() {
                          _isRcExisting = isRcExisting;
                          _rcError = error;
                        });
                      },
                    ),
                    if (_rcError != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _rcError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                    if (_isRcExisting) ...[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.info_outline),
                        label: Text(AppStrings.seeEODetails), // Use the string
                      ),
                    ],
                    const SizedBox(height: 12),
                    DateField(
                      placeholder: AppStrings.selectPVDate, // Use the string
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: AppStrings.violationType, // Use the string
                      isRequired: true,
                      controller: _violationTypeController,
                    ),
                    const SizedBox(height: 12),
                    OfficerDropdownField(
                      title: AppStrings.selectOff1,
                      selectedOfficer: _selectedOfficer1,
                      officerNames: officerNames,
                      onChanged: (value) {
                        setState(() {
                          _selectedOfficer1 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    OfficerDropdownField(
                      title: AppStrings.selectOff2,
                      selectedOfficer: _selectedOfficer2,
                      officerNames: officerNames,
                      onChanged: (value) {
                        setState(() {
                          _selectedOfficer2 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    OfficerDropdownField(
                      title: AppStrings.selectOff3,
                      selectedOfficer: _selectedOfficer3,
                      officerNames: officerNames,
                      onChanged: (value) {
                        setState(() {
                          _selectedOfficer3 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    OfficerDropdownField(
                      title: AppStrings.selectOff4,
                      selectedOfficer: _selectedOfficer4,
                      officerNames: officerNames,
                      onChanged: (value) {
                        setState(() {
                          _selectedOfficer4 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder: AppStrings
                          .totalNonFactorizationAmount, // Use the string
                      isRequired: true,
                      controller: _nonFactorizationController,
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder:
                          AppStrings.totalIllegalProfit, // Use the string
                      isRequired: true,
                      controller: _illegalProfitController,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: AppStrings.subsidizedGood, // Use the string
                      isNumeric: true,
                      controller: _subsidizedGoodController,
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: AppStrings.financialPenalty, // Use the string
                      fields: [
                        CustomTextField(
                          placeholder:
                              AppStrings.penaltyAmount, // Use the string
                          isNumeric: true,
                        ),
                        DateField(
                          placeholder: AppStrings.penaltyDate, // Use the string
                        ),
                        CustomTextField(
                          placeholder:
                              AppStrings.paymentReceiptNumber, // Use the string
                        ),
                        DateField(
                          placeholder:
                              AppStrings.paymentReceiptDate, // Use the string
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ExpandableSection(
                      title: AppStrings.seizure, // Use the string
                      fields: [
                        CustomTextField(
                          placeholder: AppStrings.amount, // Use the string
                          isNumeric: true,
                        ),
                        CustomTextField(
                          placeholder: AppStrings.quantity, // Use the string
                          isNumeric: true,
                        ),
                        CustomTextField(
                          placeholder: AppStrings.goods, // Use the string
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ExpandableSection(
                      title: AppStrings.closure, // Use the string
                      fields: [
                        CustomTextField(
                          placeholder: AppStrings.orderNumber, // Use the string
                        ),
                        DateField(
                          placeholder: AppStrings.orderDate, // Use the string
                        ),
                        CustomTextField(
                          placeholder: AppStrings.remarks, // Use the string
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ExpandableSection(
                      title: AppStrings.legalProceedings, // Use the string
                      fields: [
                        CustomTextField(
                          placeholder: AppStrings.caseNumber, // Use the string
                        ),
                        DateField(
                          placeholder: AppStrings.date, // Use the string
                        ),
                        CustomTextField(
                          placeholder: AppStrings.court, // Use the string
                        ),
                        CustomTextField(
                          placeholder:
                              AppStrings.jurisdiction, // Use the string
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ExpandableSection(
                      title:
                          AppStrings.nationalCardRegistration, // Use the string
                      fields: [
                        CustomTextField(
                          placeholder:
                              AppStrings.registrationNumber, // Use the string
                        ),
                        DateField(
                          placeholder:
                              AppStrings.registrationDate, // Use the string
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(AppStrings
                                          .formSaved)), // Use the string
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(160, 50),
                              backgroundColor: const Color(0xFF545837),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              AppStrings.save, // Use the string
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                              _rcController.clear();
                              _violationTypeController.clear();
                              _nonFactorizationController.clear();
                              _illegalProfitController.clear();
                              _subsidizedGoodController.clear();
                              setState(() {
                                _selectedOfficer1 = null;
                                _selectedOfficer2 = null;
                                _selectedOfficer3 = null;
                                _selectedOfficer4 = null;
                                _rcError = null;
                                _isRcExisting = false;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(160, 50),
                              side: const BorderSide(color: Color(0xFF545837)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              AppStrings.clear, // Use the string
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF545837),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
