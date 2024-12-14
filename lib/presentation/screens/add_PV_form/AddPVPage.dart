import 'package:cvms/domain/entities/pv/closure.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/closure_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/dynamic_seizures_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/financial_penalty_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/legal_proceedings_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/national_card_registration_section.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/seizure_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'widgets/rc_field.dart';
import 'widgets/date_field.dart';
import 'widgets/text_field.dart';
import 'widgets/price_field.dart';
import 'widgets/officer_dropdown.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/domain/entities/pv/legal_proceedings.dart';
import 'package:cvms/domain/entities/pv/financial_penalty.dart';
import 'package:cvms/domain/entities/pv/national_card_reg.dart';
import 'package:cvms/domain/entities/pv/seizure.dart';
import 'selection_globals.dart';
import'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class AddPVPage extends StatefulWidget {
  const AddPVPage({super.key});

  @override
  _AddPVPageState createState() => _AddPVPageState();
}

class _AddPVPageState extends State<AddPVPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _rcController = TextEditingController();
  final TextEditingController _pvNumberController = TextEditingController();
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

  DateTime? _selectedDate; // To hold the selected date

  // Track Seizure Sections
  final List<SeizureSection> _seizureSections = [];

  List<Seizure>? seizures;

  void _handleSeizuresUpdated(List<Seizure>? updatedSeizures) {
    setState(() {
      seizures = updatedSeizures;
    });
    print("Updated seizures: $seizures"); // You can use the updated list here
  }

  Closure? _closure;
  FinancialPenalty? _financialPenalty;
  LegalProceedings? _legalProceedings;
  NationalCardRegistration? _nationalCardRegistration;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer:const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: GeneralAppBar(search:false),
      ),
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
                    CustomTextField(
                      placeholder: "Enter PV Number",
                      isRequired: true,
                      controller: _pvNumberController,
                      isNumeric: true, // Ensure the input is numeric
                    ),
                    const SizedBox(height: 12),
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
                    ] else ...[
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.person_add),
                        label: const Text("Add Offender"),
                      ),
                    ],
                    const SizedBox(height: 12),
                    DateField(
                      placeholder: "Select PV Date",
                      isRequired: true,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
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
                      controller: _nonFactorizationController,
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder: "Total Illegal Profit",
                      controller: _illegalProfitController,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: "Enter Subsidized Good",
                      isNumeric: false,
                      controller: _subsidizedGoodController,
                    ),
                    const SizedBox(height: 16),
                    // OPTIONAL SECTIONS
                    ClosureSection(
                      onClosureUpdated: (closure) {
                        // Pass this Closure data to your PV object or update state
                        // For example:
                        setState(() {
                          _closure = closure; // Update closure data
                        });
                      },
                    ),

                    FinancialPenaltySection(
                      onPenaltyUpdated: (penalty) {
                        // Pass this FinancialPenalty data to your PV object or update state
                        setState(() {
                          _financialPenalty =
                              penalty; // Update financialPenalty data
                        });
                      },
                    ),

                    LegalProceedingsSection(
                      onLegalProceedingsUpdated: (legalProceedings) {
                        setState(() {
                          _legalProceedings =
                              legalProceedings; // Update the state with the new legalProceedings data
                        });
                      },
                    ),
                    NationalCardRegistrationSection(
                      onNationalCardRegistrationUpdated:
                          (nationalCardRegistration) {
                        setState(() {
                          _nationalCardRegistration =
                              nationalCardRegistration; // Update the state with the new nationalCardRegistration data
                        });
                      },
                    ),
                    DynamicSeizureSections(
                      onSeizuresUpdated:
                          _handleSeizuresUpdated, // Pass the callback to DynamicSeizureSections
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  _selectedDate != null &&
                                  (_isRcExisting ||
                                      _rcController.text.isNotEmpty)) {
                                // Validate Closure data if closureSelection is true
                                if (closureSelection &&
                                    (_closure == null ||
                                        _closure!.closureOrderDate
                                            .isBefore(DateTime(1900)))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Closure order date is required and must be valid."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Validate National Card Registration data if nationalCardRegistrationSelection is true
                                if (nationalCardRegistrationSelection &&
                                    (_nationalCardRegistration == null ||
                                        _nationalCardRegistration!
                                            .nationalCardIssueDate
                                            .isBefore(DateTime(1900)))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "National card issue date is required and must be valid."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Validate Financial Penalty data if financialPenaltySelection is true
                                if (financialPenaltySelection &&
                                    (_financialPenalty == null ||
                                        _financialPenalty!.penaltyAmount <= 0 ||
                                        _financialPenalty!.penaltyDate
                                            .isBefore(DateTime(1900)))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Financial penalty details are required and must be valid."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Validate Seizure data if seizureSelection is true
                                if (seizureSelection &&
                                    (_seizureSections.isEmpty ||
                                        seizures!.any((section) =>
                                            section.seizureAmount.isEmpty ||
                                            section.seizureQuantity.isEmpty ||
                                            section.seizedGoods.isEmpty))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "All seizure sections must be filled with valid data."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Construct the PV object with the selected sections
                                final pv = PV(
                                  pvId:
                                      "${_pvNumberController.text.trim()}-${_selectedDate!.year}",
                                  pvNumber: int.tryParse(
                                          _pvNumberController.text.trim()) ??
                                      0,
                                  issueDate: _selectedDate ?? DateTime.now(),
                                  violationType:
                                      _violationTypeController.text.trim(),
                                  totalReparationAmount: double.tryParse(
                                          _illegalProfitController.text
                                              .trim()) ??
                                      0.0,
                                  totalNonFixed: double.tryParse(
                                          _nonFactorizationController.text
                                              .trim()) ??
                                      0.0,
                                  subsidizedGood:
                                      _subsidizedGoodController.text.trim(),
                                  offender: null,
                                  inspectors: [],
                                  seizures: seizures ?? [],
                                  closure: closureSelection
                                      ? _closure
                                      : null, // Pass closure if selected
                                  nationalCardRegistration:
                                      nationalCardRegistrationSelection
                                          ? _nationalCardRegistration
                                          : null,
                                  financialPenalty: financialPenaltySelection
                                      ? _financialPenalty
                                      : null,
                                  legalProceedings: leagalProceedingsSelection
                                      ? _legalProceedings
                                      : null,
                                );

                                // Use the controller
                                final pvController =
                                    context.read<PVController>();
                                await pvController.insertPVData(pv);

                                if (pvController.errorMessage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("PV successfully added!"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  _formKey.currentState!.reset();
                                  _rcController.clear();
                                  _pvNumberController.clear();
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
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Oops! Something went wrong. Please check your input and try again."),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
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
                              _pvNumberController.clear();
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
