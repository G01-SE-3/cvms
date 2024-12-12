import 'package:flutter/material.dart';
import 'widgets/rc_field.dart';
import 'widgets/date_field.dart';
import 'widgets/text_field.dart';
import 'widgets/price_field.dart';
import 'widgets/officer_dropdown.dart';
import 'widgets/expandable_section.dart';

class AddPVPage extends StatefulWidget {
  const AddPVPage({super.key});

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
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add PV",
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
                        label: const Text("See EO Details"),
                      ),
                    ],
                    const SizedBox(height: 12),
                    const DateField(
                      placeholder: "Select PV Date",
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: "Enter Violation Type",
                      isRequired: true,
                      controller: _violationTypeController,
                    ),
                    const SizedBox(height: 12),
                    OfficerDropdownField(
                      title: "Select Officer 1",
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
                      title: "Select Officer 2",
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
                      title: "Select Officer 3",
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
                      title: "Select Officer 4",
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
                      placeholder: "Total Non-Factorization Amount",
                      isRequired: true,
                      controller: _nonFactorizationController,
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder: "Total Illegal Profit",
                      isRequired: true,
                      controller: _illegalProfitController,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: "Enter Subsidized Good",
                      isNumeric: true,
                      controller: _subsidizedGoodController,
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: "Financial Penalty",
                      fields: [
                        CustomTextField(
                          placeholder: "Enter Penalty Amount",
                          isNumeric: true,
                        ),
                        DateField(
                          placeholder: "Select Penalty Date",
                        ),
                        CustomTextField(
                          placeholder: "Enter Payment Receipt Number",
                        ),
                        DateField(
                          placeholder: "Select Payment Receipt Date",
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: "Seizure",
                      fields: [
                        CustomTextField(
                          placeholder: "Enter Amount",
                          isNumeric: true,
                        ),
                        CustomTextField(
                          placeholder: "Enter Quantity",
                          isNumeric: true,
                        ),
                        CustomTextField(
                          placeholder: "Enter Goods",
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: "Closure",
                      fields: [
                        CustomTextField(
                          placeholder: "Enter Order Number",
                        ),
                        DateField(
                          placeholder: "Select Order Date",
                        ),
                        CustomTextField(
                          placeholder: "Enter Remarks",
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: "Legal Proceedings",
                      fields: [
                        CustomTextField(
                          placeholder: "Enter Case Number",
                        ),
                        DateField(
                          placeholder: "Select Date",
                        ),
                        CustomTextField(
                          placeholder: "Enter Court",
                        ),
                        CustomTextField(
                          placeholder: "Enter Jurisdiction",
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const ExpandableSection(
                      title: "National Card Registration",
                      fields: [
                        CustomTextField(
                          placeholder: "Enter Registration Number",
                        ),
                        DateField(
                          placeholder: "Select Registration Date",
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
                                  const SnackBar(content: Text("Form Saved")),
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
                            child: const Text(
                              "Save",
                              style: TextStyle(
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
                            child: const Text(
                              "Clear",
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
