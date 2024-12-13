/*
import 'package:cvms/domain/entities/pv/closure.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/closure_section.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/dynamic_seizures_section.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/financial_penalty_section.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/legal_proceedings_section.dart';
import 'package:cvms/presentation/screens/add_PV_form.dart/widgets/sections/national_card_registration_section.dart';
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

class EditPVPage extends StatefulWidget {
  final int pvId;

  const EditPVPage({super.key, required this.pvId});

  @override
  _EditPVPageState createState() => _EditPVPageState();
}

class _EditPVPageState extends State<EditPVPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _rcController = TextEditingController();
  final TextEditingController _pvNumberController = TextEditingController();
  final TextEditingController _violationTypeController = TextEditingController();
  final TextEditingController _nonFactorizationController = TextEditingController();
  final TextEditingController _illegalProfitController = TextEditingController();
  final TextEditingController _subsidizedGoodController = TextEditingController();

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

  DateTime? _selectedDate; 

  // Track Seizure Sections
  final List<SeizureSection> _seizureSections = [];

  List<Seizure>? seizures = null;

  Closure? _closure = null;
  FinancialPenalty? _financialPenalty = null;
  LegalProceedings? _legalProceedings = null;
  NationalCardRegistration? _nationalCardRegistration = null;

  @override
  void initState() {
    super.initState();
    _fetchPVData();
  }

  void _fetchPVData() async {
    final pvController = context.read<PVController>();
    final pv = await pvController.getPVById(widget.pvId);

    if (pv != null) {
      setState(() {
        _pvNumberController.text = pv.pvNumber.toString();
        _rcController.text = pv.rc ?? '';
        _violationTypeController.text = pv.violationType;
        _nonFactorizationController.text = pv.totalNonFixed.toString();
        _illegalProfitController.text = pv.totalReparationAmount.toString();
        _subsidizedGoodController.text = pv.subsidizedGood;

        _selectedDate = pv.issueDate;
        seizures = pv.seizures;

        _closure = pv.closure;
        _financialPenalty = pv.financialPenalty;
        _legalProceedings = pv.legalProceedings;
        _nationalCardRegistration = pv.nationalCardRegistration;

        // Handle Officers
        _selectedOfficer1 = pv.inspectors.length > 0 ? pv.inspectors[0] : null;
        _selectedOfficer2 = pv.inspectors.length > 1 ? pv.inspectors[1] : null;
        _selectedOfficer3 = pv.inspectors.length > 2 ? pv.inspectors[2] : null;
        _selectedOfficer4 = pv.inspectors.length > 3 ? pv.inspectors[3] : null;
      });
    }
  }

  void _handleSeizuresUpdated(List<Seizure>? updatedSeizures) {
    setState(() {
      seizures = updatedSeizures;
    });
  }

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
                      "Edit PV",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      placeholder: "Enter PV Number",
                      isRequired: true,
                      controller: _pvNumberController,
                      isNumeric: true,
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
                      selectedDate: _selectedDate,

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
                        setState(() {
                          _closure = closure;
                        });
                      },
                    ),
                    FinancialPenaltySection(
                      onPenaltyUpdated: (penalty) {
                        setState(() {
                          _financialPenalty = penalty;
                        });
                      },
                    ),
                    LegalProceedingsSection(
                      onLegalProceedingsUpdated: (legalProceedings) {
                        setState(() {
                          _legalProceedings = legalProceedings;
                        });
                      },
                    ),
                    NationalCardRegistrationSection(
                      onNationalCardRegistrationUpdated:
                          (nationalCardRegistration) {
                        setState(() {
                          _nationalCardRegistration = nationalCardRegistration;
                        });
                      },
                    ),
                    DynamicSeizureSections(
                      onSeizuresUpdated: _handleSeizuresUpdated,
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
                                // Validate all data...
                                // Construct the PV object with updated values

                                final pv = PV(
                                  pvId: "${_pvNumberController.text.trim()}-${_selectedDate!.year}",
                                  pvNumber: int.tryParse(_pvNumberController.text.trim()) ?? 0,
                                  issueDate: _selectedDate ?? DateTime.now(),
                                  violationType: _violationTypeController.text.trim(),
                                  totalReparationAmount: double.tryParse(_illegalProfitController.text.trim()) ?? 0.0,
                                  totalNonFixed: double.tryParse(_nonFactorizationController.text.trim()) ?? 0.0,
                                  subsidizedGood: _subsidizedGoodController.text.trim(),
                                  inspectors: [
                                    _selectedOfficer1 ?? '',
                                    _selectedOfficer2 ?? '',
                                    _selectedOfficer3 ?? '',
                                    _selectedOfficer4 ?? ''
                                  ],
                                  seizures: seizures ?? [],
                                  closure: _closure,
                                  nationalCardRegistration: _nationalCardRegistration,
                                  financialPenalty: _financialPenalty,
                                  legalProceedings: _legalProceedings,
                                );

                                final pvController = context.read<PVController>();
                                await pvController.updatePVData(pv);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("PV successfully updated!"),
                                    backgroundColor: Colors.green,
                                  ),
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
*/