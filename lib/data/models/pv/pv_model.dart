import 'closure_model.dart';
import 'financial_penalty_model.dart';
import 'national_card_reg_model.dart';
import 'inspector_model.dart';
import 'seizure_model.dart';
import 'offender.dart';
import 'package:cvms/domain/entities/pv/pv.dart';

class PVModel {
  final String pvId;
  final int pvNumber;
  final DateTime issueDate;
  final String violationType;
  final double? totalReparationAmount;
  final double? totalNonFixed;
  final String? subsidizedGood;

  final OffenderModel? offender;
  final List<SeizureModel> seizures; // List of seizures associated with the PV
  final ClosureModel? closure; // Optional closure associated with the PV
  final List<InspectorModel> inspectors; // List of inspectors for this PV
  final NationalCardRegistrationModel?
      nationalCardRegistration; // Optional registration
  final FinancialPenaltyModel? financialPenalty; // Optional financial penalty

  PVModel({
    required this.pvId,
    required this.pvNumber,
    required this.issueDate,
    required this.violationType,
    required this.offender,
    required this.inspectors,
    this.totalReparationAmount,
    this.totalNonFixed,
    this.subsidizedGood,
    this.seizures = const [],
    this.closure,
    this.nationalCardRegistration,
    this.financialPenalty,
  });

  PV toEntity() {
    return PV(
      pvId: pvId,
      pvNumber: pvNumber,
      issueDate: issueDate,
      violationType: violationType,
      totalReparationAmount: totalReparationAmount,
      totalNonFixed: totalNonFixed,
      subsidizedGood: subsidizedGood,
      seizures: seizures.map((seizure) => seizure.toEntity()).toList(),
      closure: closure?.toEntity(),
      inspectors: inspectors.map((inspector) => inspector.toEntity()).toList(),
      nationalCardRegistration: nationalCardRegistration?.toEntity(),
      financialPenalty: financialPenalty?.toEntity(),
      offender: offender?.toEntity(),
    );
  }
}
