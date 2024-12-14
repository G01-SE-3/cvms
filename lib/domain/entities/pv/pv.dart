import 'closure.dart';
import 'financial_penalty.dart';
import 'seizure.dart';
import 'national_card_reg.dart';
import 'offender.dart';
import 'legal_proceedings.dart';
import 'package:cvms/data/models/pv/pv_model.dart';
import 'package:cvms/domain/entities/inspector/inspector.dart';

class PV {
  final String pvId;
  final int pvNumber;
  final DateTime issueDate;
  final String violationType;
  final double? totalReparationAmount;
  final double? totalNonFixed;
  final String? subsidizedGood;

  final Offender? offender;
  final List<Seizure> seizures; // List of seizures associated with the PV
  final Closure? closure; // Optional closure associated with the PV
  final List<InspectorEntity> inspectors; // List of inspectors for this PV
  final NationalCardRegistration?
      nationalCardRegistration; // Optional registration
  final FinancialPenalty? financialPenalty; // Optional financial penalty
  final LegalProceedings? legalProceedings; // Optional financial penalty

  PV(
      {required this.pvId,
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
      this.legalProceedings});

  PVModel toModel() {
    return PVModel(
      pvId: pvId,
      pvNumber: pvNumber,
      issueDate: issueDate,
      violationType: violationType,
      totalReparationAmount: totalReparationAmount,
      totalNonFixed: totalNonFixed,
      subsidizedGood: subsidizedGood,
      seizures: seizures.map((seizure) => seizure.toModel()).toList(),
      closure: closure?.toModel(),
      inspectors: inspectors.map((inspector) => inspector.toModel()).toList(),
      nationalCardRegistration: nationalCardRegistration?.toModel(),
      financialPenalty: financialPenalty?.toModel(),
      offender: offender?.toModel(),
    );
  }
}
