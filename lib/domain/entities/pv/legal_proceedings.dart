import 'package:cvms/data/models/pv/legal_proceedings_model.dart';

class LegalProceedings {
  final String? referralToJusticeNumber; // Referral number for justice
  final DateTime? referralToJusticeDate; // Date of referral
  final String? jurisdiction; // Jurisdiction where the case is handled
  final String? legalProvisions; // Legal provisions involved in the case
  final String? courtDecisionNumber; // Court decision number
  final DateTime? courtDecisionDate; // Court decision date
  final double? courtImposedFineAmount; // Fine imposed by the court

  // Constructor
  LegalProceedings({
    this.referralToJusticeNumber,
    this.referralToJusticeDate,
    this.jurisdiction,
    this.legalProvisions,
    this.courtDecisionNumber,
    this.courtDecisionDate,
    this.courtImposedFineAmount,
  });

  LegalProceedingsModel toModel() {
    return LegalProceedingsModel(
      referralToJusticeNumber: referralToJusticeNumber,
      referralToJusticeDate: referralToJusticeDate,
      jurisdiction: jurisdiction,
      legalProvisions: legalProvisions,
      courtDecisionNumber: courtDecisionNumber,
      courtDecisionDate: courtDecisionDate,
      courtImposedFineAmount: courtImposedFineAmount,
    );
  }
}
