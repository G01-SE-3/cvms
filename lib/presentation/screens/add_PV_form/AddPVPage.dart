import 'package:cvms/domain/entities/pv/closure.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/closure_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/dynamic_seizures_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/financial_penalty_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/legal_proceedings_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/national_card_registration_section.dart';
import 'package:cvms/presentation/screens/add_PV_form/widgets/sections/seizure_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'widgets/rc_field.dart';
import 'widgets/date_field.dart';
import 'widgets/text_field.dart';
import 'widgets/price_field.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/domain/entities/pv/legal_proceedings.dart';
import 'package:cvms/domain/entities/pv/financial_penalty.dart';
import 'package:cvms/domain/entities/pv/national_card_reg.dart';
import 'package:cvms/domain/entities/pv/seizure.dart';
import 'selection_globals.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
import 'package:cvms/presentation/screens/individual_offender_form/IndividualOffenderForm.dart';
import 'package:cvms/presentation/controllers/offender/offender_controller.dart';
import 'package:cvms/domain/entities/pv/offender.dart';
import 'package:cvms/presentation/screens/add_PV_form/constants/strings/addPVStrings.dart';

class AddPVPage extends StatefulWidget {
  const AddPVPage({super.key});

  @override
  _AddPVPageState createState() => _AddPVPageState();
}

class _AddPVPageState extends State<AddPVPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();

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

  String? _rcError;
  bool _isRcExisting = false;

  DateTime? _selectedDate;
  Map<String, dynamic>? _offenderDetails;

  final List<SeizureSection> _seizureSections = [];
  List<Seizure>? seizures = null;
  void _handleSeizuresUpdated(List<Seizure>? updatedSeizures) {
    setState(() {
      seizures = updatedSeizures;
    });
  }

  Closure? _closure = null;
  FinancialPenalty? _financialPenalty = null;
  LegalProceedings? _legalProceedings = null;
  NationalCardRegistration? _nationalCardRegistration = null;

  List<InspectorEntity> selectedInspectors = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AddPVStrings.pageTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
                    const SizedBox(height: 16),
                    CustomTextField(
                      placeholder: AddPVStrings.enterPVNumber,
                      isRequired: true,
                      controller: _pvNumberController,
                      isNumeric: true,
                    ),
                    const SizedBox(height: 12),
                    RcField(
                      controller: _rcController,
                      onRcChanged: (isRcExisting, error, details) {
                        setState(() {
                          _isRcExisting = isRcExisting;
                          _rcError = error;

                          // Store offender details if they exist
                          if (isRcExisting && details != null) {
                            _offenderDetails =
                                details; // Declare _offenderDetails in your parent widget
                          } else {
                            _offenderDetails = null;
                          }
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
                        label: Text(AddPVStrings.seeEODetails),
                      ),
                    ] else ...[
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BusinessOffenderForm(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_add),
                        label: Text(AddPVStrings.addBusinessOffender),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const IndividualOffenderForm(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_add),
                        label: Text(AddPVStrings.addIndividualOffender),
                      ),
                    ],
                    const SizedBox(height: 12),
                    DateField(
                      placeholder: AddPVStrings.selectPVDate,
                      isRequired: true,
                      onDateSelected: (date) {
                        setState(() {
                          _selectedDate = date;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: AddPVStrings.enterViolationType,
                      isRequired: true,
                      controller: _violationTypeController,
                    ),
                    const SizedBox(height: 12),
                    FutureBuilder<List<InspectorEntity>>(
                      future: _inspectorRepository.getAllInspectors(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              child: Text(AddPVStrings.noInspectorsFound));
                        } else {
                          final inspectors = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < 4; i++)
                                InspectorDropdownField(
                                  title: "Select Inspector ${i + 1}",
                                  inspectors: inspectors,
                                  onChanged: (selectedInspector) {
                                    setState(() {
                                      if (selectedInspector != null) {
                                        if (selectedInspectors.length > i) {
                                          selectedInspectors[i] =
                                              selectedInspector;
                                        } else {
                                          selectedInspectors
                                              .add(selectedInspector);
                                        }
                                      }
                                    });
                                  },
                                  selectedInspector:
                                      selectedInspectors.length > i
                                          ? selectedInspectors[i]
                                          : null,
                                ),
                              const SizedBox(height: 12),
                            ],
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder: AddPVStrings.totalNonFactorizationAmount,
                      controller: _nonFactorizationController,
                    ),
                    const SizedBox(height: 12),
                    PriceField(
                      placeholder: AddPVStrings.totalIllegalProfit,
                      controller: _illegalProfitController,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      placeholder: AddPVStrings.enterSubsidizedGood,
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
                                selectedInspectors.clear();
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
                              AddPVStrings.clear,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF545837),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  _selectedDate != null &&
                                  (_isRcExisting ||
                                      _rcController.text.isNotEmpty)) {
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
                                  offender: Offender(
                                      id: _offenderDetails!['offenderNumber']
                                          .toString(),
                                      type: _offenderDetails!['offenderType']
                                          .toString()),
                                  inspectors: selectedInspectors,
                                  seizures: seizures ?? [],
                                  closure: closureSelection ? _closure : null,
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
                                    selectedInspectors.clear();
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

class InspectorDropdownField extends StatelessWidget {
  final String title;
  final List<InspectorEntity> inspectors;
  final InspectorEntity? selectedInspector;
  final ValueChanged<InspectorEntity?> onChanged;

  const InspectorDropdownField({
    Key? key,
    required this.title,
    required this.inspectors,
    required this.onChanged,
    this.selectedInspector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 800, // Adjust the width as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<InspectorEntity>(
              value: selectedInspector,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: title,
                labelStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: const Color(0xFFDDE5CD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
              dropdownColor: const Color(0xFFDDE5CD),
              items: inspectors.map<DropdownMenuItem<InspectorEntity>>(
                (InspectorEntity inspector) {
                  return DropdownMenuItem<InspectorEntity>(
                    value: inspector,
                    child: Text(
                      "${inspector.name} ${inspector.surname}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              ).toList(),
              onChanged: onChanged,
              style: const TextStyle(color: Color(0xFF545837)),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color.fromARGB(255, 43, 72, 44),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
