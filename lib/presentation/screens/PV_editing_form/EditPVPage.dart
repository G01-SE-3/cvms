import 'package:cvms/domain/entities/pv/closure.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/closure_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/dynamic_seizures_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/financial_penalty_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/legal_proceedings_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/national_card_registration_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/sections/seizure_section.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/date_field.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/text_field.dart';
import 'package:cvms/presentation/screens/PV_editing_form/widgets/price_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/domain/entities/pv/legal_proceedings.dart';
import 'package:cvms/domain/entities/pv/financial_penalty.dart';
import 'package:cvms/domain/entities/pv/national_card_reg.dart';
import 'package:cvms/domain/entities/pv/seizure.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import 'package:cvms/data/repositories/inspector/inspector_repository_impl.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';

class EditPVPage extends StatefulWidget {
  final String pvId;

  const EditPVPage({Key? key, required this.pvId}) : super(key: key);

  @override
  _EditPVPageState createState() => _EditPVPageState();
}

class _EditPVPageState extends State<EditPVPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  final InspectorRepository _inspectorRepository = InspectorRepositoryImpl();

  final TextEditingController _pvNumberController = TextEditingController();
  final TextEditingController _violationTypeController =
      TextEditingController();
  final TextEditingController _nonFactorizationController =
      TextEditingController();
  final TextEditingController _illegalProfitController =
      TextEditingController();
  final TextEditingController _subsidizedGoodController =
      TextEditingController();
  final TextEditingController _rcController = TextEditingController();

  DateTime? _selectedDate;

  final List<SeizureSection> _seizureSections = [];
  List<Seizure>? seizures = null;
  void _handleSeizuresUpdated(List<Seizure>? updatedSeizures) {
    setState(() {
      seizures = updatedSeizures;
    });
  }

  Closure? _closure;
  FinancialPenalty? _financialPenalty;
  LegalProceedings? _legalProceedings;
  NationalCardRegistration? _nationalCardRegistration;

  List<InspectorEntity> selectedInspectors = [];

  @override
  void initState() {
    super.initState();
    context.read<PVController>().loadPV(widget.pvId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit PV",
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
                    Consumer<PVController>(
                      builder: (context, pvController, child) {
                        if (pvController.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (pvController.errorMessage != null) {
                          return Center(
                              child: Text(
                                  'Error loading PV details: ${pvController.errorMessage!}'));
                        } else if (pvController.pv == null) {
                          return const Center(child: Text('No PV data found'));
                        } else {
                          final pv = pvController.pv!;
                          _pvNumberController.text = pv.pvNumber.toString();
                          _violationTypeController.text = pv.violationType;
                          _nonFactorizationController.text =
                              pv.totalNonFixed?.toString() ?? '';
                          _illegalProfitController.text =
                              pv.totalReparationAmount?.toString() ?? '';
                          _subsidizedGoodController.text =
                              pv.subsidizedGood ?? '';
                          _selectedDate = pv.issueDate;
                          selectedInspectors = pv.inspectors;
                          seizures = pv.seizures;
                          _closure = pv.closure;
                          _financialPenalty = pv.financialPenalty;
                          _legalProceedings = pv.legalProceedings;
                          _nationalCardRegistration =
                              pv.nationalCardRegistration;

                          return Column(
                            children: [
                              CustomTextField(
                                placeholder: "Enter PV Number",
                                isRequired: true,
                                controller: _pvNumberController,
                                isNumeric: true,
                                // should make readonly
                              ),
                              const SizedBox(height: 12),
                              DateField(
                                placeholder: "Select PV Date",
                                isRequired: true,
                                onDateSelected: (date) {
                                  setState(() {
                                    _selectedDate = date;
                                  });
                                },
                                initialDate: _selectedDate,
                              ),
                              const SizedBox(height: 12),
                              CustomTextField(
                                placeholder: "Enter Violation Type",
                                isRequired: true,
                                controller: _violationTypeController,
                              ),
                              const SizedBox(height: 12),
                              // Dynamic Inspector Dropdowns
                              FutureBuilder<List<InspectorEntity>>(
                                future: _inspectorRepository.getAllInspectors(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    return Center(
                                        child: Text('No inspectors found'));
                                  } else {
                                    final inspectors = snapshot.data!;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          InspectorDropdownField(
                                            title: "Select Inspector ${i + 1}",
                                            inspectors: inspectors,
                                            onChanged: (selectedInspector) {
                                              setState(() {
                                                if (selectedInspector != null) {
                                                  if (selectedInspectors
                                                          .length >
                                                      i) {
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
                                closure: _closure,
                              ),
                              FinancialPenaltySection(
                                onPenaltyUpdated: (penalty) {
                                  setState(() {
                                    _financialPenalty = penalty;
                                    print(
                                        'Parent received penalty: $_financialPenalty');
                                  });
                                },
                                initialPenaltyData: _financialPenalty,
                              ),
                              LegalProceedingsSection(
                                onLegalProceedingsUpdated: (legalProceedings) {
                                  setState(() {
                                    _legalProceedings = legalProceedings;
                                  });
                                },
                                initialLegalProceedingsData: _legalProceedings,
                              ),
                              NationalCardRegistrationSection(
                                onNationalCardRegistrationUpdated:
                                    (nationalCardRegistration) {
                                  setState(() {
                                    _nationalCardRegistration =
                                        nationalCardRegistration;
                                  });
                                },
                                initialNationalCardRegistrationData:
                                    _nationalCardRegistration,
                              ),
                              DynamicSeizureSections(
                                onSeizuresUpdated: _handleSeizuresUpdated,
                                initialSeizures: seizures,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                        });
                                      },
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size(160, 50),
                                        side: const BorderSide(
                                            color: Color(0xFF545837)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate() &&
                                            _selectedDate != null) {
                                          final pv = PV(
                                            pvId:
                                                "${_pvNumberController.text.trim()}-${_selectedDate!.year}", // Use the existing PV ID
                                            pvNumber: int.tryParse(
                                                    _pvNumberController.text
                                                        .trim()) ??
                                                0,
                                            issueDate:
                                                _selectedDate ?? DateTime.now(),
                                            violationType:
                                                _violationTypeController.text
                                                    .trim(),
                                            totalReparationAmount:
                                                double.tryParse(
                                                        _illegalProfitController
                                                            .text
                                                            .trim()) ??
                                                    0.0,
                                            totalNonFixed: double.tryParse(
                                                    _nonFactorizationController
                                                        .text
                                                        .trim()) ??
                                                0.0,
                                            subsidizedGood:
                                                _subsidizedGoodController.text
                                                    .trim(),
                                            offender:
                                                null, // Handle offender update separately
                                            inspectors: selectedInspectors,
                                            seizures: seizures ?? [],
                                            closure: _closure,
                                            nationalCardRegistration:
                                                _nationalCardRegistration,
                                            financialPenalty: _financialPenalty,
                                            legalProceedings: _legalProceedings,
                                          );

                                          final pvController =
                                              context.read<PVController>();
                                          await pvController.updatePVData(pv);

                                          if (pvController.errorMessage ==
                                              null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "PV successfully updated!"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
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
                                        backgroundColor:
                                            const Color(0xFF545837),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                          );
                        }
                      },
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
